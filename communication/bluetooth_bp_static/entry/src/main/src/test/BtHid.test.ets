'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium'
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import btAccess from '@ohos.bluetooth.access';
import common from '@ohos.bluetooth.common';
import hid from '@ohos.bluetooth.hid';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'btHidTest';
let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";
let hidDevice: hid.HidDeviceProfile | undefined;
let deviceId: common.BluetoothAddress = {
  "address": "11:22:33:44:55:66",
  "addressType": common.BluetoothAddressType.REAL,
  "rawAddressType": common.BluetoothRawAddressType.PUBLIC
};
let deviceId1: common.BluetoothAddress = {
  "address": "11:22:33:44:55:66",
  "addressType": common.BluetoothAddressType.VIRTUAL,
  "rawAddressType": common.BluetoothRawAddressType.RANDOM
};
let deviceId2: common.BluetoothAddress = {
  "address": "11:22:33:44:55:66",
  "addressType": common.BluetoothAddressType.VIRTUAL
};
let deviceId401: common.BluetoothAddress = {
  "address": "11:22:33",
  "addressType": common.BluetoothAddressType.VIRTUAL,
};

function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay)
  });
}

async function tryToEnableBt() {
  let sta = btAccess.getState();
  switch (sta) {
    case btAccess.BluetoothState.STATE_OFF:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta1 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
      break;
    case btAccess.BluetoothState.STATE_TURNING_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turning on:' + JSON.stringify(sta));
      await sleep(3000);
      break;
    case btAccess.BluetoothState.STATE_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turn on:' + JSON.stringify(sta));
      break;
    case btAccess.BluetoothState.STATE_TURNING_OFF:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta2 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
      break;
    default:
      hilog.info(domain, tag, '[bluetooth_js] enable success');
  }
}

async function clickRequestPermission(text: string) {
  hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission start');
  let driver = Driver.create();
  await driver.delayMs(3000);
  try {
    let button = await driver.findComponent(ON.text(text));
    await button!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission failed. ' + err);
  }
  try {
    let button1 = await driver.findComponent(ON.text("允许"));
    await button1!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] click 允许 end');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] click 允许 failed. ' + err);
  }
}

function onReceiveEvent_void() {
  hilog.info(domain, tag, '[bluetooth_js] BLEscan device result_viod');
}

function onReceiveEvent_GetReportData(data: hid.GetReportData) {
  hilog.info(domain, tag, '[bluetooth_js]hid on/offGetReport result' + JSON.stringify(data));
  hilog.info(domain, tag, '[bluetooth_js]hid on/offGetReport result' + JSON.stringify(data.type));
  expect(data.type).not().assertUndefined();
  hilog.info(domain, tag, '[bluetooth_js]hid on/offGetReport result' + JSON.stringify(data.id));
  expect(data.id).not().assertUndefined();
  hilog.info(domain, tag, '[bluetooth_js]hid on/offGetReport result' + JSON.stringify(data.bufferSize));
  expect(data.bufferSize).not().assertUndefined();
}

function onReceiveEvent_SetReportData(data: hid.SetReportData) {
  hilog.info(domain, tag, '[bluetooth_js]hid on/offSetReportData device result_viod' + JSON.stringify(data));
  hilog.info(domain, tag, '[bluetooth_js]hid on/offSetReportData device result_viod' + JSON.stringify(data.type));
  expect(data.type).not().assertUndefined();
  hilog.info(domain, tag, '[bluetooth_js]hid on/offSetReportData device result_viod' + JSON.stringify(data.id));
  expect(data.id).not().assertUndefined();
  hilog.info(domain, tag, '[bluetooth_js]hid on/offSetReportData device result_viod' + JSON.stringify(data.data));
  expect(data.data).not().assertUndefined();
}

function onReceiveEvent_InterruptData(data: hid.InterruptData) {
  hilog.info(domain, tag, '[bluetooth_js]hid on/offInterruptDataReceived device result_viod' + JSON.stringify(data));
  hilog.info(domain, tag, '[bluetooth_js]hid on/offInterruptDataReceived device result_viod' + JSON.stringify(data.id));
  expect(data.id).not().assertUndefined();
  hilog.info(domain, tag,
    '[bluetooth_js]hid on/offInterruptDataReceived device result_viod' + JSON.stringify(data.data));
  expect(data.data).not().assertUndefined();
}

function onReceiveEvent_ProtocolData(data: hid.ProtocolData) {
  hilog.info(domain, tag, '[bluetooth_js]hid on/offSetProtocol device result_viod' + JSON.stringify(data));
  hilog.info(domain, tag, '[bluetooth_js]hid on/offSetProtocol device result_viod' + JSON.stringify(data.protocol));
  expect(data.protocol).not().assertUndefined();
}

let descriptors: Uint8Array = new Uint8Array([
  0x05, 0x01,
  0x09, 0x06,
  0xA1, 0x01,
  0x05, 0x07,
  0x19, 0xE0,
  0x29, 0xE7,
  0x15, 0x00,
  0x25, 0x01,
  0x75, 0x01,
  0x95, 0x08,
  0x81, 0x02,
  0x95, 0x01,
  0x75, 0x08,
  0x81, 0x01,
  0x95, 0x05,
  0x75, 0x01,
  0x05, 0x08,
  0x19, 0x01,
  0x29, 0x05,
  0x91, 0x02,
  0x95, 0x01,
  0x75, 0x03,
  0x91, 0x01,
  0x95, 0x06,
  0x75, 0x08,
  0x15, 0x00,
  0x25, 0x65,
  0x05, 0x07,
  0x19, 0x00,
  0x29, 0x65,
  0x81, 0x00,
  0xC0]);
// let descriptors: Uint8Array = new Uint8Array(63)
// descriptors[0] = 0x05;
// descriptors[1] = 0x01;
// descriptors[2] = 0x09;
// descriptors[3] = 0x06;
// descriptors[4] = 0xA1;
// descriptors[5] = 0x01;
// descriptors[6] = 0x05;
// descriptors[7] = 0x07;
// descriptors[8] = 0x19;
// descriptors[9] = 0xE0;
// descriptors[10] = 0x29;
// descriptors[11] = 0xE7;
// descriptors[12] = 0x15;
// descriptors[13] = 0x00;
// descriptors[14] = 0x25;
// descriptors[15] = 0x01;
// descriptors[16] = 0x75;
// descriptors[17] = 0x01;
// descriptors[18] = 0x95;
// descriptors[19] = 0x08;
// descriptors[20] = 0x81;
// descriptors[21] = 0x02;
// descriptors[22] = 0x95;
// descriptors[23] = 0x01;
// descriptors[24] = 0x75;
// descriptors[25] = 0x08;
// descriptors[26] = 0x81;
// descriptors[27] = 0x01;
// descriptors[28] = 0x95;
// descriptors[29] = 0x05;
// descriptors[30] = 0x75;
// descriptors[31] = 0x01;
// descriptors[32] = 0x05;
// descriptors[33] = 0x08;
// descriptors[34] = 0x19;
// descriptors[35] = 0x01;
// descriptors[36] = 0x29;
// descriptors[37] = 0x05;
// descriptors[38] = 0x91;
// descriptors[39] = 0x00;
// descriptors[40] = 0x95;
// descriptors[41] = 0x01;
// descriptors[42] = 0x75;
// descriptors[43] = 0x03;
// descriptors[44] = 0x91;
// descriptors[45] = 0x01;
// descriptors[46] = 0x95;
// descriptors[47] = 0x06;
// descriptors[48] = 0x75;
// descriptors[49] = 0x08;
// descriptors[50] = 0x15;
// descriptors[51] = 0x00;
// descriptors[52] = 0x25;
// descriptors[53] = 0x65;
// descriptors[54] = 0x05;
// descriptors[55] = 0x07;
// descriptors[56] = 0x19;
// descriptors[57] = 0x00;
// descriptors[58] = 0x29;
// descriptors[59] = 0x65;
// descriptors[60] = 0x81;
// descriptors[61] = 0x00;
// descriptors[62] = 0xC0;
let sdp: hid.HidDeviceSdp = {
    "name": "testName",
    "description": "testDescription",
    "provider": "testProvoder",
    "subclass": hid.Subclass.SUBCLASS_KEYBOARD,
    "descriptors": descriptors,
  };
let inqos: hid.HidDeviceQos = {
    "serviceType": hid.ServiceType.SERVICE_BEST_EFFORT,
    "tokenRate": 0,
  "tokenBucketSize": 0,
  "peakBandwidth": 0,
  "latency": -1,
  "delayVariation": -1,
};
let sdp1: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_UNCATEGORIZED,
  "descriptors": descriptors,
};
let sdp2: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_JOYSTICK,
  "descriptors": descriptors,
};
let sdp3: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_GAMEPAD,
  "descriptors": descriptors,
};
let sdp4: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_REMOTE_CONTROL,
  "descriptors": descriptors,
};
let sdp5: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_SENSING_DEVICE,
  "descriptors": descriptors,
};
let sdp6: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_DIGITIZER_TABLET,
  "descriptors": descriptors,
};
let sdp7: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_CARD_READER,
  "descriptors": descriptors,
};
let sdp8: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_MOUSE,
  "descriptors": descriptors,
};
let sdp9: hid.HidDeviceSdp = {
  "name": "testName",
  "description": "testDescription",
  "provider": "testProvoder",
  "subclass": hid.Subclass.SUBCLASS_COMBO,
  "descriptors": descriptors,
};

let inqos1: hid.HidDeviceQos = {
  "serviceType": hid.ServiceType.SERVICE_NO_TRAFFIC,
  "tokenRate": 0,
  "tokenBucketSize": 0,
  "peakBandwidth": 0,
  "latency": -1,
  "delayVariation": -1,
};
let inqos2: hid.HidDeviceQos = {
  "serviceType": hid.ServiceType.SERVICE_GUARANTEED,
  "tokenRate": 0,
  "tokenBucketSize": 0,
  "peakBandwidth": 0,
  "latency": -1,
  "delayVariation": -1,
};

function registerHidDeviceAsync1(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp1, inqos1, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

function registerHidDeviceAsync2(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp2, inqos2, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

function registerHidDeviceAsync3(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp3, inqos2, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

function registerHidDeviceAsync4(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp4, inqos1, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

function registerHidDeviceAsync5(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp5, inqos2, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

function registerHidDeviceAsync6(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp6, inqos1, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

function registerHidDeviceAsync7(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp7, inqos2, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

function registerHidDeviceAsync8(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp8, inqos1, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

function registerHidDeviceAsync9(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 20000);
    hidDevice!.registerHidDevice(sdp9, inqos2, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

let outqos: hid.HidDeviceQos = {};

function registerHidDeviceAsync(): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    const timeout = setTimeout(() => {
      reject(new Error("[bluetooth_js]registerHidDeviceAsync timeout"));
    }, 5000);
    hidDevice!.registerHidDevice(sdp, inqos, outqos, (data: boolean) => {
      clearTimeout(timeout)
      hilog.info(domain, tag, '[bluetooth_js] registerHidDeviceAsync success' + JSON.stringify(data));
      resolve(data);
    });
  });
}

let unregisterHidDeviceaftereach = async () => {
  hilog.info(domain, tag, 'unregisterHidDevice after each:');
  try {
    hidDevice!.unregisterHidDevice();
    hilog.info(domain, tag, "[bluetooth_js]afterEach unregisterHidDevice is success ");
  } catch (err) {
    hilog.info(domain, tag, "[bluetooth_js]rk板不支持" + JSON.stringify(err.code));
    expect(err.code).assertEqual(801);
  }
}

export default function btHidTest(): void {
  describe('btHidTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll called')
      await clickRequestPermission(PERMISSION_TEXT);
      hidDevice = hid.createHidDeviceProfile();
      hilog.info(domain, tag, '[bluetooth_js]beforeAll createHidDeviceProfile success' + JSON.stringify(hidDevice));
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach called');
      await tryToEnableBt();
      done();
    })
    afterEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterEach called')
      await unregisterHidDeviceaftereach();
      await sleep(100);
      done();
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterAll called');
      await tryToEnableBt();
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0400
     * @tc.desc   Test onSetProtocol(callback: Callback<ProtocolData>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onSetProtocol(onReceiveEvent_ProtocolData);
          hidDevice!.offSetProtocol(onReceiveEvent_ProtocolData);
          hilog.info(domain, tag, "[bluetooth_js]hid on/offSetProtocol value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offSetProtocol is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offSetProtocol is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0900
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onSetProtocol(onReceiveEvent_ProtocolData);
          hidDevice!.offSetProtocol();
          hilog.info(domain, tag, "[bluetooth_js]hid on/offSetProtocol value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offSetProtocol is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offSetProtocol is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0300
     * @tc.desc   Test onInterruptDataReceived(callback: Callback<InterruptData>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onInterruptDataReceived(onReceiveEvent_InterruptData);
          hidDevice!.offInterruptDataReceived(onReceiveEvent_InterruptData);
          hilog.info(domain, tag, "[bluetooth_js]hid on/offInterruptDataReceived value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offInterruptDataReceived is fail , errCode:" + err.code + ",errMessage:" +
              err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offInterruptDataReceived is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0800
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onInterruptDataReceived(onReceiveEvent_InterruptData);
          hidDevice!.offInterruptDataReceived();
          hilog.info(domain, tag, "[bluetooth_js]hid on/offInterruptDataReceived value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offInterruptDataReceived is fail , errCode:" + err.code + ",errMessage:" +
              err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offInterruptDataReceived is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENOR_0500
     * @tc.desc   Test reportError 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let error: hid.ErrorReason = hid.ErrorReason.RSP_SUCCESS;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOC_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENOC_0300
     * @tc.desc   Test reportError 已注册未连接 2903053 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOC_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync3();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          expect(result).assertTrue();
          let error: hid.ErrorReason = hid.ErrorReason.RSP_SUCCESS;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903053);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENORMAL_0600
     * @tc.desc   Test reportError 已注册已连接 正常场景 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync7();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          hidDevice!.connect(deviceId);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          let error: hid.ErrorReason = hid.ErrorReason.RSP_SUCCESS;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903053);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_0100
     * @tc.desc   Test reportError 枚举值参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let error: hid.ErrorReason = hid.ErrorReason.RSP_NOT_READY;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_0200
     * @tc.desc   Test reportError 枚举值参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let error: hid.ErrorReason = hid.ErrorReason.RSP_INVALID_REPORT_ID;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_0300
     * @tc.desc   Test reportError 枚举值参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let error: hid.ErrorReason = hid.ErrorReason.RSP_UNSUPPORTED_REQ;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_0400
     * @tc.desc   Test reportError 枚举值参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let error: hid.ErrorReason = hid.ErrorReason.RSP_INVALID_PARAM;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_0500
     * @tc.desc   Test reportError 枚举值参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let error: hid.ErrorReason = hid.ErrorReason.RSP_UNKNOWN;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_0600
     * @tc.desc   Test reportError 非法枚举值参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let error: hid.ErrorReason = 99 as hid.ErrorReason;
          hidDevice!.reportError(error);
          hilog.info(domain, tag, "[bluetooth_js]hid reportError is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid reportError is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else if (err.code === 401) {
            hilog.info(domain, tag, "invalid param");
            expect(err.code).assertEqual(401);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENOR_0200
     * @tc.desc   Test disconnect 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          hidDevice!.disconnect();
          hilog.info(domain, tag, "[bluetooth_js]hid disconnect is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid disconnect is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENORMAL_0300
     * @tc.desc   Test connect 已注册 连接 正常场景 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync4();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          hidDevice!.connect(deviceId);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          await sleep(1000);
          hidDevice!.disconnect();
          hilog.info(domain, tag, "[bluetooth_js]hid disconnect is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903053);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_0800
     * @tc.desc   Test  已注册 connect 入参错误 401 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          hidDevice!.connect(deviceId401);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          await sleep(1000);
          hidDevice!.disconnect();
          hilog.info(domain, tag, "[bluetooth_js]hid disconnect is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_1100
     * @tc.desc   Test connect 参数为virtual时，转为真实地址失败，返回2900099 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          hidDevice!.connect(deviceId1);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          await sleep(1000);
          hidDevice!.disconnect();
          hilog.info(domain, tag, "[bluetooth_js]hid disconnect is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_1200
     * @tc.desc   Test connect 参数为virtual时，转为真实地址失败，返回2900099 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          hidDevice!.connect(deviceId2);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          await sleep(1000);
          hidDevice!.disconnect();
          hilog.info(domain, tag, "[bluetooth_js]hid disconnect is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_1300
     * @tc.desc   Test 已注册 connect 参数报错 401 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          hidDevice!.connect(deviceId401);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          await sleep(1000);
          hidDevice!.disconnect();
          hilog.info(domain, tag, "[bluetooth_js]hid disconnect is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOC_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENOC_0100
     * @tc.desc   Test sendReport 已注册未连接 2903053 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOC_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync1();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          expect(result).assertTrue();
          let id: int = 1;
          // let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          let reportData: Uint8Array = new Uint8Array(8);
          reportData[0] = 0x00;
          reportData[1] = 0x11;
          reportData[2] = 0x22;
          reportData[3] = 0x33;
          reportData[4] = 0x44;
          reportData[5] = 0x55;
          reportData[6] = 0x66;
          reportData[7] = 0x77;
          hidDevice!.sendReport(id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid sendReport is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903053);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOC_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENOC_0200
     * @tc.desc   Test replyReport 已注册未连接 2903053 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOC_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync2();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          expect(result).assertTrue();
          let type1: hid.ReportType = hid.ReportType.REPORT_TYPE_INPUT;
          let id: int = 1;
          // let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          let reportData: Uint8Array = new Uint8Array(8);
          reportData[0] = 0x00;
          reportData[1] = 0x11;
          reportData[2] = 0x22;
          reportData[3] = 0x33;
          reportData[4] = 0x44;
          reportData[5] = 0x55;
          reportData[6] = 0x66;
          reportData[7] = 0x77;
          hidDevice!.replyReport(type1, id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid replyReport is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid replyReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903053);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENORMAL_0400
     * @tc.desc   Test sendReport 已注册已连接 正常场景 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync5();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice is success " + JSON.stringify(result));
          hidDevice!.connect(deviceId);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          let id: int = 1;
          // let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          let reportData: Uint8Array = new Uint8Array(8);
          reportData[0] = 0x00;
          reportData[1] = 0x11;
          reportData[2] = 0x22;
          reportData[3] = 0x33;
          reportData[4] = 0x44;
          reportData[5] = 0x55;
          reportData[6] = 0x66;
          reportData[7] = 0x77;
          hidDevice!.sendReport(id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid sendReport is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903053);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENORMAL_0500
     * @tc.desc   Test replyReport 已注册已连接 正常场景 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync6();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          hidDevice!.connect(deviceId);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          let type1: hid.ReportType = hid.ReportType.REPORT_TYPE_INPUT;
          let id: int = 1;
          // let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          let reportData: Uint8Array = new Uint8Array(8);
          reportData[0] = 0x00;
          reportData[1] = 0x11;
          reportData[2] = 0x22;
          reportData[3] = 0x33;
          reportData[4] = 0x44;
          reportData[5] = 0x55;
          reportData[6] = 0x66;
          reportData[7] = 0x77;
          hidDevice!.replyReport(type1, id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid replyReport is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903053);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_1400
     * @tc.desc   Test 注册 参数覆盖 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync8();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          expect(result).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_1500
     * @tc.desc   Test 注册 参数覆盖 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync9();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          expect(result).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENORMAL_0100
     * @tc.desc   Test 注册 /去注册 -正常场景api23.normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          expect(result).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RR_static_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILERR_0600
     * @tc.desc   Test registerHidDevice 重复注册2903051 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RR_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let result: boolean = await registerHidDeviceAsync();
          let result2: boolean = await registerHidDeviceAsync();
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result));
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice 0100 is success " + JSON.stringify(result2));
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903051);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILERH_0100
     * @tc.desc   Test registerHidDevice sdp.subclass 非法枚举值 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let sdpIllegal: hid.HidDeviceSdp = {
            name: "testName",
            description: "testDescription",
            provider: "testProvoder",
            subclass: 99 as hid.Subclass,
            descriptors: descriptors,
          };
          hidDevice!.registerHidDevice(sdpIllegal, inqos, outqos, (data: boolean) => {
            hilog.info(domain, tag, "[bluetooth_js] registerHidDevice RH 0100 success" + JSON.stringify(data));
          });
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice RH 0100 is called ");
          await sleep(1000);
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else if (err.code === 401) {
            hilog.info(domain, tag, "invalid param");
            expect(err.code).assertEqual(401);
          } else {
            expect(err.code).assertEqual(2903051);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILERH_0200
     * @tc.desc   Test registerHidDevice inQos.serviceType 非法枚举值 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let inqosIllegal: hid.HidDeviceQos = {
            serviceType: 99 as hid.ServiceType,
            tokenRate: 0,
            tokenBucketSize: 0,
            peakBandwidth: 0,
            latency: -1,
            delayVariation: -1,
          };
          hidDevice!.registerHidDevice(sdp, inqosIllegal, outqos, (data: boolean) => {
            hilog.info(domain, tag, "[bluetooth_js] registerHidDevice RH 0200 success" + JSON.stringify(data));
          });
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice RH 0200 is called ");
          await sleep(1000);
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else if (err.code === 401) {
            hilog.info(domain, tag, "invalid param");
            expect(err.code).assertEqual(401);
          } else {
            expect(err.code).assertEqual(2903051);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILERH_0300
     * @tc.desc   Test registerHidDevice outQos.serviceType SERVICE_NO_TRAFFIC api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let outqosNoTraffic: hid.HidDeviceQos = {
            serviceType: hid.ServiceType.SERVICE_NO_TRAFFIC,
            tokenRate: 0,
            tokenBucketSize: 0,
            peakBandwidth: 0,
            latency: -1,
            delayVariation: -1,
          };
          hidDevice!.registerHidDevice(sdp, inqos, outqosNoTraffic, (data: boolean) => {
            hilog.info(domain, tag, "[bluetooth_js] registerHidDevice RH 0300 success" + JSON.stringify(data));
          });
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice RH 0300 is called ");
          await sleep(1000);
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else if (err.code === 401) {
            hilog.info(domain, tag, "invalid param");
            expect(err.code).assertEqual(401);
          } else {
            expect(err.code).assertEqual(2903051);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILERH_0400
     * @tc.desc   Test registerHidDevice outQos.serviceType SERVICE_BEST_EFFORT api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let outqosBestEffort: hid.HidDeviceQos = {
            serviceType: hid.ServiceType.SERVICE_BEST_EFFORT,
            tokenRate: 0,
            tokenBucketSize: 0,
            peakBandwidth: 0,
            latency: -1,
            delayVariation: -1,
          };
          hidDevice!.registerHidDevice(sdp, inqos, outqosBestEffort, (data: boolean) => {
            hilog.info(domain, tag, "[bluetooth_js] registerHidDevice RH 0400 success" + JSON.stringify(data));
          });
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice RH 0400 is called ");
          await sleep(1000);
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else if (err.code === 401) {
            hilog.info(domain, tag, "invalid param");
            expect(err.code).assertEqual(401);
          } else {
            expect(err.code).assertEqual(2903051);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILERH_0500
     * @tc.desc   Test registerHidDevice outQos.serviceType SERVICE_GUARANTEED api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_RH_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let outqosGuaranteed: hid.HidDeviceQos = {
            serviceType: hid.ServiceType.SERVICE_GUARANTEED,
            tokenRate: 0,
            tokenBucketSize: 0,
            peakBandwidth: 0,
            latency: -1,
            delayVariation: -1,
          };
          hidDevice!.registerHidDevice(sdp, inqos, outqosGuaranteed, (data: boolean) => {
            hilog.info(domain, tag, "[bluetooth_js] registerHidDevice RH 0500 success" + JSON.stringify(data));
          });
          hilog.info(domain, tag, "[bluetooth_js]hid registerHidDevice RH 0500 is called ");
          await sleep(1000);
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid registerHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else if (err.code === 401) {
            hilog.info(domain, tag, "invalid param");
            expect(err.code).assertEqual(401);
          } else {
            expect(err.code).assertEqual(2903051);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0100
     * @tc.desc   Test onSetReport(callback: Callback<SetReportData>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onGetReport(onReceiveEvent_GetReportData);
          hidDevice!.offGetReport(onReceiveEvent_GetReportData);
          hilog.info(domain, tag, "[bluetooth_js]hid on/offSetReport value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offSetReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offSetReport is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0600
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onGetReport(onReceiveEvent_GetReportData);
          hidDevice!.offGetReport();
          hilog.info(domain, tag, "[bluetooth_js]hid on/offSetReport value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offSetReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offSetReport is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0200
     * @tc.desc   Test onSetReport(callback: Callback<SetReportData>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onSetReport(onReceiveEvent_SetReportData);
          hidDevice!.offSetReport(onReceiveEvent_SetReportData);
          hilog.info(domain, tag, "[bluetooth_js]hid on/offSetReport value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offSetReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offSetReport is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0700
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onSetReport(onReceiveEvent_SetReportData);
          hidDevice!.offSetReport();
          hilog.info(domain, tag, "[bluetooth_js]hid on/offSetReport value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offSetReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offSetReport is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENORMAL_0200
     * @tc.desc   Test unregisterHidDevice(): void; api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NORMAL_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          hidDevice!.unregisterHidDevice();
          hilog.info(domain, tag, "[bluetooth_js]hid unregisterHidDevice is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid unregisterHidDevice is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENOR_0300
     * @tc.desc   Test sendReport 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let id: int = 1;
          // let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          let reportData: Uint8Array = new Uint8Array(8);
          reportData[0] = 0x00;
          reportData[1] = 0x11;
          reportData[2] = 0x22;
          reportData[3] = 0x33;
          reportData[4] = 0x44;
          reportData[5] = 0x55;
          reportData[6] = 0x66;
          reportData[7] = 0x77;
          hidDevice!.sendReport(id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid sendReport is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid sendReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_0500
     * @tc.desc   Test onVirtualCableUnplug(callback: Callback<void>): void;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onVirtualCableUnplug(onReceiveEvent_void);
          hidDevice!.offVirtualCableUnplug(onReceiveEvent_void);
          hilog.info(domain, tag, "[bluetooth_js]hid on/offVirtualCableUnplug value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offVirtualCableUnplug is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offVirtualCableUnplug is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILEHIDCB_1000
     * @tc.desc   Test off无入参 normal api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_HID_CB_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice!.onVirtualCableUnplug(onReceiveEvent_void);
          hidDevice!.offVirtualCableUnplug();
          hilog.info(domain, tag, "[bluetooth_js]hid on/offVirtualCableUnplug value is success ");
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid on/offVirtualCableUnplug is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]hid on/offVirtualCableUnplug is not support");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_CREAT_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILECREAT_0100
     * @tc.desc   Test function createHidDeviceProfile(): HidDeviceProfile;api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_CREAT_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hidDevice = hid.createHidDeviceProfile();
          hilog.info(domain, tag, "[bluetooth_js]hid createHidDeviceProfile is success ");
          expect(hidDevice != null).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid createHidDeviceProfile is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENOR_0400
     * @tc.desc   Test replyReport 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let type1: hid.ReportType = hid.ReportType.REPORT_TYPE_INPUT;
          let id: int = 1;
          // let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          let reportData: Uint8Array = new Uint8Array(8);
          reportData[0] = 0x00;
          reportData[1] = 0x11;
          reportData[2] = 0x22;
          reportData[3] = 0x33;
          reportData[4] = 0x44;
          reportData[5] = 0x55;
          reportData[6] = 0x66;
          reportData[7] = 0x77;
          hidDevice!.replyReport(type1, id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid replyReport is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid replyReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_0900
     * @tc.desc   Test replyReport 参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let type: hid.ReportType = hid.ReportType.REPORT_TYPE_OUTPUT;
          let id: int = 1;
          // let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          let reportData: Uint8Array = new Uint8Array(8);
          reportData[0] = 0x00;
          reportData[1] = 0x11;
          reportData[2] = 0x22;
          reportData[3] = 0x33;
          reportData[4] = 0x44;
          reportData[5] = 0x55;
          reportData[6] = 0x66;
          reportData[7] = 0x77;
          hidDevice!.replyReport(type, id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid replyReport is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid replyReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_1000
     * @tc.desc   Test replyReport 参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let type: hid.ReportType = hid.ReportType.REPORT_TYPE_FEATURE;
          let id: int = 1;
          let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          hidDevice!.replyReport(type, id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid replyReport is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid replyReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEADD_1600
     * @tc.desc   Test replyReport 非法枚举值参数覆盖 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_ADD_static_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let type: hid.ReportType = 99 as hid.ReportType;
          let id: int = 1;
          let reportData: Uint8Array = new Uint8Array([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
          hidDevice!.replyReport(type, id, reportData);
          hilog.info(domain, tag, "[bluetooth_js]hid replyReport is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid replyReport is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else if (err.code === 401) {
            hilog.info(domain, tag, "invalid param");
            expect(err.code).assertEqual(401);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILENOR_0100
     * @tc.desc   Test connect 未注册 2903052 api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASE_HIDPROFILE_NOR_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          hidDevice!.connect(deviceId);
          hilog.info(domain, tag, "[bluetooth_js]hid connect is success ");
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[bluetooth_js]hid connect is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备（除手机外） is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2903052);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILE_SUBCLASS_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILESUBCLASS_0100
     * @tc.desc   Test hid Subclass EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILE_SUBCLASS_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let SUBCLASS_UNCATEGORIZED = hid.Subclass.SUBCLASS_UNCATEGORIZED;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_UNCATEGORIZED: ' + SUBCLASS_UNCATEGORIZED);
          expect(SUBCLASS_UNCATEGORIZED).assertEqual(0);

          let SUBCLASS_JOYSTICK = hid.Subclass.SUBCLASS_JOYSTICK;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_JOYSTICK: ' + SUBCLASS_JOYSTICK);
          expect(SUBCLASS_JOYSTICK).assertEqual(1);

          let SUBCLASS_GAMEPAD = hid.Subclass.SUBCLASS_GAMEPAD;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_GAMEPAD: ' + SUBCLASS_GAMEPAD);
          expect(SUBCLASS_GAMEPAD).assertEqual(2);

          let SUBCLASS_REMOTE_CONTROL = hid.Subclass.SUBCLASS_REMOTE_CONTROL;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_REMOTE_CONTROL: ' + SUBCLASS_REMOTE_CONTROL);
          expect(SUBCLASS_REMOTE_CONTROL).assertEqual(3);

          let SUBCLASS_SENSING_DEVICE = hid.Subclass.SUBCLASS_SENSING_DEVICE;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_SENSING_DEVICE: ' + SUBCLASS_SENSING_DEVICE);
          expect(SUBCLASS_SENSING_DEVICE).assertEqual(4);

          let SUBCLASS_DIGITIZER_TABLET = hid.Subclass.SUBCLASS_DIGITIZER_TABLET;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_DIGITIZER_TABLET: ' + SUBCLASS_DIGITIZER_TABLET);
          expect(SUBCLASS_DIGITIZER_TABLET).assertEqual(5);

          let SUBCLASS_CARD_READER = hid.Subclass.SUBCLASS_CARD_READER;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_CARD_READER: ' + SUBCLASS_CARD_READER);
          expect(SUBCLASS_CARD_READER).assertEqual(6);

          let SUBCLASS_MOUSE = hid.Subclass.SUBCLASS_MOUSE;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_MOUSE: ' + SUBCLASS_MOUSE);
          expect(SUBCLASS_MOUSE).assertEqual(128);

          let SUBCLASS_COMBO = hid.Subclass.SUBCLASS_COMBO;
          hilog.info(domain, tag, 'hid Subclass SUBCLASS_COMBO: ' + SUBCLASS_COMBO);
          expect(SUBCLASS_COMBO).assertEqual(192);
        } catch (err) {
          hilog.error(domain, tag, "hid Subclass errCode:" + err.code + ",errMessage:" + err.message);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILE_SERVICETYPE_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILESERVICETYPE_0100
     * @tc.desc   Test hid ServiceType EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILE_SERVICETYPE_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let SERVICE_NO_TRAFFIC = hid.ServiceType.SERVICE_NO_TRAFFIC;
          hilog.info(domain, tag, 'hid ServiceType SERVICE_NO_TRAFFIC: ' + SERVICE_NO_TRAFFIC);
          expect(SERVICE_NO_TRAFFIC).assertEqual(0);

          let SERVICE_GUARANTEED = hid.ServiceType.SERVICE_GUARANTEED;
          hilog.info(domain, tag, 'hid ServiceType SERVICE_GUARANTEED: ' + SERVICE_GUARANTEED);
          expect(SERVICE_GUARANTEED).assertEqual(2);
        } catch (err) {
          hilog.error(domain, tag, "hid ServiceType errCode:" + err.code + ",errMessage:" + err.message);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILE_PROTOCOLTYPE_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILEPROTOCOLTYPE_0100
     * @tc.desc   Test hid ProtocolType EnumValue api23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEHIDPROFILE_PROTOCOLTYPE_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let PROTOCOL_BOOT_MODE = hid.ProtocolType.PROTOCOL_BOOT_MODE;
          hilog.info(domain, tag, 'hid ProtocolType PROTOCOL_BOOT_MODE: ' + PROTOCOL_BOOT_MODE);
          expect(PROTOCOL_BOOT_MODE).assertEqual(0);

          let PROTOCOL_REPORT_MODE = hid.ProtocolType.PROTOCOL_REPORT_MODE;
          hilog.info(domain, tag, 'hid ProtocolType PROTOCOL_REPORT_MODE: ' + PROTOCOL_REPORT_MODE);
          expect(PROTOCOL_REPORT_MODE).assertEqual(1);
        } catch (err) {
          hilog.error(domain, tag, "hid ProtocolType errCode:" + err.code + ",errMessage:" + err.message);
          expect().assertFail();
        }
        done();
      })

  })
}