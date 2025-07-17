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

// let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
// let devices: UsbMgr.USBDevice = gDeviceList[0];
// let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
let isDeviceConnected: boolean;
let config: UsbMgr.USBConfiguration;
let accessory: UsbMgr.USBAccessory;
let param: UsbMgr.USBDeviceRequestParams;
let isDevAccessoryFunc: boolean;
let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
let accessInfo: UsbMgr.USBAccessory;

function devAccessoryFunc() {
  if (accList.length > 0) {
    hilog.info(domain, tag, "This USB device is accessory function");
    return true;
  }
  hilog.info(domain, tag, "This USB device is accessory function");
  return false;
}

let domain: number = 0x0000;
let tag: string = 'testTag';

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


export default function UsbBaseTest() {

  describe("UsbBaseTest", (): void => {
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
     * @tc.number   : SUB_USB_HostManager_JS_Func_0100
     * @tc.name     : testGetDevices001
     * @tc.desc     : Positive test: Get device list
     * @tc.desc     : 【C-ALL-HARDWARE-0502】必须支持连接标准 USB 外围设备
     */
    it('testGetDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testGetDevices001 begin');
        let getDeviceList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        hilog.info(domain, tag, 'usb case getDevices ret length: ' + getDeviceList.length);
        expect(getDeviceList.length > 0).assertTrue();
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0200
     * @tc.name     : testGetRawDescriptorRight001
     * @tc.desc     : Positive test: getRawDescriptor
     */
    it("testGetRawDescriptorRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB getRawDescriptor begin');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          hilog.info(domain, tag, 'USB getRawDescriptor begin 1');
          let hasRight = UsbMgr.requestRight(devices.name);
          hilog.info(domain, tag, 'USB getRawDescriptor begin 2');
          hilog.info(domain, tag, 'USB getRawDescriptor begin 2' + devices.name);
          if (!hasRight) {
            hilog.info(domain, tag, 'requestRight true');
          }
          let gPipe = UsbMgr.connectDevice(devices);
          let devs = UsbMgr.getRawDescriptor(gPipe);
          hilog.info(domain, tag, `getRawDescriptor busNum = ${gPipe.busNum}`);
          hilog.info(domain, tag, `getRawDescriptor evAddress = ${gPipe.devAddress}`);
          hilog.info(domain, tag, `usb getRawDescriptor success : ret :` + devs);
          expect(devs instanceof Uint8Array).assertTrue();
          expect(devs.length > 0).assertTrue();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'usb testGetPortListNormalApp001 catch err code: ', err.code, ', message: ',
            err.message);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0300
     * @tc.name     : testClaimInterface001
     * @tc.desc     : Positive test: claimInterface
     */
    it("testClaimInterface001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB abilityTest_claimInterface_006 begin');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          UsbMgr.requestRight(devices.name);
          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
          let interfaces: UsbMgr.USBInterface = devices.configs[0].interfaces[0];


          hilog.info(domain, tag, `abilityTest_claimInterface_006 busNum = ${devicePipe.busNum}`);
          hilog.info(domain, tag, `abilityTest_claimInterface_006 busNum = ${devicePipe.devAddress}`);
          hilog.info(domain, tag, 'abilityTest_claimInterface_006 interfaces = %{public}s', JSON.stringify(interfaces));
          let ret: int = UsbMgr.claimInterface(devicePipe, interfaces, false);
          UsbMgr.releaseInterface(devicePipe, interfaces);
          hilog.info(domain, tag, `claimInterface = ${ret}`);
          expect(ret === 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, 'abilityTest_claimInterface_004 catch err code:%{public}s', JSON.stringify(err));
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0400
     * @tc.name     : testReleaseInterface001
     * @tc.desc     : Positive test: releaseInterface
     */
    it("testReleaseInterface001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'abilityTest_releaseInterface_007');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          UsbMgr.requestRight(devices.name);
          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
          let interfaces: UsbMgr.USBInterface = devices.configs[0].interfaces[0];

          hilog.info(domain, tag, `abilityTest_releaseInterface_007 busNum = ${devicePipe.busNum}`);
          hilog.info(domain, tag, `abilityTest_releaseInterface_007 busNum = ${devicePipe.devAddress}`);
          hilog.info(domain, tag, 'abilityTest_releaseInterface_007 interfaces = %{public}s',
            JSON.stringify(interfaces));

          UsbMgr.claimInterface(devicePipe, interfaces);
          let ret = UsbMgr.releaseInterface(devicePipe, interfaces);
          hilog.info(domain, tag, `releaseInterface = ${ret}`);
          expect(ret === 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, 'abilityTest_releaseInterface_005 catch err code:%{public}s', JSON.stringify(err));
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0500
     * @tc.name     : testSetInterface001
     * @tc.desc     : Positive test: setInterface
     */
    it("testSetInterface001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'abilityTest_setInterface_008');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          UsbMgr.requestRight(devices.name);
          let devicePipe = UsbMgr.connectDevice(devices);
          let interfaces = devices.configs[0].interfaces[0];
          hilog.info(domain, tag, `abilityTest_setInterface_008 busNum = ${devicePipe.busNum}`);
          hilog.info(domain, tag, `abilityTest_setInterface_008 busNum = ${devicePipe.devAddress}`);
          hilog.info(domain, tag, 'abilityTest_setInterface_008 interfaces = %{public}s',
            JSON.stringify(interfaces));
          UsbMgr.claimInterface(devicePipe, interfaces);
          let ret = UsbMgr.setInterface(devicePipe, interfaces);
          UsbMgr.releaseInterface(devicePipe, interfaces);
          hilog.info(domain, tag, `releaseInterface = ${ret}`);
          expect(ret === 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, 'abilityTest_setInterface_006 catch err code:%{public}s', JSON.stringify(err));
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0600
     * @tc.name     : testSetConfiguration001
     * @tc.desc     : Positive test: setConfiguration
     */
    it("testSetConfiguration001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'abilityTest_setConfiguration_009');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          hilog.info(domain, tag, "devices name " + devices.name);
          UsbMgr.requestRight(devices.name);
          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
          hilog.info(domain, tag, `abilityTest_setInterface_008 busNum = ${devicePipe.busNum}`);
          hilog.info(domain, tag, `abilityTest_setInterface_008 busNum = ${devicePipe.devAddress}`);
          let config: UsbMgr.USBConfiguration = devices.configs[0];
          hilog.info(domain, tag, `abilityTest_setInterface_008 busNum = ${config}`);
          let ret: int = UsbMgr.setConfiguration(devicePipe, config);
          hilog.info(domain, tag, `setConfiguration = ${ret}`);
          expect(ret === 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, 'abilityTest_setConfiguration_007 catch err code:%{public}s', JSON.stringify(err));
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0700
     * @tc.name     : testGetFileDescriptor001
     * @tc.desc     : Positive test: getFileDescriptor
     */
    it("testGetFileDescriptor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'abilityTest_getFileDescriptor_0010');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          UsbMgr.requestRight(devices.name);
          let isHasRight = UsbMgr.hasRight(devices.name);
          let gPipe = UsbMgr.connectDevice(devices);
          let devs: number = UsbMgr.getFileDescriptor(gPipe);
          hilog.info(domain, tag, `usb abilityTest_getFileDescriptor_0010 success ret :` + devs);
          expect(devs >= 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, 'abilityTest_getFileDescriptor_008 catch err code:%{public}s', JSON.stringify(err));
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0800
     * @tc.name     : testRequestRight001
     * @tc.desc     : Positive test: requestRight.
     */
    it("testRequestRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_requestRight_14');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          let isHasRight = await UsbMgr.requestRight(devices.name);
          hilog.info(domain, tag, 'usb case test_requestRight_14 ret : ' + isHasRight);
          expect(isHasRight).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, 'test_requestRight_14 catch err code: ' + JSON.stringify(err));
          expect(err !== null).assertFalse();
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_0900
     * @tc.name     : testHasRight002
     * @tc.desc     : Positive test: hasRight.
     */
    it("testHasRight002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB test_hasRight_15 begin');
        let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();

        try {
          for (let i = 0; i < gDeviceList.length; i++) {
            let deviceName = gDeviceList[i].name;
            deviceName = deviceName + "123";
            let isHasRight = UsbMgr.hasRight(deviceName);
            hilog.info(domain, tag, 'usb [', deviceName, '] hasRight ret : ' + isHasRight);
            expect(isHasRight).assertFalse();
          }
        } catch (err) {
          hilog.info(domain, tag, 'test_hasRight_15 catch err : ' + JSON.stringify(err));
          expect(err !== null).assertFalse();
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_1000
     * @tc.name     : testHasRight003
     * @tc.desc     : Positive test: hasRight.
     */
    it("testHasRight003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB test_hasRight_13 begin');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          let isHasRight = UsbMgr.hasRight(devices.name);
          hilog.info(domain, tag, 'usb case hasRight ret : ' + isHasRight);
          expect(isHasRight).assertTrue();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'usb test_hasRight_13 catch err code: ', err.code, ', message: ',
            err.message);
          expect(err.code).assertEqual(801);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_1100
     * @tc.name     : testConnectDevice001
     * @tc.desc     : Positive test: connectDevice.
     */
    it("testConnectDevice001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB test_connectDevice18 begin');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          let deviceName = devices.name;
          let isHasRight: boolean = await UsbMgr.requestRight(deviceName);
          if (isHasRight) {
            hilog.info(domain, tag, 'requestRight is true');
          }
          let gPipe = UsbMgr.connectDevice(devices);
          hilog.info(domain, tag, 'test_connectDevice18 success  gPipe.busNum : ' + gPipe.busNum);
          hilog.info(domain, tag, 'test_connectDevice18 success gPipe.devAddress : ' + gPipe.devAddress);
          expect(gPipe.busNum > 0).assertTrue();
          expect(gPipe.devAddress > 0).assertTrue();

          expect(gPipe.busNum < 256).assertTrue();
          expect(gPipe.devAddress < 128).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, 'test_connectDevice18 catch err code: ' + JSON.stringify(err));
          expect(err !== null).assertFalse();
        }
        toClosePipe('testConnectDevice001');
        done();
      })

      /**
      * @tc.number   : SUB_USB_HostManager_JS_Func_1200
      * @tc.name     : testRemoveRight001
      * @tc.desc     : Positive test: removeRight.
      */
    it("testRemoveRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_removeRight17');
        try {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = gDeviceList[0];
          let remRight = UsbMgr.removeRight(devices.name);
          hilog.info(domain, tag, 'usb case test_removeRight17 ret : ' + remRight);
          expect(remRight).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, 'test_removeRight17 catch err code: ' + JSON.stringify(err));
          expect(err !== null).assertFalse();
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_Func_1300
     * @tc.name     : testGetRawDescriptor001
     * @tc.desc     : Positive test: getRawDescriptor.
     */
    it('testGetRawDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, 'usb testGetRawDescriptor001 begin');

      let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
      let devices: UsbMgr.USBDevice = gDeviceList[0];
      let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
      getPipe('testGetRawDescriptor001');
      let descriptor = UsbMgr.getRawDescriptor(gPipe);
      hilog.info(domain, tag, 'usb case testGetRawDescriptor001 ret: ' + JSON.stringify(descriptor));
      expect(descriptor.length).assertLarger(0);
      toClosePipe('testGetRawDescriptor001');
    })
  })
}