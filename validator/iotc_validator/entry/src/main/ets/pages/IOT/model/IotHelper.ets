/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { AsyncCallback, BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { DeviceManager } from 'iotmanagementkit';
import Timers from './Timers';
import IotConstants, { analysisPayload, ConnectType, DeviceConfig, DeviceStatus,
  extractDeviceName,
  InfDeviceState } from './IotConstants';
import IotDevice from './IotDevice';
import Logger from '../../model/Logger';
import { SessionSubscriber } from './SessionSubscriber';
import commonEventManager from '@ohos.commonEventManager';

export default class IotHelper {
  private static instance: IotHelper;
  private isInit = false;
  private connectSessionMap: Map<string, DeviceManager.ConnectSession> = new Map();
  private connectDeviceList: Array<IotDevice> = [];
  private deviceStateTimers: Map<string, Timers<InfDeviceState[]>> = new Map();
  private messageReceivers = new Map<string, Callback<InfDeviceState[]>>();
  private connectStateMap = new Map<string, Callback<number>>();
  private statusCodeReceivers = new Map<string, Callback<number>>();
  private sessionSubscriber: SessionSubscriber | undefined = undefined;
  private static deviceConfig: DeviceConfig | null = null;

  static getInstance(): IotHelper {
    if (IotHelper.instance == null) {
      IotHelper.instance = new IotHelper();
    }
    return IotHelper.instance;
  }

  registerMessageReceivers(name: string, callBack: Callback<InfDeviceState[]>) {
    if (name.length > 0) {
      this.messageReceivers.set(name, callBack);
    }
  }

  unRegisterMessageReceivers(name: string) {
    this.messageReceivers.delete(name);
  }

  registerConnectStateChanged(name: string, callBack: Callback<number>) {
    if (name.length > 0) {
      this.connectStateMap.set(name, callBack);
    }
  }

  unRegisterConnectStateChanged(name: string) {
    this.connectStateMap.delete(name);
  }

  registerStatusCodeReceiver(name: string, callback: Callback<number>) {
    if (name.length > 0) {
      this.statusCodeReceivers.set(name, callback);
    }
  }

  unRegisterStatusCodeReceiver(name: string) {
    this.statusCodeReceivers.delete(name);
  }

  private addConnectSession(udid: string, connectSession?: DeviceManager.ConnectSession) {
    if (connectSession != undefined) {
      this.connectSessionMap.set(udid, connectSession);
    }
  }

  private getConnectSession(udid?: string) {
    if (udid == undefined) {
      return undefined;
    }
    return this.connectSessionMap.get(udid);
  }

  private deleteConnectSession(udid?: string) {
    if (udid == undefined) {
      return;
    }
    this.connectSessionMap.delete(udid);
  }

  private addConnectDevice(iotDevice: IotDevice) {
    this.connectDeviceList.push(iotDevice);
  }

  private deleteConnectDevice(iotDevice?: IotDevice) {
    if (iotDevice == undefined) {
      return;
    }
    this.connectDeviceList =
      this.connectDeviceList.filter((device) => device.getUnionCode() != iotDevice.getUnionCode());
  }

  private dispatchSubscribeEventData(sidKeys: string, resultArray: InfDeviceState[]) {
    let timers = this.deviceStateTimers.get(sidKeys);
    timers?.executeSuccess(resultArray);
    this.deviceStateTimers.delete(sidKeys);
  }

  private subscribeEvent(udid: string, connectSession?: DeviceManager.ConnectSession) {
    this.sessionSubscriber = new SessionSubscriber((eventName: string, eventData: object) => {
      Logger.info(IotConstants.IOT_TAG, `subscribeEvent name: ${eventName}`);
      Logger.info(IotConstants.IOT_TAG, `subscribeEvent data: ${eventData['data']}`);
      if (eventName == IotConstants.ON_DEVICE_DATA_CHANGED) {
        try {
          let dataStr = eventData['data'] as string;
          let parsed: Record<string, number> = JSON.parse(dataStr);
          if (parsed && parsed.status !== undefined) {
            Logger.info(IotConstants.IOT_TAG, `subscribeEvent status code: ${parsed.status}`);
            this.statusCodeReceivers.forEach((func) => func(parsed.status));
            return;
          }
        } catch (e) {
          Logger.error(IotConstants.IOT_TAG, `subscribeEvent statusCodeReceivers: ${JSON.stringify(e)}`);
        }
        let resultArray = analysisPayload(eventData['data'] as string);
        if (resultArray != undefined && resultArray.length > 0 && resultArray[0].sid == IotConstants.SN_SERVICES) {
          this.dispatchSubscribeEventData(IotConstants.SN_SERVICES, resultArray);
          return;
        }
        if (this.deviceStateTimers.has(IotConstants.SID_ALL_SERVICES)) {
          this.dispatchSubscribeEventData(IotConstants.SID_ALL_SERVICES, resultArray);
        } else {
          let sidKeys = resultArray.map((item) => item.sid).join('-');
          this.dispatchSubscribeEventData(sidKeys, resultArray);
        }
        this.messageReceivers.forEach((func) => func(resultArray));
        let deviceStatus: DeviceStatus = {
          unionCode: this.getConnectDevice()?.getUnionCode(),
          services: resultArray
        }
        let option: commonEventManager.CommonEventPublishData = {
          data: JSON.stringify(deviceStatus)
        }
        commonEventManager.publish(`KEY_${IotConstants.ON_DEVICE_DATA_CHANGED}`, option, () => {
        })
      } else if (eventName == IotConstants.ON_CONNECT_STATE_CHANGED) {
        // 设备在线离线事件目前只支持ble
        let status: Record<string, number> = JSON.parse(eventData['data']);
        let newStatus = status && status['newStatus'];
        Logger.info(IotConstants.IOT_TAG, `subscribeEvent newStatus: ${newStatus}`);
        this.connectStateMap.forEach((func) => func(newStatus));
        if (newStatus == ConnectType.OFFLINE) {
          this.stopConnect();
        }
        let option: commonEventManager.CommonEventPublishData = {
          data: JSON.stringify(status)
        }
        commonEventManager.publish(`KEY_${IotConstants.ON_CONNECT_STATE_CHANGED}`, option, () => {
        })
      }
    });
    connectSession?.subscribeEvent(this.sessionSubscriber);
  }

  private unSubscribeEvent(connectSession?: DeviceManager.ConnectSession) {
    connectSession?.unsubscribeEvent(this.sessionSubscriber);
    this.sessionSubscriber = undefined;
  }

  public init(connect: common.UIAbilityContext) {
    DeviceManager.initDevice(connect);
    this.isInit = true;
  }

  public async deviceDiscovery(scanType: DeviceManager.ScanProtocol, callBack: AsyncCallback<IotDevice, void>) {
    Logger.debug(IotConstants.IOT_TAG, `IotHelper deviceDiscovery call scanType= ${scanType}`);
    if (!this.isInit) {
      const error: BusinessError<void> = {
        code: IotConstants.IOT_NOT_INIT,
        message: IotConstants.IOT_NOT_INIT_MSG,
        name: IotConstants.IOT_NAME,
      }
      callBack(error, null);
      return;
    }
    let duration = IotConstants.SCAN_DURATION;
    let request: DeviceManager.ScanRequest = new DeviceManager.ScanRequest();
    request.duration = duration;
    request.scanType = scanType;
    DeviceManager.startScanDevice(request, (error, data) => {
      Logger.debug(IotConstants.IOT_TAG, 'deviceDiscovery has result');
      if (error != undefined) {
        Logger.error(IotConstants.IOT_TAG, `deviceDiscovery code= ${error.code} message= ${error.message}`);
        return;
      }
      let scanResponse = data as DeviceManager.ScanResponse;
      scanResponse.scanResult.forEach(async (info) => {
        Logger.debug(IotConstants.IOT_TAG, `device prodId= ${info.prodId} protocol=${info.scannedProtocol}`);
        let iotDevice: IotDevice = new IotDevice(info);
        if (this.getConnectDevice()?.getUnionCode() != iotDevice.getUnionCode()) {
          callBack(undefined, iotDevice);
        }
      })
    })
  }

  public connectDevice(iotDevice: IotDevice, useSpeke: boolean = true): Promise<boolean> {
    Logger.debug(IotConstants.IOT_TAG, `IotHelper connectDevice call udid =${iotDevice.getUnionCode()}`);
    return this.executeDeviceConnect(iotDevice, useSpeke);
  }

  private executeDeviceConnect(iotDevice: IotDevice, useSpeke: boolean = true): Promise<boolean> {
    return new Promise(async (resolve, reject) => {
      try {
        let protocol = iotDevice.getScannedProtocol();
        let authInfo: Record<string, string> = {};
        let connectParam: Record<string, boolean> =
          { 'isNeedBound': false, 'isNeedUnbind': false, 'isNeedSpeke': useSpeke };
        let pinCode = useSpeke ? '01234567' : '';
        if (iotDevice.getPinCode() != undefined) {
          pinCode = iotDevice.getPinCode() as string;
          Logger.debug(IotConstants.IOT_TAG, `IotHelper connectDevice pinCode =${pinCode}`);
        }
        let request: DeviceManager.ConnectRequest =
          new DeviceManager.ConnectRequest(iotDevice.getUnionCode(), protocol, pinCode, authInfo, connectParam);
        Logger.debug(IotConstants.IOT_TAG, `IotHelper executeDeviceConnect request: ${JSON.stringify(request)}`)
        let response: DeviceManager.ConnectResponse = await DeviceManager.connectDevice(request);
        let connectSession = response.connectSession;
        // 配网需要修改逻辑
        this.addConnectSession(iotDevice.getUnionCode(), connectSession);
        this.subscribeEvent(iotDevice.getUnionCode(), connectSession);
        this.addConnectDevice(iotDevice);
        resolve(true);
      } catch (error) {
        Logger.error(IotConstants.IOT_TAG, `connect error code= ${error.code} message= ${error.data}`);
        reject(error);
      }
    })
  }

  public stopConnect() {
    let iotDevice = this.getConnectDevice();
    let udid = iotDevice?.getUnionCode();
    if (udid == undefined) {
      return;
    }
    Logger.debug(IotConstants.IOT_TAG, `stopConnect call udid =${udid}`);
    let connectSession = this.getConnectSession(udid);
    this.unSubscribeEvent(connectSession);
    connectSession?.release();
    this.deleteConnectSession(udid);
    this.deleteConnectDevice(iotDevice);
  }

  getConnectDevice(): IotDevice | undefined {
    if (this.connectDeviceList == undefined || this.connectDeviceList.length == 0) {
      return undefined;
    }
    return this.connectDeviceList[0];
  }

  queryDeviceState(sid: string[]): Promise<InfDeviceState[]> {
    Logger.debug(IotConstants.IOT_TAG, `queryDeviceState call`);
    if (sid.length == 0) {
      return Promise.reject(IotConstants.IOT_PARAMS_ERROR_MSG);
    }
    let sidArray = sid.map((sid) => {
      let res: Record<string, string> = {};
      res['sid'] = sid;
      return res;
    });
    let bodyStrings = JSON.stringify(sidArray);
    let sidKeys = sid.join('-');
    return this.executeDeviceQuery(bodyStrings, sidKeys);
  }

  queryDeviceAllServices(): Promise<InfDeviceState[]> {
    Logger.debug(IotConstants.IOT_TAG, `queryDeviceAllServices call`);
    let iotDevice = this.getConnectDevice();
    let connectSession = this.getConnectSession(iotDevice?.getUnionCode());
    if (connectSession == undefined) {
      return Promise.reject(IotConstants.IOT_CONNECT_ERROR_MSG);
    }
    let bodyStrings = `[{"sid":"${IotConstants.SID_ALL_SERVICES}"}]`;
    let sidKeys = IotConstants.SID_ALL_SERVICES;
    return this.executeDeviceQuery(bodyStrings, sidKeys);
  }

  private executeDeviceQuery(bodyStrings: string, timersKey: string): Promise<InfDeviceState[]> {
    Logger.debug(IotConstants.IOT_TAG, `executeDeviceQuery bodyStrings ${bodyStrings}`);
    let iotDevice = this.getConnectDevice();
    let connectSession = this.getConnectSession(iotDevice?.getUnionCode());
    if (connectSession == undefined) {
      return Promise.reject(IotConstants.IOT_CONNECT_ERROR_MSG);
    }
    return new Promise((resolve, reject) => {
      if (this.deviceStateTimers.has(timersKey)) {
        let oldTimers = this.deviceStateTimers.get(timersKey);
        oldTimers?.clearTimers();
        this.deviceStateTimers.delete(timersKey);
      }
      let timers = new Timers<InfDeviceState[]>((data) => {
        resolve(data);
      }, (error) => {
        reject(error);
      });
      this.deviceStateTimers.set(timersKey, timers);
      timers.start();
      connectSession?.sendCommand(IotConstants.CUSTOM_SEC_DATA, bodyStrings).then(() => {
        Logger.info(IotConstants.IOT_TAG, `executeDeviceQuery success`);
      }).catch((error: BusinessError) => {
        Logger.error(IotConstants.IOT_TAG, `executeDeviceQuery error code = ${error.code}`);
        let oldTimers = this.deviceStateTimers.get(timersKey);
        oldTimers?.executeFailed(error);
        this.deviceStateTimers.delete(timersKey);
      })
    });
  }

  controlDevice(sid: string, commend: number): Promise<InfDeviceState[]> {
    let bodyStrings = `[{\"sid\":\"${sid}\",\"data\":{\"on\":${commend}}}]`;
    Logger.debug(IotConstants.IOT_TAG, `controlDevice bodyStrings ${bodyStrings}`);
    let iotDevice = this.getConnectDevice();
    let connectSession = this.getConnectSession(iotDevice?.getUnionCode());
    if (connectSession == undefined) {
      return Promise.reject(IotConstants.IOT_CONNECT_ERROR_MSG);
    }
    return new Promise((resolve, reject) => {
      let timersKey = sid;
      if (this.deviceStateTimers.has(timersKey)) {
        let oldTimers = this.deviceStateTimers.get(timersKey);
        oldTimers?.clearTimers();
        this.deviceStateTimers.delete(timersKey);
      }
      let timers = new Timers<InfDeviceState[]>((data) => {
        resolve(data);
      }, (error) => {
        reject(error);
      });
      this.deviceStateTimers.set(timersKey, timers);
      timers.start();
      connectSession?.sendCommand(IotConstants.CUSTOM_SEC_DATA, bodyStrings).then(() => {
        Logger.info(IotConstants.IOT_TAG, `controlDevice success`);
      }).catch((error: BusinessError) => {
        Logger.error(IotConstants.IOT_TAG, `controlDevice error code = ${error.code}`);
        let oldTimers = this.deviceStateTimers.get(timersKey);
        oldTimers?.executeFailed(error);
        this.deviceStateTimers.delete(timersKey);
      })
    })
  }

  public setDeviceConfig(config: DeviceConfig): void {
    IotHelper.deviceConfig = config;
  }

  public getDeviceConfig(): DeviceConfig | null {
    return IotHelper.deviceConfig;
  }

  public clearDeviceConfig(): void {
    IotHelper.deviceConfig = null;
  }

  public filterDeviceByConfig(iotDevice: IotDevice): boolean {
    let config = IotHelper.deviceConfig;
    if (config == null) {
      return true;
    }
    if (config.prefix && config.prefix.length > 0 &&
      !iotDevice.getName().startsWith(config.prefix)) {
      return false;
    }
    if (config.deviceName && config.deviceName.length > 0) {
      let deviceName = extractDeviceName(iotDevice.getName());
      if (deviceName !== config.deviceName) {
        return false;
      }
    }
    if (config.pid && config.pid.length > 0 &&
      iotDevice.getProductID() !== config.pid) {
      return false;
    }
    if (config.sn && config.sn.length > 0 &&
      iotDevice.getRandomFlag() !== config.sn) {
      return false;
    }
    return true;
  }

  public getSpekeConfig(iotDevice: IotDevice): boolean {
    let config = IotHelper.deviceConfig;
    if (config == null) {
      return true;
    }
    if (config.enablePinCode) {
      if (config.pinCode && config.pinCode.length > 0) {
        iotDevice.setPinCode(config.pinCode);
      }
      return true;
    }
    return false;
  }

  public configureNetwork(ssid: string, password: string): Promise<boolean> {
    return new Promise((resolve, reject) => {
      let iotDevice = this.getConnectDevice();
      Logger.debug(IotConstants.IOT_TAG, `configureNetwork iotDevice ${JSON.stringify(iotDevice)}`);
      let connectSession = this.getConnectSession(iotDevice?.getUnionCode());
      if (connectSession == undefined) {
        reject(IotConstants.IOT_CONNECT_ERROR_MSG);
        return;
      }
      let netCfgMsg: Record<string, string> = {};
      // netCfgMsg数据先写死
      netCfgMsg['code'] = '1234567890123456'
      netCfgMsg['devId'] = '9876543210987654'
      netCfgMsg['psk'] = '12345678abcdef0123456789abcdef01'
      netCfgMsg['cloudPrimaryUrl'] = '1234567890123456'
      netCfgMsg['cloudStandbyUrl'] = '1234567890123456'
      netCfgMsg['ssid'] = ssid
      netCfgMsg['password'] = password
      let bodyStrings = JSON.stringify(netCfgMsg);
      connectSession.sendCommand(IotConstants.NET_CFG, bodyStrings).then(() => {
        Logger.info(IotConstants.IOT_TAG, `configureNetwork success`);
        resolve(true);
      }).catch((error: BusinessError) => {
        Logger.error(IotConstants.IOT_TAG, `configureNetwork error code = ${JSON.stringify(error)}`);
        reject(error);
      });
    });
  }

  public sendDeviceCommand(sid: string, data: string): Promise<void> {
    let bodyStrings = `[{"sid":"${sid}","data":{${data}}}]`;
    Logger.debug(IotConstants.IOT_TAG, `sendDeviceCommand bodyStrings ${bodyStrings}`);
    let iotDevice = this.getConnectDevice();
    let connectSession = this.getConnectSession(iotDevice?.getUnionCode());
    if (connectSession == undefined) {
      return Promise.reject(IotConstants.IOT_CONNECT_ERROR_MSG);
    }
    return new Promise((resolve, reject) => {
      connectSession?.sendCommand(IotConstants.CUSTOM_SEC_DATA, bodyStrings).then(() => {
        Logger.info(IotConstants.IOT_TAG, `sendDeviceCommand success`);
        resolve();
      }).catch((error: BusinessError) => {
        Logger.error(IotConstants.IOT_TAG, `sendDeviceCommand error code = ${error.code}`);
        reject(error);
      });
    });
  }
};