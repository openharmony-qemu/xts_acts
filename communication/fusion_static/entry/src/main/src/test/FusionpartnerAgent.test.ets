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

import hilog from '@ohos.hilog';
import btAccess from '@ohos.bluetooth.access';
import common from '@ohos.bluetooth.common';
import partnerAgent from '@ohos.FusionConnectivity.partnerAgent';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size,
  Hypium
} from '@ohos/hypium-static/src/main/indexStatic';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  UiDirection,
  MouseButton,
  WindowMode,
  PointerMatrix,
  UIElementInfo,
  UIEventObserver
} from '@ohos.UiTest'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import appCommon from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'fusionAgentTest';
let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";
let CLOSE_BT_TEXT: string = "关闭";
let g_context: appCommon.UIAbilityContext;
let btAddr: common.BluetoothAddress = {
  "address": "11:22:33:44:55:66",
  "addressType": common.BluetoothAddressType.REAL,
};
let btAddr1: common.BluetoothAddress = {
  "address": "11:22:33",
  "addressType": common.BluetoothAddressType.VIRTUAL,
};
let btAddr2: common.BluetoothAddress = {
  "address": "11:22:33:44:55:66",
  "addressType": common.BluetoothAddressType.VIRTUAL,
};
let deviceAddress: partnerAgent.PartnerDeviceAddress = {
  "bluetoothAddress": btAddr,
};
let deviceAddress1: partnerAgent.PartnerDeviceAddress = {
  "bluetoothAddress": btAddr1,
};
let deviceAddress2: partnerAgent.PartnerDeviceAddress = {
  "bluetoothAddress": btAddr2,
};
let deviceCapability: partnerAgent.DeviceCapability = {
  "supportBR": true,
  "supportBleAdvertiser": true,
};
let businessCapability: partnerAgent.BusinessCapability = {
  "supportMediaControl": true,
  "supportTelephonyControl": true,
};

let partnerAgentExtensionAbilityName: string = "testAbilityName";

let btAddrRawPublic: common.BluetoothAddress = {
  "address": "AA:BB:CC:DD:EE:FF",
  "addressType": common.BluetoothAddressType.VIRTUAL,
  "rawAddressType": common.BluetoothRawAddressType.PUBLIC,
};
let btAddrRawRandom: common.BluetoothAddress = {
  "address": "11:22:33:44:55:77",
  "addressType": common.BluetoothAddressType.VIRTUAL,
  "rawAddressType": common.BluetoothRawAddressType.RANDOM,
};
let deviceAddressRawPublic: partnerAgent.PartnerDeviceAddress = {
  "bluetoothAddress": btAddrRawPublic,
};
let deviceAddressRawRandom: partnerAgent.PartnerDeviceAddress = {
  "bluetoothAddress": btAddrRawRandom,
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
      await sleep(5000);
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
      await sleep(5000);
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
    let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
    await button1!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] click PERMISSION_TEXT end');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
  }
}

export default function fusionAgentTest(): void {
  describe('fusionAgentTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      try {
        await sleep(2000);
        hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
        g_context = Hypium.get('Context') as appCommon.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.ACCESS_BLUETOOTH')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
          });
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await sleep(1000);
      await clickRequestPermission(PERMISSION_TEXT);
      hilog.info(domain, tag, 'beforeAll called')
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach called')
      await tryToEnableBt()
      done();
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called')
    })
    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'afterAll called')
      await tryToEnableBt()
      hilog.info(domain, tag, 'afterAll called 2')
    })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ISBOOLEAN_static_0100
     * @tc.number SUB_COMMUNICATION_FUSION_ISBOOLEAN_0100
     * @tc.desc   Test function isPartnerAgentSupported(): boolean;API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ISBOOLEAN_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let isSupport = partnerAgent.isPartnerAgentSupported();
          hilog.info(domain, tag,
            "[fusion_js]isPartnerAgentSupported UNKNOWN_REASON value is: " + JSON.stringify(isSupport));
          expect(isSupport == true || isSupport == false).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]PartnerAgentExtensionAbilityDestroyReason is fail , errCode:" + err.code + ",errMessage:" +
              err.message);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ISBOOLEAN_static_0200
     * @tc.number SUB_COMMUNICATION_FUSION_ISBOOLEAN_0200
     * @tc.desc   Test isDeviceBound 没有对端设备返回false API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ISBOOLEAN_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceBound(deviceAddress);
          hilog.info(domain, tag, "[fusion_js]isDeviceBound value is: " + JSON.stringify(is_boolean));
          expect(is_boolean == true || is_boolean == false).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_ISBOOLEAN_static_0300
     * @tc.number SUB_COMMUNICATION_FUSION_ISBOOLEAN_0300
     * @tc.desc   Test isDeviceControlEnabled 没有对端设备返回false API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ISBOOLEAN_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceControlEnabled(deviceAddress);
          hilog.info(domain, tag, "[fusion_js]isDeviceControlEnabled  value is: " + JSON.stringify(is_boolean));
          expect(is_boolean == true || is_boolean == false).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_0100
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_0100
     * @tc.desc   Test isDeviceBound 入参不合法返回401 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceBound(deviceAddress1);
          hilog.info(domain, tag, "[fusion_js]isDeviceBound value is: " + JSON.stringify(is_boolean));
          expect(is_boolean == true || is_boolean == false).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_0200
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_0200
     * @tc.desc   Test isDeviceControlEnabled 入参不合法返回401 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceControlEnabled(deviceAddress1);
          hilog.info(domain, tag, "[fusion_js]isDeviceControlEnabled  value is: " + JSON.stringify(is_boolean));
          expect(is_boolean == true || is_boolean == false).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_0300
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_0300
     * @tc.desc   Test unbindDevice 入参不合法返回401 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.unbindDevice(deviceAddress1);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_1400
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_1400
     * @tc.desc   Test isDeviceBound 参数覆盖  API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceBound(deviceAddress2);
          hilog.info(domain, tag, "[fusion_js]isDeviceBound value is: " + JSON.stringify(is_boolean));
          expect(is_boolean == true || is_boolean == false).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceBound is fail , errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_1500
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_1500
     * @tc.desc   Test isDeviceControlEnabled 没有对端设备返回false 参数覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceControlEnabled(deviceAddress2);
          hilog.info(domain, tag, "[fusion_js]isDeviceControlEnabled  value is: " + JSON.stringify(is_boolean));
          expect(is_boolean == true || is_boolean == false).assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceControlEnabled is fail , errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_1600
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_1600
     * @tc.desc   Test unbindDevice 设备未注册01 参数覆盖API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.unbindDevice(deviceAddress2);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(34900001);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_1700
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_1700
     * @tc.desc   Test bindDevice rawAddressType PUBLIC 枚举覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.bindDevice(deviceAddressRawPublic, deviceCapability, businessCapability,
            partnerAgentExtensionAbilityName);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]bindDevice rawAddressType PUBLIC: errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(34900003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_1800
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_1800
     * @tc.desc   Test bindDevice rawAddressType RANDOM 枚举覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.bindDevice(deviceAddressRawRandom, deviceCapability, businessCapability,
            partnerAgentExtensionAbilityName);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]bindDevice rawAddressType RANDOM: errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(34900003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_2000
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_2000
     * @tc.desc   Test unbindDevice rawAddressType PUBLIC 枚举覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.unbindDevice(deviceAddressRawPublic);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]unbindDevice rawAddressType PUBLIC: errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(34900001);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_2100
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_2100
     * @tc.desc   Test unbindDevice rawAddressType RANDOM 枚举覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.unbindDevice(deviceAddressRawRandom);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]unbindDevice rawAddressType RANDOM: errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(34900001);
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_2200
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_2200
     * @tc.desc   Test isDeviceBound rawAddressType PUBLIC 枚举覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceBound(deviceAddressRawPublic);
          hilog.info(domain, tag,
            "[fusion_js]isDeviceBound rawAddressType PUBLIC value is: " + JSON.stringify(is_boolean));
          expect(typeof is_boolean === "boolean").assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceBound rawAddressType PUBLIC is fail , errCode:" + err.code + ",errMessage:" +
              err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_2300
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_2300
     * @tc.desc   Test isDeviceBound rawAddressType RANDOM 枚举覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceBound(deviceAddressRawRandom);
          hilog.info(domain, tag,
            "[fusion_js]isDeviceBound rawAddressType RANDOM value is: " + JSON.stringify(is_boolean));
          expect(typeof is_boolean === "boolean").assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceBound rawAddressType RANDOM is fail , errCode:" + err.code + ",errMessage:" +
              err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_2400
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_2400
     * @tc.desc   Test isDeviceControlEnabled rawAddressType PUBLIC 枚举覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceControlEnabled(deviceAddressRawPublic);
          hilog.info(domain, tag,
            "[fusion_js]isDeviceControlEnabled rawAddressType PUBLIC value is: " + JSON.stringify(is_boolean));
          expect(typeof is_boolean === "boolean").assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceControlEnabled rawAddressType PUBLIC is fail , errCode:" + err.code + ",errMessage:" +
              err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_ADD_static_2500
     * @tc.number SUB_COMMUNICATION_FUSION_ADD_2500
     * @tc.desc   Test isDeviceControlEnabled rawAddressType RANDOM 枚举覆盖 API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_ADD_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let is_boolean = partnerAgent.isDeviceControlEnabled(deviceAddressRawRandom);
          hilog.info(domain, tag,
            "[fusion_js]isDeviceControlEnabled rawAddressType RANDOM value is: " + JSON.stringify(is_boolean));
          expect(typeof is_boolean === "boolean").assertTrue();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]isDeviceControlEnabled rawAddressType RANDOM is fail , errCode:" + err.code + ",errMessage:" +
              err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_GETDEVICE_static_0100
     * @tc.number SUB_COMMUNICATION_FUSION_AGENT_GETDEVICE_0100
     * @tc.desc   Test function getBoundDevices;API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_GETDEVICE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let result_list = partnerAgent.getBoundDevices();
          if (result_list.length > 0) {
            hilog.info(domain, tag, '[bluetooth_js] getBoundDevices' + JSON.stringify(result_list[0]));
            expect(result_list.length > 0).assertTrue();
            done();
          } else {
            expect(result_list.length === 0).assertTrue();
            done();
          }
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_static_0100
     * @tc.number SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_0100
     * @tc.desc   Test function bindDevice;API 23 没有配对设备报错03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.bindDevice(deviceAddress, deviceCapability, businessCapability,
            partnerAgentExtensionAbilityName);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(34900003);
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_static_0200
     * @tc.number SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_0200
     * @tc.desc   Test function bindDevice;API 23 关闭蓝牙报错05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_BINDEVICE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          btAccess.disableBluetooth();
          await clickRequestPermission(CLOSE_BT_TEXT);
          await sleep(5000);
          await partnerAgent.bindDevice(deviceAddress, deviceCapability, businessCapability,
            partnerAgentExtensionAbilityName);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]bindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(34900005);
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_UNBINDEVICE_static_0100
     * @tc.number SUB_COMMUNICATION_FUSION_AGENT_UNBINDEVICE_0100
     * @tc.desc   Test function bindDevice;API 23 设备未注册01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_UNBINDEVICE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.unbindDevice(deviceAddress);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag,
            "[fusion_js]unbindDevice : The device is not paired. errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "设备 is not support.");
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(34900001);
          }
        }
        done();
      })
  })
}