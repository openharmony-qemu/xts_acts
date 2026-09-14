'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterAll } from '../../../hypium/index';
import UsbMgr from '@ohos.usbManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Utils from './Util.test';

const TAG: string = "[USBDeviceStructTest]";
let domain: int = 0x0000;
let gEndpoint: UsbMgr.USBEndpoint | null = null;
let gInterface: UsbMgr.USBInterface | null = null;
let gConfig: UsbMgr.USBConfiguration | null = null;

interface EndpointInfo {
  usbInterface: UsbMgr.USBInterface;
  usbEndpoint: UsbMgr.USBEndpoint;
}

function getEndpoint(device: UsbMgr.USBDevice, direction: number, type: number): EndpointInfo | undefined {
  let usbConfigs: Array<UsbMgr.USBConfiguration> = device.configs;
  let usbInterface: UsbMgr.USBInterface | undefined = undefined;
  let usbEndpoint: UsbMgr.USBEndpoint | undefined = undefined;
  for (let i = 0; i < usbConfigs.length; i++) {
    let usbInterfaces: Array<UsbMgr.USBInterface> = usbConfigs[i]!.interfaces;
    for (let j = 0; j < usbInterfaces.length; j++) {
      let usbEndpoints: Array<UsbMgr.USBEndpoint> = usbInterfaces[j]!.endpoints;
      usbEndpoint = usbEndpoints.find((value: UsbMgr.USBEndpoint): boolean => {
        return value.direction === direction && value.type === type;
      });
      if (usbEndpoint !== undefined) {
        usbInterface = usbInterfaces[j]!;
        break;
      }
    }
    if (usbEndpoint !== undefined) {
      break;
    }
  }
  if (usbEndpoint === undefined || usbInterface === undefined) {
    hilog.error(domain, TAG, '%{public}s', 'getEndpoint: no matching endpoint found');
    return undefined;
  }
  return { usbInterface: usbInterface, usbEndpoint: usbEndpoint };
}

let gAccessory: UsbMgr.USBAccessory | null = null;
let gCallbackData: UsbMgr.SubmitTransferCallback | null = null;

const TRANSFER_TIMEOUT: int = 8000;
const GRACE_TIMEOUT: int = 500;

function refreshDevice(): boolean {
  gEndpoint = null;
  gInterface = null;
  gConfig = null;
  try {
    let deviceList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
    hilog.info(domain, TAG, '%{public}s', `refreshDevice: found ${deviceList.length} device(s)`);
    if (deviceList.length === 0) {
      return false;
    }
    let device: UsbMgr.USBDevice = deviceList[0]!;
    hilog.info(domain, TAG, '%{public}s',
      `device[0]: name=${device.name}, busNum=${device.busNum}, devAddress=${device.devAddress}, vendorId=${device.vendorId}, productId=${device.productId}, class=${device.clazz}, subClass=${device.subClass}, protocol=${device.protocol}, configs=${device.configs.length}`);
    let configs: Array<UsbMgr.USBConfiguration> = deviceList[0]!.configs;
    if (configs.length === 0) {
      hilog.info(domain, TAG, '%{public}s', 'refreshDevice: no configs');
      return false;
    }
    gConfig = configs[0]!;
    hilog.info(domain, TAG, '%{public}s',
      `config[0]: id=${gConfig!.id}, name=${gConfig!.name}, attributes=${gConfig!.attributes}, maxPower=${gConfig!.maxPower}, isSelfPowered=${gConfig!.isSelfPowered}, isRemoteWakeup=${gConfig!.isRemoteWakeup}, interfaces=${gConfig!.interfaces.length}`);
    let interfaces: Array<UsbMgr.USBInterface> = configs[0]!.interfaces;
    if (interfaces.length === 0) {
      hilog.info(domain, TAG, '%{public}s', 'refreshDevice: no interfaces');
      return false;
    }
    gInterface = interfaces[0]!;
    hilog.info(domain, TAG, '%{public}s',
      `interface[0]: id=${gInterface!.id}, name=${gInterface!.name}, class=${gInterface!.clazz}, subClass=${gInterface!.subClass}, protocol=${gInterface!.protocol}, alternateSetting=${gInterface!.alternateSetting}, endpoints=${gInterface!.endpoints.length}`);
    let endpoints: Array<UsbMgr.USBEndpoint> = interfaces[0]!.endpoints;
    if (endpoints.length === 0) {
      hilog.info(domain, TAG, '%{public}s', 'refreshDevice: no endpoints');
      return false;
    }
    gEndpoint = endpoints[0]!;
    hilog.info(domain, TAG, '%{public}s',
      `endpoint[0]: addr=${gEndpoint!.endpointAddr}, direction=${gEndpoint!.direction}, type=${gEndpoint!.type}, attributes=${gEndpoint!.attributes}, interval=${gEndpoint!.interval}, maxPacketSize=${gEndpoint!.maxPacketSize}, interfaceId=${gEndpoint!.interfaceId}`);
    return true;
  } catch (error) {
    hilog.error(domain, TAG, '%{public}s', `refreshDevice error: ${JSON.stringify(error)}`);
    return false;
  }
}

function refreshAccessory(): boolean {
  gAccessory = null;
  try {
    let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
    hilog.info(domain, TAG, '%{public}s', `refreshAccessory: found ${accList.length} accessory(ies)`);
    if (accList.length === 0) {
      return false;
    }
    gAccessory = accList[0]!;
    hilog.info(domain, TAG, '%{public}s',
      `accessory[0]: manufacturer=${gAccessory!.manufacturer}, product=${gAccessory!.product}, description=${gAccessory!.description}, version=${gAccessory!.version}, serial=${gAccessory!.serialNumber}`);
    return true;
  } catch (error) {
    hilog.info(domain, TAG, '%{public}s', `refreshAccessory no accessory: ${JSON.stringify(error)}`);
    return false;
  }
}

async function submitIsoTransfer(): Promise<boolean> {
  gCallbackData = null;
  let pipe: UsbMgr.USBDevicePipe | null = null;
  let isoIface: UsbMgr.USBInterface | null = null;
  let isClaimed: boolean = false;
  try {
    let deviceList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
    if (deviceList.length === 0) {
      return false;
    }
    let device: UsbMgr.USBDevice = deviceList[0]!;
    let endpointInfo: EndpointInfo | undefined = getEndpoint(device,
      UsbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE,
      UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS);
    if (endpointInfo === undefined) {
      hilog.info(domain, TAG, '%{public}s', 'submitIsoTransfer: no isochronous OUT endpoint found');
      return false;
    }
    let isoEndpoint: UsbMgr.USBEndpoint = endpointInfo.usbEndpoint;
    isoIface = endpointInfo.usbInterface;
    hilog.info(domain, TAG, '%{public}s',
      `submitIsoTransfer: found iso endpoint addr=${isoEndpoint.address}, type=${isoEndpoint.type}, direction=${isoEndpoint.direction}, maxPacketSize=${isoEndpoint.maxPacketSize}, iface id=${isoIface.id}`);
    if (!UsbMgr.hasRight(device.name)) {
      await UsbMgr.requestRight(device.name);
    }
    let devPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(device);
    pipe = devPipe;
    let iface: UsbMgr.USBInterface = isoIface;
    let ret: int = UsbMgr.claimInterface(devPipe, iface, true);
    if (ret !== 0) {
      hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer claimInterface failed, ret: ${ret}`);
      UsbMgr.closePipe(devPipe);
      return false;
    }
    isClaimed = true;
    let transferWait: Promise<int> = Utils.msSleep(TRANSFER_TIMEOUT);
    let endpointAddr: int = isoEndpoint.address;
    let transferParams: UsbMgr.UsbDataTransferParams = {
      devPipe: devPipe,
      flags: UsbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK,
      endpoint: endpointAddr,
      type: UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS,
      timeout: 5000,
      length: 16,
      callback: (err: BusinessError | null, data: UsbMgr.SubmitTransferCallback | undefined): void => {
        if (err !== null) {
          hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer callback err: ${err!.code}, ${err!.message}`);
        }
        if (data !== null && data !== undefined) {
          gCallbackData = data;
          hilog.info(domain, TAG, '%{public}s',
            `submitIsoTransfer callback: status=${data.status}, isoPacketDescs.length=${data.isoPacketDescs.length}`);
        }
        try {
          UsbMgr.releaseInterface(devPipe, iface);
          UsbMgr.closePipe(devPipe);
        } catch (cleanupError) {
          hilog.error(domain, TAG, '%{public}s',
            `submitIsoTransfer cleanup error: ${JSON.stringify(cleanupError)}`);
        }
      },
      userData: new Uint8Array(16),
      buffer: new Uint8Array(16),
      isoPacketCount: 1,
    };
    try {
      UsbMgr.usbSubmitTransfer(transferParams);
    } catch (submitError) {
      hilog.error(domain, TAG, '%{public}s',
        `submitIsoTransfer usbSubmitTransfer failed: ${JSON.stringify(submitError)}`);
      try {
        UsbMgr.releaseInterface(devPipe, iface);
        UsbMgr.closePipe(devPipe);
      } catch (cleanupError) {
        hilog.error(domain, TAG, '%{public}s',
          `submitIsoTransfer cleanup error: ${JSON.stringify(cleanupError)}`);
      }
      return false;
    }
    await transferWait;
    if (gCallbackData === null) {
      hilog.error(domain, TAG, '%{public}s', 'submitIsoTransfer transfer timeout, try cancel');
      try {
        UsbMgr.usbCancelTransfer(transferParams);
      } catch (cancelError) {
        hilog.error(domain, TAG, '%{public}s',
          `submitIsoTransfer usbCancelTransfer failed: ${JSON.stringify(cancelError)}`);
      }
      await Utils.msSleep(GRACE_TIMEOUT);
      if (gCallbackData === null) {
        try {
          UsbMgr.releaseInterface(devPipe, iface);
          UsbMgr.closePipe(devPipe);
        } catch (cleanupError) {
          hilog.error(domain, TAG, '%{public}s',
            `submitIsoTransfer cleanup error: ${JSON.stringify(cleanupError)}`);
        }
      }
      return false;
    }
    return true;
  } catch (error) {
    hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer error: ${JSON.stringify(error)}`);
    if (pipe !== null) {
      try {
        if (isoIface !== null && isClaimed) {
          UsbMgr.releaseInterface(pipe, isoIface);
        }
        UsbMgr.closePipe(pipe);
      } catch (cleanupError) {
        hilog.error(domain, TAG, '%{public}s',
          `submitIsoTransfer cleanup error: ${JSON.stringify(cleanupError)}`);
      }
    }
    return false;
  }
}

type NullCheckRef = UsbMgr.USBEndpoint | UsbMgr.USBInterface | UsbMgr.USBConfiguration |
UsbMgr.USBAccessory | UsbMgr.SubmitTransferCallback | null;

function skipIfNull(ref: NullCheckRef, label: string, done: () => void): boolean {
  if (ref === null) {
    hilog.info(domain, TAG, `no ${label}, skip`);
    done();
    return true;
  }
  return false;
}

function isValidTransferStatus(status: UsbMgr.UsbTransferStatus): boolean {
  return status === UsbMgr.UsbTransferStatus.TRANSFER_COMPLETED
    || status === UsbMgr.UsbTransferStatus.TRANSFER_ERROR
    || status === UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT
    || status === UsbMgr.UsbTransferStatus.TRANSFER_CANCELED
    || status === UsbMgr.UsbTransferStatus.TRANSFER_STALL
    || status === UsbMgr.UsbTransferStatus.TRANSFER_NO_DEVICE
    || status === UsbMgr.UsbTransferStatus.TRANSFER_OVERFLOW;
}

export default function USBDeviceStructTest(): void {
  describe('USBDeviceStructTest', (): void => {
    beforeAll(async (): Promise<void> => {
      let deviceReady: boolean = refreshDevice();
      let accessoryReady: boolean = refreshAccessory();
      if (deviceReady) {
        await submitIsoTransfer();
      }
    })

    beforeEach((): void => {
      refreshDevice();
      refreshAccessory();
    })

    afterAll((): void => {
      gEndpoint = null;
      gInterface = null;
      gConfig = null;
      gAccessory = null;
      gCallbackData = null;
    })

    /**
     * @tc.name   testUSBEndpointAttributes001
     * @tc.number SUB_USB_HostMgr_USBEndpoint_JS_attributes_Func_0100
     * @tc.desc   verify USBEndpoint.attributes is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBEndpointAttributes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gEndpoint, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let attributes: int = gEndpoint!.attributes;
          hilog.info(domain, TAG, 'attributes: ' + attributes);
          expect(attributes >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointAttributes001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBEndpointInterval001
     * @tc.number SUB_USB_HostMgr_USBEndpoint_JS_interval_Func_0100
     * @tc.desc   verify USBEndpoint.interval is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBEndpointInterval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gEndpoint, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let interval: int = gEndpoint!.interval;
          hilog.info(domain, TAG, 'interval: ' + interval);
          expect(interval >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointInterval001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBEndpointMaxPacketSize001
     * @tc.number SUB_USB_HostMgr_USBEndpoint_JS_maxPacketSize_Func_0100
     * @tc.desc   verify USBEndpoint.maxPacketSize is a positive int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBEndpointMaxPacketSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gEndpoint, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let maxPacketSize: int = gEndpoint!.maxPacketSize;
          hilog.info(domain, TAG, 'maxPacketSize: ' + maxPacketSize);
          expect(maxPacketSize > 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointMaxPacketSize001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBEndpointDirection001
     * @tc.number SUB_USB_HostMgr_USBEndpoint_JS_direction_Func_0100
     * @tc.desc   verify USBEndpoint.direction is a valid USBRequestDirection enum from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBEndpointDirection001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gEndpoint, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let direction: UsbMgr.USBRequestDirection = gEndpoint!.direction;
          hilog.info(domain, TAG, 'direction: ' + direction);
          expect(direction === UsbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE
            || direction === UsbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointDirection001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBEndpointAddr001
     * @tc.number SUB_USB_HostMgr_USBEndpoint_JS_endpointAddr_Func_0100
     * @tc.desc   verify USBEndpoint.endpointAddr is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBEndpointAddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gEndpoint, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let endpointAddr: int = gEndpoint!.endpointAddr;
          hilog.info(domain, TAG, 'endpointAddr: ' + endpointAddr);
          expect(endpointAddr >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointAddr001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBEndpointType001
     * @tc.number SUB_USB_HostMgr_USBEndpoint_JS_type_Func_0100
     * @tc.desc   verify USBEndpoint.type is a valid UsbEndpointTransferType enum from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBEndpointType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gEndpoint, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let type: int = gEndpoint!.type;
          hilog.info(domain, TAG, 'type: ' + type);
          expect(type === UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS
            || type === UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK
            || type === UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointType001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBEndpointInterfaceId001
     * @tc.number SUB_USB_HostMgr_USBEndpoint_JS_interfaceId_Func_0100
     * @tc.desc   verify USBEndpoint.interfaceId matches the owning USBInterface.id from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBEndpointInterfaceId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gEndpoint, 'device', done) || skipIfNull(gInterface, 'interface', done)) {
          return Promise.resolve();
        }
        try {
          let interfaceId: int = gEndpoint!.interfaceId;
          hilog.info(domain, TAG, 'interfaceId: ' + interfaceId + ', interface.id: ' + gInterface!.id);
          expect(interfaceId === gInterface!.id).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointInterfaceId001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBInterfaceId001
     * @tc.number SUB_USB_HostMgr_USBInterface_JS_id_Func_0100
     * @tc.desc   verify USBInterface.id is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBInterfaceId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gInterface, 'interface', done)) {
          return Promise.resolve();
        }
        try {
          let id: int = gInterface!.id;
          hilog.info(domain, TAG, 'id: ' + id);
          expect(id >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceId001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBInterfaceProtocol001
     * @tc.number SUB_USB_HostMgr_USBInterface_JS_protocol_Func_0100
     * @tc.desc   verify USBInterface.protocol is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBInterfaceProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gInterface, 'interface', done)) {
          return Promise.resolve();
        }
        try {
          let protocol: int = gInterface!.protocol;
          hilog.info(domain, TAG, 'protocol: ' + protocol);
          expect(protocol >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceProtocol001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBInterfaceClazz001
     * @tc.number SUB_USB_HostMgr_USBInterface_JS_clazz_Func_0100
     * @tc.desc   verify USBInterface.clazz is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBInterfaceClazz001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gInterface, 'interface', done)) {
          return Promise.resolve();
        }
        try {
          let clazz: int = gInterface!.clazz;
          hilog.info(domain, TAG, 'clazz: ' + clazz);
          expect(clazz >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceClazz001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBInterfaceSubClass001
     * @tc.number SUB_USB_HostMgr_USBInterface_JS_subClass_Func_0100
     * @tc.desc   verify USBInterface.subClass is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBInterfaceSubClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gInterface, 'interface', done)) {
          return Promise.resolve();
        }
        try {
          let subClass: int = gInterface!.subClass;
          hilog.info(domain, TAG, 'subClass: ' + subClass);
          expect(subClass >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceSubClass001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBInterfaceAlternateSetting001
     * @tc.number SUB_USB_HostMgr_USBInterface_JS_alternateSetting_Func_0100
     * @tc.desc   verify USBInterface.alternateSetting is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBInterfaceAlternateSetting001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gInterface, 'interface', done)) {
          return Promise.resolve();
        }
        try {
          let alternateSetting: int = gInterface!.alternateSetting;
          hilog.info(domain, TAG, 'alternateSetting: ' + alternateSetting);
          expect(alternateSetting >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceAlternateSetting001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBInterfaceName001
     * @tc.number SUB_USB_HostMgr_USBInterface_JS_name_Func_0100
     * @tc.desc   verify USBInterface.name is a string from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBInterfaceName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gInterface, 'interface', done)) {
          return Promise.resolve();
        }
        try {
          let name: string = gInterface!.name;
          hilog.info(domain, TAG, 'name: ' + name);
          expect(typeof (name)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceName001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBConfigId001
     * @tc.number SUB_USB_HostMgr_USBConfiguration_JS_id_Func_0100
     * @tc.desc   verify USBConfiguration.id is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBConfigId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gConfig, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let id: int = gConfig!.id;
          hilog.info(domain, TAG, 'config id: ' + id);
          expect(id >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigId001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBConfigAttributes001
     * @tc.number SUB_USB_HostMgr_USBConfiguration_JS_attributes_Func_0100
     * @tc.desc   verify USBConfiguration.attributes is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBConfigAttributes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gConfig, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let attributes: int = gConfig!.attributes;
          hilog.info(domain, TAG, 'config attributes: ' + attributes);
          expect(attributes >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigAttributes001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBConfigMaxPower001
     * @tc.number SUB_USB_HostMgr_USBConfiguration_JS_maxPower_Func_0100
     * @tc.desc   verify USBConfiguration.maxPower is a non-negative int from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBConfigMaxPower001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gConfig, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let maxPower: int = gConfig!.maxPower;
          hilog.info(domain, TAG, 'config maxPower: ' + maxPower);
          expect(maxPower >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigMaxPower001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBConfigName001
     * @tc.number SUB_USB_HostMgr_USBConfiguration_JS_name_Func_0100
     * @tc.desc   verify USBConfiguration.name is a string from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBConfigName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gConfig, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let name: string = gConfig!.name;
          hilog.info(domain, TAG, 'config name: ' + name);
          expect(typeof (name)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigName001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBConfigIsRemoteWakeup001
     * @tc.number SUB_USB_HostMgr_USBConfiguration_JS_isRemoteWakeup_Func_0100
     * @tc.desc   verify USBConfiguration.isRemoteWakeup is a boolean from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBConfigIsRemoteWakeup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gConfig, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let isRemoteWakeup: boolean = gConfig!.isRemoteWakeup;
          hilog.info(domain, TAG, 'config isRemoteWakeup: ' + isRemoteWakeup);
          expect(typeof (isRemoteWakeup)).assertEqual("boolean");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigIsRemoteWakeup001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBConfigIsSelfPowered001
     * @tc.number SUB_USB_HostMgr_USBConfiguration_JS_isSelfPowered_Func_0100
     * @tc.desc   verify USBConfiguration.isSelfPowered is a boolean from real device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBConfigIsSelfPowered001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gConfig, 'device', done)) {
          return Promise.resolve();
        }
        try {
          let isSelfPowered: boolean = gConfig!.isSelfPowered;
          hilog.info(domain, TAG, 'config isSelfPowered: ' + isSelfPowered);
          expect(typeof (isSelfPowered)).assertEqual("boolean");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigIsSelfPowered001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBAccessoryManufacturer001
     * @tc.number SUB_USB_HostMgr_USBAccessory_JS_manufacturer_Func_0100
     * @tc.desc   verify USBAccessory.manufacturer is a string from real accessory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBAccessoryManufacturer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gAccessory, 'accessory', done)) {
          return Promise.resolve();
        }
        try {
          let manufacturer: string = gAccessory!.manufacturer;
          hilog.info(domain, TAG, 'accessory manufacturer: ' + manufacturer);
          expect(typeof (manufacturer)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessoryManufacturer001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBAccessoryProduct001
     * @tc.number SUB_USB_HostMgr_USBAccessory_JS_product_Func_0100
     * @tc.desc   verify USBAccessory.product is a string from real accessory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBAccessoryProduct001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gAccessory, 'accessory', done)) {
          return Promise.resolve();
        }
        try {
          let product: string = gAccessory!.product;
          hilog.info(domain, TAG, 'accessory product: ' + product);
          expect(typeof (product)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessoryProduct001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBAccessoryDescription001
     * @tc.number SUB_USB_HostMgr_USBAccessory_JS_description_Func_0100
     * @tc.desc   verify USBAccessory.description is a string from real accessory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBAccessoryDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gAccessory, 'accessory', done)) {
          return Promise.resolve();
        }
        try {
          let description: string = gAccessory!.description;
          hilog.info(domain, TAG, 'accessory description: ' + description);
          expect(typeof (description)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessoryDescription001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBAccessoryVersion001
     * @tc.number SUB_USB_HostMgr_USBAccessory_JS_version_Func_0100
     * @tc.desc   verify USBAccessory.version is a string from real accessory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBAccessoryVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gAccessory, 'accessory', done)) {
          return Promise.resolve();
        }
        try {
          let version: string = gAccessory!.version;
          hilog.info(domain, TAG, 'accessory version: ' + version);
          expect(typeof (version)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessoryVersion001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUSBAccessorySerialNumber001
     * @tc.number SUB_USB_HostMgr_USBAccessory_JS_serialNumber_Func_0100
     * @tc.desc   verify USBAccessory.serialNumber is a string from real accessory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUSBAccessorySerialNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gAccessory, 'accessory', done)) {
          return Promise.resolve();
        }
        try {
          let serialNumber: string = gAccessory!.serialNumber;
          hilog.info(domain, TAG, 'accessory serialNumber: ' + serialNumber);
          expect(typeof (serialNumber)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessorySerialNumber001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUsbTransferStatusCompleted001
     * @tc.number SUB_USB_HostMgr_UsbTransferStatus_JS_TRANSFER_COMPLETED_Func_0100
     * @tc.desc   verify UsbTransferStatus.TRANSFER_COMPLETED equals 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbTransferStatusCompleted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        hilog.info(domain, TAG, 'testUsbTransferStatusCompleted001 start');
        expect(UsbMgr.UsbTransferStatus.TRANSFER_COMPLETED).assertEqual(0);
        done();
      })

    /**
     * @tc.name   testUsbTransferStatusError001
     * @tc.number SUB_USB_HostMgr_UsbTransferStatus_JS_TRANSFER_ERROR_Func_0100
     * @tc.desc   verify UsbTransferStatus.TRANSFER_ERROR equals 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbTransferStatusError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        hilog.info(domain, TAG, 'testUsbTransferStatusError001 start');
        expect(UsbMgr.UsbTransferStatus.TRANSFER_ERROR).assertEqual(1);
        done();
      })

    /**
     * @tc.name   testUsbTransferStatusTimedOut001
     * @tc.number SUB_USB_HostMgr_UsbTransferStatus_JS_TRANSFER_TIMED_OUT_Func_0100
     * @tc.desc   verify UsbTransferStatus.TRANSFER_TIMED_OUT equals 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbTransferStatusTimedOut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        hilog.info(domain, TAG, 'testUsbTransferStatusTimedOut001 start');
        expect(UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(2);
        done();
      })

    /**
     * @tc.name   testUsbTransferStatusCanceled001
     * @tc.number SUB_USB_HostMgr_UsbTransferStatus_JS_TRANSFER_CANCELED_Func_0100
     * @tc.desc   verify UsbTransferStatus.TRANSFER_CANCELED equals 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbTransferStatusCanceled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        hilog.info(domain, TAG, 'testUsbTransferStatusCanceled001 start');
        expect(UsbMgr.UsbTransferStatus.TRANSFER_CANCELED).assertEqual(3);
        done();
      })

    /**
     * @tc.name   testUsbTransferStatusStall001
     * @tc.number SUB_USB_HostMgr_UsbTransferStatus_JS_TRANSFER_STALL_Func_0100
     * @tc.desc   verify UsbTransferStatus.TRANSFER_STALL equals 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbTransferStatusStall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        hilog.info(domain, TAG, 'testUsbTransferStatusStall001 start');
        expect(UsbMgr.UsbTransferStatus.TRANSFER_STALL).assertEqual(4);
        done();
      })

    /**
     * @tc.name   testUsbTransferStatusNoDevice001
     * @tc.number SUB_USB_HostMgr_UsbTransferStatus_JS_TRANSFER_NO_DEVICE_Func_0100
     * @tc.desc   verify UsbTransferStatus.TRANSFER_NO_DEVICE equals 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbTransferStatusNoDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        hilog.info(domain, TAG, 'testUsbTransferStatusNoDevice001 start');
        expect(UsbMgr.UsbTransferStatus.TRANSFER_NO_DEVICE).assertEqual(5);
        done();
      })

    /**
     * @tc.name   testUsbTransferStatusOverflow001
     * @tc.number SUB_USB_HostMgr_UsbTransferStatus_JS_TRANSFER_OVERFLOW_Func_0100
     * @tc.desc   verify UsbTransferStatus.TRANSFER_OVERFLOW equals 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbTransferStatusOverflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        hilog.info(domain, TAG, 'testUsbTransferStatusOverflow001 start');
        expect(UsbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertEqual(6);
        done();
      })

    /**
     * @tc.name   testUsbIsoPacketDescriptorLength001
     * @tc.number SUB_USB_HostMgr_UsbIsoPacketDescriptor_JS_length_Func_0100
     * @tc.desc   verify UsbIsoPacketDescriptor.length is a non-negative int from real transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbIsoPacketDescriptorLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gCallbackData, 'isochronous device', done)) {
          return Promise.resolve();
        }
        try {
          let isoPackets: Array<UsbMgr.UsbIsoPacketDescriptor> = gCallbackData!.isoPacketDescs;
          if (isoPackets.length === 0) {
            hilog.info(domain, TAG, 'no isoPacketDescs, skip');
            done();
            return Promise.resolve();
          }
          let length: int = isoPackets[0]!.length;
          hilog.info(domain, TAG, 'isoPacketDesc length: ' + length);
          expect(length >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUsbIsoPacketDescriptorLength001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUsbIsoPacketDescriptorActualLength001
     * @tc.number SUB_USB_HostMgr_UsbIsoPacketDescriptor_JS_actualLength_Func_0100
     * @tc.desc   verify UsbIsoPacketDescriptor.actualLength is a non-negative int from real transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbIsoPacketDescriptorActualLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gCallbackData, 'isochronous device', done)) {
          return Promise.resolve();
        }
        try {
          let isoPackets: Array<UsbMgr.UsbIsoPacketDescriptor> = gCallbackData!.isoPacketDescs;
          if (isoPackets.length === 0) {
            hilog.info(domain, TAG, 'no isoPacketDescs, skip');
            done();
            return Promise.resolve();
          }
          let actualLength: int = isoPackets[0]!.actualLength;
          hilog.info(domain, TAG, 'isoPacketDesc actualLength: ' + actualLength);
          expect(actualLength >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUsbIsoPacketDescriptorActualLength001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testUsbIsoPacketDescriptorStatus001
     * @tc.number SUB_USB_HostMgr_UsbIsoPacketDescriptor_JS_status_Func_0100
     * @tc.desc   verify UsbIsoPacketDescriptor.status is a valid UsbTransferStatus enum from real transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbIsoPacketDescriptorStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gCallbackData, 'isochronous device', done)) {
          return Promise.resolve();
        }
        try {
          let isoPackets: Array<UsbMgr.UsbIsoPacketDescriptor> = gCallbackData!.isoPacketDescs;
          if (isoPackets.length === 0) {
            hilog.info(domain, TAG, 'no isoPacketDescs, skip');
            done();
            return Promise.resolve();
          }
          let status: UsbMgr.UsbTransferStatus = isoPackets[0]!.status;
          hilog.info(domain, TAG, 'isoPacketDesc status: ' + status);
          expect(isValidTransferStatus(status)).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUsbIsoPacketDescriptorStatus001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSubmitTransferCallbackStatus001
     * @tc.number SUB_USB_HostMgr_SubmitTransferCallback_JS_status_Func_0100
     * @tc.desc   verify SubmitTransferCallback.status is a valid UsbTransferStatus enum from real transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSubmitTransferCallbackStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gCallbackData, 'isochronous device', done)) {
          return Promise.resolve();
        }
        try {
          let status: UsbMgr.UsbTransferStatus = gCallbackData!.status;
          hilog.info(domain, TAG, 'callback status: ' + status);
          expect(isValidTransferStatus(status)).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testSubmitTransferCallbackStatus001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSubmitTransferCallbackIsoPacketDescs001
     * @tc.number SUB_USB_HostMgr_SubmitTransferCallback_JS_isoPacketDescs_Func_0100
     * @tc.desc   verify SubmitTransferCallback.isoPacketDescs is an Array from real transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSubmitTransferCallbackIsoPacketDescs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (skipIfNull(gCallbackData, 'isochronous device', done)) {
          return Promise.resolve();
        }
        try {
          let isoPacketDescs: Array<UsbMgr.UsbIsoPacketDescriptor> = gCallbackData!.isoPacketDescs;
          hilog.info(domain, TAG, 'isoPacketDescs length: ' + isoPacketDescs.length);
          expect(Array.isArray(isoPacketDescs)).assertTrue();
          expect(isoPacketDescs.length >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testSubmitTransferCallbackIsoPacketDescs001 catch error: ',
            `${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })
  })
}
