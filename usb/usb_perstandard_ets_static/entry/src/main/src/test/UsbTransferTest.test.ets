import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import UsbMgr from '@ohos.usbManager';
import bundleManager from '@ohos.bundle.bundleManager';

let isDeviceConnected: boolean;
let tmpPipe: UsbMgr.USBDevicePipe;
let iface: UsbMgr.USBInterface;
let config: UsbMgr.USBConfiguration;
let accessory: UsbMgr.USBAccessory;
let powerRole: UsbMgr.PowerRoleType;
let dataRole: UsbMgr.DataRoleType;
let param: UsbMgr.USBDeviceRequestParams;
let isDevAccessoryFunc: boolean;
let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
let accessInfo: UsbMgr.USBAccessory;

let domain: number = 0x0000;
let tag: string = 'testTag';
const PARAM_NULLSTRING: string = "";

function devAccessoryFunc() {
  if (accList.length > 0) {
    hilog.info(domain, tag, "This USB device is accessory function");
    return true;
  }
  hilog.info(domain, tag, "This USB device is accessory function");
  return false;
}

function getTransfersParam(gPipe: UsbMgr.USBDevicePipe, flagsValue: UsbMgr.UsbTransferFlags,
  endpointValue: int, typeValue: UsbMgr.UsbEndpointTransferType, timeOutValue: int) {
  let transferParams: UsbMgr.UsbDataTransferParams = {
    devPipe: gPipe,
    flags: flagsValue,
    endpoint: endpointValue,
    type: typeValue,
    timeout: timeOutValue,
    length: 1000,
    callback: () => {
    },
    userData: new Uint8Array(1000),
    buffer: new Uint8Array(1000),
    isoPacketCount: 0,
  };
  return transferParams;
}

function deviceConnected() {
  let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
  let devices: UsbMgr.USBDevice = gDeviceList[0];
  if (gDeviceList.length > 0) {
    hilog.info(domain, tag, "Test USB device is connected");
    return true;
  }
  hilog.info(domain, tag, "Test USB device is not connected");
  return false;
}

function getPipe(testCaseName: string) {
  let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
  let devices: UsbMgr.USBDevice = gDeviceList[0];
  let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
  hilog.info(domain, tag, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
  expect(gPipe !== null).assertTrue();
}

function toClosePipe(testCaseName: string) {
  let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
  let devices: UsbMgr.USBDevice = gDeviceList[0];
  let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
  let isPipClose = UsbMgr.closePipe(gPipe);
  console.info(domain, tag, `usb ${testCaseName} closePipe getPipe ret: ${isPipClose}`);
  expect(isPipClose).assertEqual(0);
}


export default function UsbTransferTest() {

  describe("UsbTransferTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');

      let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
      let devices: UsbMgr.USBDevice = gDeviceList[0];
      gDeviceList = UsbMgr.getDevices();
      hilog.info(domain, tag, '获取设备信息: %{public}s', JSON.stringify(gDeviceList));

      isDeviceConnected = deviceConnected();
      if (isDeviceConnected) {
        devices = gDeviceList[0];
        let hasRight = UsbMgr.hasRight(devices.name);
        if (!hasRight) {
          hilog.info(domain, tag, `beforeAll: usb requestRight start`);
        }
      }

      isDevAccessoryFunc = devAccessoryFunc();
      if (isDevAccessoryFunc) {
        accList = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        hilog.info(domain, tag, 'beforeAll ret : ', JSON.stringify(accList));
      }
    })

    /**
     * @tc.number   : SUB_USB_Host_JS_UsbSubmitTransfer_Func_0100
     * @tc.name     : testUsbSubmitTransfer001
     * @tc.desc     : interrupt transfer Submit successfully.
     */
    it("testUsbSubmitTransfer001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer003 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }

        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        UsbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
          transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined) => {
            hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
            hilog.info(domain, tag,
              'testUsbSubmitTransfer003 transfer success, result = ' + transferParams.buffer.toString());
            hilog.info(domain, tag, 'status = ' + callBackData?.status);
            UsbMgr.closePipe(gPipe);
            hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer003 end');
            done();
          }
          UsbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, 'interrupt error:', err.code);
          UsbMgr.closePipe(gPipe);
          done();
        }
      })

    /**
     * @tc.number   : SUB_USB_Host_JS_usbCancelTransfer_Func_0100
     * @tc.name     : testUsbCancelTransfer001
     * @tc.desc     : interrupt transfer cancel successfully.
     */
    it("testUsbCancelTransfer001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbCancelTransfer004 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbCancelTransfer004 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }
        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let endpoint = devices.configs[0].interfaces[0]?.endpoints.find((value) => {
          return value.direction === 0 && value.type === 2
        })
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        try {
          UsbMgr.usbSubmitTransfer(transferParams);
          UsbMgr.usbCancelTransfer(transferParams);
          hilog.info(domain, tag, 'USB transfer request submitted.');
        } catch (error: BusinessError) {
          hilog.info(domain, tag, 'testUsbCancelTransfer004 catch err code================: ' + JSON.stringify(error));
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_Host_JS_usbCancelTransfer_ErrCode_0100
     * @tc.name     : testUsbCancelTransfer002
     * @tc.desc     : interrupt transfer cancel failed.
     */
    it("testUsbCancelTransfer002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbCancelTransfer002 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbCancelTransfer002 No device is connected');
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }
        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let endpoint = devices.configs[0].interfaces[0]?.endpoints.find((value) => {
          return value.direction === 0 && value.type === 2
        })
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        try {
          UsbMgr.usbCancelTransfer(transferParams);
          expect().assertFail();
          hilog.info(domain, tag, 'USB transfer request submitted.');
        } catch (error: BusinessError) {
          hilog.info(domain, tag, 'interrupt cancel failed:' + error.code);
          expect(error.code).assertEqual(14400011);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_Host_JS_usbControlTransfer_ErrCode_0100
     * @tc.name     : test_usbControlTransfer001
     * @tc.desc     : interrupt transfer cancel failed.
     */
    it("test_usbControlTransfer001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb usbControlTransfer begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb not connected');
        }
        let param: UsbMgr.USBDeviceRequestParams = {
          bmRequestType: 0x80,
          bRequest: 0x06,
          wValue: (0x01 << 8) | 0x00,
          wIndex: 0x00,
          wLength: 18,
          data: new Uint8Array(18),
        };
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          if (devicesList.length == 0) {
            hilog.info(domain, tag, 'device list is empty');
          }

          UsbMgr.requestRight(devicesList[0].name);
          hilog.info(domain, tag, `usbControlTransfer name = ${devicesList[0].name}`);
          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devicesList[0]);
          let timeout: int | undefined = 30;

          hilog.info(domain, tag, `usbControlTransfer device.name = ${devicesList[0].name}`);
          let ret = UsbMgr.usbControlTransfer(devicePipe, param, timeout).then((ret: int) => {
            hilog.info(domain, tag, `usbControlTransfer size= ${ret}`);
            expect(ret == 18).assertEqual(true);
          })
          UsbMgr.closePipe(devicePipe);
        } catch (error: BusinessError) {
          hilog.info(0, 'testTag ui', `closeAccessory error `)
          hilog.info(domain, tag, 'usbControlTransfer end');
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `usbControlTransferlnn0 err.code= ${err.code}`);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_Host_JS_bulkTransfer_0100
     * @tc.name     : test_bulkTransfer02
     * @tc.desc     : bulkTransfer transfer.
     */
    it("test_bulkTransfer02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb test_bulkTransfer02 begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb not connected');
        }

        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          if (devicesList.length == 0) {
            hilog.info(domain, tag, 'device list is empty');
          }

          let device: UsbMgr.USBDevice = devicesList[0];
          UsbMgr.requestRight(device.name);

          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(device);
          hilog.info(domain, tag, `UsbMgr.connectDevice(device) = ${devicePipe.busNum}`);
          hilog.info(domain, tag, `UsbMgr.connectDevice(device) = ${devicePipe.devAddress}`);
          let interfaces: UsbMgr.USBInterface;
          let endpoint: UsbMgr.USBEndpoint;
          for (const config of device.configs) {
            for (const intf of config.interfaces) {
              for (const ep of intf.endpoints) {
                if (ep && ep.address) {
                  endpoint = ep;
                  interfaces = intf;
                  break;
                }
              }
              if (endpoint) break;
            }
            if (endpoint) break;
          }
          if (endpoint) {
            hilog.info(domain, tag, 'UsbMgr.USBEndpoint = %{public}s', JSON.stringify(endpoint));
          } else {
            hilog.info(domain, tag, "没有有效的endpoint");
          }
          let ret: int = UsbMgr.claimInterface(devicePipe, interfaces, true);
          hilog.info(domain, tag, `bulkTransfer begin  = ${ret}`);
          if (ret == 0) {
            hilog.info(domain, tag, 'USB claim sucess');
            let bufferTransfer = new Uint8Array(128);

            hilog.info(domain, tag, `test_bulkTransfer name = ${devicesList[0].name}`);
            hilog.info(domain, tag, `test_bulkTransfer buffer = ${bufferTransfer}`);
            let timeout: int | undefined = 8000;

            UsbMgr.bulkTransfer(devicePipe, endpoint, bufferTransfer, timeout).then((retVal: int) => {
              hilog.info(domain, tag, `test_bulkTransfer02 retVal = ${retVal}`);
              expect(retVal == 128).assertTrue();
            });
          }
          hilog.info(domain, tag, `bulkTransfer end `);
          UsbMgr.closePipe(devicePipe);
        } catch (error: BusinessError) {
          hilog.info(domain, tag, `bulkTransfer error `)
          hilog.info(domain, tag, `bulkTransfer err.code= ${error.code}`);
        }
        done();
      })
  })
}