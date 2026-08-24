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
import usbManager from '@ohos.usbManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

const TAG: string = "[USBDeviceStructTest]";
let domain: int = 0x0000;
let gEndpoint: usbManager.USBEndpoint | null = null;
let gInterface: usbManager.USBInterface | null = null;
let gConfig: usbManager.USBConfiguration | null = null;
let gAccessory: usbManager.USBAccessory | null = null;
let gCallbackData: usbManager.SubmitTransferCallback | null = null;

function refreshDevice(): boolean {
  gEndpoint = null;
  gInterface = null;
  gConfig = null;
  try {
    let deviceList: Array<usbManager.USBDevice> = usbManager.getDevices();
    if (deviceList.length === 0) {
      return false;
    }
    let configs: Array<usbManager.USBConfiguration> = deviceList[0].configs;
    if (configs.length === 0) {
      return false;
    }
    gConfig = configs[0];
    let interfaces: Array<usbManager.USBInterface> = configs[0].interfaces;
    if (interfaces.length === 0) {
      return false;
    }
    gInterface = interfaces[0];
    let endpoints: Array<usbManager.USBEndpoint> = interfaces[0].endpoints;
    if (endpoints.length === 0) {
      return false;
    }
    gEndpoint = endpoints[0];
    return true;
  } catch (error) {
    hilog.error(domain, TAG, '%{public}s', `refreshDevice error: ${(error as BusinessError).message}`);
    return false;
  }
}

function refreshAccessory(): boolean {
  gAccessory = null;
  try {
    let accList: Array<usbManager.USBAccessory> = usbManager.getAccessoryList();
    if (accList.length === 0) {
      return false;
    }
    gAccessory = accList[0];
    return true;
  } catch (error) {
    hilog.info(domain, TAG, '%{public}s', `refreshAccessory no accessory: ${(error as BusinessError).message}`);
    return false;
  }
}

async function submitIsoTransfer(): Promise<boolean> {
  gCallbackData = null;
  let pipe: usbManager.USBDevicePipe | null = null;
  let isoIface: usbManager.USBInterface | null = null;
  let isClaimed: boolean = false;
  try {
    let deviceList: Array<usbManager.USBDevice> = usbManager.getDevices();
    if (deviceList.length === 0) {
      return false;
    }
    let device: usbManager.USBDevice = deviceList[0];
    let isoEndpoint: usbManager.USBEndpoint | null = null;
    let configs: Array<usbManager.USBConfiguration> = device.configs;
    for (let i = 0; i < configs.length; i++) {
      let interfaces: Array<usbManager.USBInterface> = configs[i].interfaces;
      for (let j = 0; j < interfaces.length; j++) {
        let endpoints: Array<usbManager.USBEndpoint> = interfaces[j].endpoints;
        for (let k = 0; k < endpoints.length; k++) {
          if (endpoints[k].type === usbManager.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS) {
            isoEndpoint = endpoints[k];
            isoIface = interfaces[j];
            break;
          }
        }
        if (isoEndpoint !== null) {
          break;
        }
      }
      if (isoEndpoint !== null) {
        break;
      }
    }
    if (isoEndpoint === null || isoIface === null) {
      return false;
    }
    if (!usbManager.hasRight(device.name)) {
      await usbManager.requestRight(device.name);
    }
    let devPipe: usbManager.USBDevicePipe = usbManager.connectDevice(device);
    pipe = devPipe;
    let ret: int = usbManager.claimInterface(devPipe, isoIface, true);
    if (ret !== 0) {
      hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer claimInterface failed, ret: ${ret}`);
      usbManager.closePipe(devPipe);
      return false;
    }
    isClaimed = true;
    const TRANSFER_TIMEOUT: int = 8000;
    let resolveTransfer: (() => void) | null = null;
    const transferWait: Promise<void> = new Promise<void>((resolve: () => void): void => {
      resolveTransfer = resolve;
      setTimeout(resolve, TRANSFER_TIMEOUT);
    });
    let endpointAddr: int = isoEndpoint.address;
    let iface: usbManager.USBInterface = isoIface;
    let transferParams: usbManager.UsbDataTransferParams = {
      devPipe: devPipe,
      flags: usbManager.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK,
      endpoint: endpointAddr,
      type: usbManager.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS,
      timeout: 5000,
      length: 16,
      callback: (err: BusinessError | null, data: usbManager.SubmitTransferCallback): void => {
        if (err !== null) {
          hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer callback err: ${err.code}, ${err.message}`);
        }
        gCallbackData = data;
        if (resolveTransfer !== null) {
          resolveTransfer();
        }
        try {
          usbManager.releaseInterface(devPipe, iface);
          usbManager.closePipe(devPipe);
        } catch (cleanupError) {
          hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer cleanup error: ${(cleanupError as BusinessError).message}`);
        }
      },
      userData: new Uint8Array(16),
      buffer: new Uint8Array(16),
      isoPacketCount: 1,
    };
    try {
      usbManager.usbSubmitTransfer(transferParams);
    } catch (submitError) {
      hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer usbSubmitTransfer failed: ${(submitError as BusinessError).message}`);
      try {
        usbManager.releaseInterface(devPipe, iface);
        usbManager.closePipe(devPipe);
      } catch (cleanupError) {
        hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer cleanup error: ${(cleanupError as BusinessError).message}`);
      }
      return false;
    }
    await transferWait;
    if (gCallbackData === null) {
      hilog.error(domain, TAG, '%{public}s', 'submitIsoTransfer transfer timeout, try cancel');
      try {
        usbManager.usbCancelTransfer(transferParams);
      } catch (cancelError) {
        hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer usbCancelTransfer failed: ${(cancelError as BusinessError).message}`);
      }
      const GRACE_TIMEOUT: int = 500;
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, GRACE_TIMEOUT);
      });
      if (gCallbackData === null) {
        try {
          usbManager.releaseInterface(devPipe, iface);
          usbManager.closePipe(devPipe);
        } catch (cleanupError) {
          hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer cleanup error: ${(cleanupError as BusinessError).message}`);
        }
      }
      return false;
    }
    return true;
  } catch (error) {
    hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer error: ${(error as BusinessError).message}`);
    if (pipe !== null) {
      try {
        if (isoIface !== null && isClaimed) {
          usbManager.releaseInterface(pipe, isoIface);
        }
        usbManager.closePipe(pipe);
      } catch (cleanupError) {
        hilog.error(domain, TAG, '%{public}s', `submitIsoTransfer cleanup error: ${(cleanupError as BusinessError).message}`);
      }
    }
    return false;
  }
}

export default function USBDeviceStructTest() {
  describe('USBDeviceStructTest', () => {
    let isDeviceReady: boolean = false;
    let isAccessoryReady: boolean = false;
    let isIsoReady: boolean = false;

    beforeAll(async (): Promise<void> => {
      isDeviceReady = refreshDevice();
      isAccessoryReady = refreshAccessory();
      if (isDeviceReady) {
        isIsoReady = await submitIsoTransfer();
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
    it('testUSBEndpointAttributes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBEndpointAttributes001 start');
      if (gEndpoint === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let endpoint: usbManager.USBEndpoint = gEndpoint;
          let attributes: int = endpoint.attributes;
          hilog.info(domain, TAG, 'attributes: ' + attributes);
          expect(typeof(attributes)).assertEqual("int");
          expect(attributes >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointAttributes001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBEndpointInterval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBEndpointInterval001 start');
      if (gEndpoint === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let endpoint: usbManager.USBEndpoint = gEndpoint;
          let interval: int = endpoint.interval;
          hilog.info(domain, TAG, 'interval: ' + interval);
          expect(typeof(interval)).assertEqual("int");
          expect(interval >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointInterval001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBEndpointMaxPacketSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBEndpointMaxPacketSize001 start');
      if (gEndpoint === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let endpoint: usbManager.USBEndpoint = gEndpoint;
          let maxPacketSize: int = endpoint.maxPacketSize;
          hilog.info(domain, TAG, 'maxPacketSize: ' + maxPacketSize);
          expect(typeof(maxPacketSize)).assertEqual("int");
          expect(maxPacketSize > 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointMaxPacketSize001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBEndpointDirection001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBEndpointDirection001 start');
      if (gEndpoint === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let endpoint: usbManager.USBEndpoint = gEndpoint;
          let direction: usbManager.USBRequestDirection = endpoint.direction;
          hilog.info(domain, TAG, 'direction: ' + direction);
          expect(direction === usbManager.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE
            || direction === usbManager.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointDirection001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBEndpointAddr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBEndpointAddr001 start');
      if (gEndpoint === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let endpoint: usbManager.USBEndpoint = gEndpoint;
          let endpointAddr: int = endpoint.endpointAddr;
          hilog.info(domain, TAG, 'endpointAddr: ' + endpointAddr);
          expect(typeof(endpointAddr)).assertEqual("int");
          expect(endpointAddr >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointAddr001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBEndpointType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBEndpointType001 start');
      if (gEndpoint === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let endpoint: usbManager.USBEndpoint = gEndpoint;
          let type: int = endpoint.type;
          hilog.info(domain, TAG, 'type: ' + type);
          expect(type === usbManager.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS
            || type === usbManager.UsbEndpointTransferType.TRANSFER_TYPE_BULK
            || type === usbManager.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointType001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBEndpointInterfaceId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBEndpointInterfaceId001 start');
      if (gEndpoint === null || gInterface === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let endpoint: usbManager.USBEndpoint = gEndpoint;
          let iface: usbManager.USBInterface = gInterface;
          let interfaceId: int = endpoint.interfaceId;
          hilog.info(domain, TAG, 'interfaceId: ' + interfaceId + ', interface.id: ' + iface.id);
          expect(typeof(interfaceId)).assertEqual("int");
          expect(interfaceId === iface.id).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBEndpointInterfaceId001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBInterfaceId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBInterfaceId001 start');
      if (gInterface === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let iface: usbManager.USBInterface = gInterface;
          let id: int = iface.id;
          hilog.info(domain, TAG, 'id: ' + id);
          expect(typeof(id)).assertEqual("int");
          expect(id >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceId001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBInterfaceProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBInterfaceProtocol001 start');
      if (gInterface === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let iface: usbManager.USBInterface = gInterface;
          let protocol: int = iface.protocol;
          hilog.info(domain, TAG, 'protocol: ' + protocol);
          expect(typeof(protocol)).assertEqual("int");
          expect(protocol >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceProtocol001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBInterfaceClazz001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBInterfaceClazz001 start');
      if (gInterface === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let iface: usbManager.USBInterface = gInterface;
          let clazz: int = iface.clazz;
          hilog.info(domain, TAG, 'clazz: ' + clazz);
          expect(typeof(clazz)).assertEqual("int");
          expect(clazz >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceClazz001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBInterfaceSubClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBInterfaceSubClass001 start');
      if (gInterface === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let iface: usbManager.USBInterface = gInterface;
          let subClass: int = iface.subClass;
          hilog.info(domain, TAG, 'subClass: ' + subClass);
          expect(typeof(subClass)).assertEqual("int");
          expect(subClass >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceSubClass001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBInterfaceAlternateSetting001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBInterfaceAlternateSetting001 start');
      if (gInterface === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let iface: usbManager.USBInterface = gInterface;
          let alternateSetting: int = iface.alternateSetting;
          hilog.info(domain, TAG, 'alternateSetting: ' + alternateSetting);
          expect(typeof(alternateSetting)).assertEqual("int");
          expect(alternateSetting >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceAlternateSetting001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBInterfaceName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBInterfaceName001 start');
      if (gInterface === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let iface: usbManager.USBInterface = gInterface;
          let name: string = iface.name;
          hilog.info(domain, TAG, 'name: ' + name);
          expect(typeof(name)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBInterfaceName001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBConfigId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBConfigId001 start');
      if (gConfig === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let config: usbManager.USBConfiguration = gConfig;
          let id: int = config.id;
          hilog.info(domain, TAG, 'config id: ' + id);
          expect(typeof(id)).assertEqual("int");
          expect(id >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigId001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBConfigAttributes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBConfigAttributes001 start');
      if (gConfig === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let config: usbManager.USBConfiguration = gConfig;
          let attributes: int = config.attributes;
          hilog.info(domain, TAG, 'config attributes: ' + attributes);
          expect(typeof(attributes)).assertEqual("int");
          expect(attributes >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigAttributes001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBConfigMaxPower001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBConfigMaxPower001 start');
      if (gConfig === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let config: usbManager.USBConfiguration = gConfig;
          let maxPower: int = config.maxPower;
          hilog.info(domain, TAG, 'config maxPower: ' + maxPower);
          expect(typeof(maxPower)).assertEqual("int");
          expect(maxPower >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigMaxPower001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBConfigName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBConfigName001 start');
      if (gConfig === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let config: usbManager.USBConfiguration = gConfig;
          let name: string = config.name;
          hilog.info(domain, TAG, 'config name: ' + name);
          expect(typeof(name)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigName001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBConfigIsRemoteWakeup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBConfigIsRemoteWakeup001 start');
      if (gConfig === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let config: usbManager.USBConfiguration = gConfig;
          let isRemoteWakeup: boolean = config.isRemoteWakeup;
          hilog.info(domain, TAG, 'config isRemoteWakeup: ' + isRemoteWakeup);
          expect(typeof(isRemoteWakeup)).assertEqual("boolean");
          expect(isRemoteWakeup === true || isRemoteWakeup === false).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigIsRemoteWakeup001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBConfigIsSelfPowered001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBConfigIsSelfPowered001 start');
      if (gConfig === null) {
        hilog.info(domain, TAG, 'no device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let config: usbManager.USBConfiguration = gConfig;
          let isSelfPowered: boolean = config.isSelfPowered;
          hilog.info(domain, TAG, 'config isSelfPowered: ' + isSelfPowered);
          expect(typeof(isSelfPowered)).assertEqual("boolean");
          expect(isSelfPowered === true || isSelfPowered === false).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBConfigIsSelfPowered001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBAccessoryManufacturer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBAccessoryManufacturer001 start');
      if (gAccessory === null) {
        hilog.info(domain, TAG, 'no accessory, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let accessory: usbManager.USBAccessory = gAccessory;
          let manufacturer: string = accessory.manufacturer;
          hilog.info(domain, TAG, 'accessory manufacturer: ' + manufacturer);
          expect(typeof(manufacturer)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessoryManufacturer001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBAccessoryProduct001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBAccessoryProduct001 start');
      if (gAccessory === null) {
        hilog.info(domain, TAG, 'no accessory, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let accessory: usbManager.USBAccessory = gAccessory;
          let product: string = accessory.product;
          hilog.info(domain, TAG, 'accessory product: ' + product);
          expect(typeof(product)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessoryProduct001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBAccessoryDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBAccessoryDescription001 start');
      if (gAccessory === null) {
        hilog.info(domain, TAG, 'no accessory, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let accessory: usbManager.USBAccessory = gAccessory;
          let description: string = accessory.description;
          hilog.info(domain, TAG, 'accessory description: ' + description);
          expect(typeof(description)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessoryDescription001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBAccessoryVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBAccessoryVersion001 start');
      if (gAccessory === null) {
        hilog.info(domain, TAG, 'no accessory, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let accessory: usbManager.USBAccessory = gAccessory;
          let version: string = accessory.version;
          hilog.info(domain, TAG, 'accessory version: ' + version);
          expect(typeof(version)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessoryVersion001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUSBAccessorySerialNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUSBAccessorySerialNumber001 start');
      if (gAccessory === null) {
        hilog.info(domain, TAG, 'no accessory, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let accessory: usbManager.USBAccessory = gAccessory;
          let serialNumber: string = accessory.serialNumber;
          hilog.info(domain, TAG, 'accessory serialNumber: ' + serialNumber);
          expect(typeof(serialNumber)).assertEqual("string");
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUSBAccessorySerialNumber001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUsbTransferStatusCompleted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      hilog.info(domain, TAG, 'testUsbTransferStatusCompleted001 start');
      expect(usbManager.UsbTransferStatus.TRANSFER_COMPLETED).assertEqual(0);
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
    it('testUsbTransferStatusError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      hilog.info(domain, TAG, 'testUsbTransferStatusError001 start');
      expect(usbManager.UsbTransferStatus.TRANSFER_ERROR).assertEqual(1);
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
    it('testUsbTransferStatusTimedOut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      hilog.info(domain, TAG, 'testUsbTransferStatusTimedOut001 start');
      expect(usbManager.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(2);
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
    it('testUsbTransferStatusCanceled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      hilog.info(domain, TAG, 'testUsbTransferStatusCanceled001 start');
      expect(usbManager.UsbTransferStatus.TRANSFER_CANCELED).assertEqual(3);
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
    it('testUsbTransferStatusStall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      hilog.info(domain, TAG, 'testUsbTransferStatusStall001 start');
      expect(usbManager.UsbTransferStatus.TRANSFER_STALL).assertEqual(4);
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
    it('testUsbTransferStatusNoDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      hilog.info(domain, TAG, 'testUsbTransferStatusNoDevice001 start');
      expect(usbManager.UsbTransferStatus.TRANSFER_NO_DEVICE).assertEqual(5);
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
    it('testUsbTransferStatusOverflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      hilog.info(domain, TAG, 'testUsbTransferStatusOverflow001 start');
      expect(usbManager.UsbTransferStatus.TRANSFER_OVERFLOW).assertEqual(6);
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
    it('testUsbIsoPacketDescriptorLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUsbIsoPacketDescriptorLength001 start');
      if (isIsoReady === false || gCallbackData === null) {
        hilog.info(domain, TAG, 'no isochronous device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let isoPackets: Array<usbManager.UsbIsoPacketDescriptor> = gCallbackData.isoPacketDescs;
          if (isoPackets.length === 0) {
            hilog.info(domain, TAG, 'no isoPacketDescs, skip');
            done();
            return Promise.resolve();
          }
          let length: int = isoPackets[0].length;
          hilog.info(domain, TAG, 'isoPacketDesc length: ' + length);
          expect(typeof(length)).assertEqual("int");
          expect(length >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUsbIsoPacketDescriptorLength001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUsbIsoPacketDescriptorActualLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUsbIsoPacketDescriptorActualLength001 start');
      if (isIsoReady === false || gCallbackData === null) {
        hilog.info(domain, TAG, 'no isochronous device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let isoPackets: Array<usbManager.UsbIsoPacketDescriptor> = gCallbackData.isoPacketDescs;
          if (isoPackets.length === 0) {
            hilog.info(domain, TAG, 'no isoPacketDescs, skip');
            done();
            return Promise.resolve();
          }
          let actualLength: int = isoPackets[0].actualLength;
          hilog.info(domain, TAG, 'isoPacketDesc actualLength: ' + actualLength);
          expect(typeof(actualLength)).assertEqual("int");
          expect(actualLength >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUsbIsoPacketDescriptorActualLength001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testUsbIsoPacketDescriptorStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testUsbIsoPacketDescriptorStatus001 start');
      if (isIsoReady === false || gCallbackData === null) {
        hilog.info(domain, TAG, 'no isochronous device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let isoPackets: Array<usbManager.UsbIsoPacketDescriptor> = gCallbackData.isoPacketDescs;
          if (isoPackets.length === 0) {
            hilog.info(domain, TAG, 'no isoPacketDescs, skip');
            done();
            return Promise.resolve();
          }
          let status: usbManager.UsbTransferStatus = isoPackets[0].status;
          hilog.info(domain, TAG, 'isoPacketDesc status: ' + status);
          expect(status === usbManager.UsbTransferStatus.TRANSFER_COMPLETED
            || status === usbManager.UsbTransferStatus.TRANSFER_ERROR
            || status === usbManager.UsbTransferStatus.TRANSFER_TIMED_OUT
            || status === usbManager.UsbTransferStatus.TRANSFER_CANCELED
            || status === usbManager.UsbTransferStatus.TRANSFER_STALL
            || status === usbManager.UsbTransferStatus.TRANSFER_NO_DEVICE
            || status === usbManager.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testUsbIsoPacketDescriptorStatus001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testSubmitTransferCallbackStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSubmitTransferCallbackStatus001 start');
      if (isIsoReady === false || gCallbackData === null) {
        hilog.info(domain, TAG, 'no isochronous device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let status: usbManager.UsbTransferStatus = gCallbackData.status;
          hilog.info(domain, TAG, 'callback status: ' + status);
          expect(status === usbManager.UsbTransferStatus.TRANSFER_COMPLETED
            || status === usbManager.UsbTransferStatus.TRANSFER_ERROR
            || status === usbManager.UsbTransferStatus.TRANSFER_TIMED_OUT
            || status === usbManager.UsbTransferStatus.TRANSFER_CANCELED
            || status === usbManager.UsbTransferStatus.TRANSFER_STALL
            || status === usbManager.UsbTransferStatus.TRANSFER_NO_DEVICE
            || status === usbManager.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testSubmitTransferCallbackStatus001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
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
    it('testSubmitTransferCallbackIsoPacketDescs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSubmitTransferCallbackIsoPacketDescs001 start');
      if (isIsoReady === false || gCallbackData === null) {
        hilog.info(domain, TAG, 'no isochronous device, skip');
        done();
        return Promise.resolve();
      } else {
        try {
          let isoPacketDescs: Array<usbManager.UsbIsoPacketDescriptor> = gCallbackData.isoPacketDescs;
          hilog.info(domain, TAG, 'isoPacketDescs length: ' + isoPacketDescs.length);
          expect(Array.isArray(isoPacketDescs)).assertTrue();
          expect(isoPacketDescs.length >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, TAG, 'testSubmitTransferCallbackIsoPacketDescs001 catch error: ', `${(error as BusinessError).message}`);
          expect().assertFail();
          done();
        }
      }
    })
  })
}
