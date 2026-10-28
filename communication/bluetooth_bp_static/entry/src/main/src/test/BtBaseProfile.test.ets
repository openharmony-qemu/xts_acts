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
  Size
} from '@ohos/hypium-static/src/main/indexStatic'
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
import btAccess from '@ohos.bluetooth.access';
import a2dp from '@ohos.bluetooth.a2dp';
import hid from '@ohos.bluetooth.hid';
import hfp from '@ohos.bluetooth.hfp';
import pbap from '@ohos.bluetooth.pbap';
import opp from '@ohos.bluetooth.opp';
import pan from '@ohos.bluetooth.pan';
import map from '@ohos.bluetooth.map';
import bluetooth from '@ohos.bluetooth.baseProfile';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'btBaseProfileTest';

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

let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";

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

let A2dpSourceProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
let HandsFreeAudioGatewayProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
let HidHostProfile: hid.HidHostProfile = hid.createHidHostProfile();

let PanProfile: pan.PanProfile = pan.createPanProfile();

export default function btBaseProfileTest(): void {
  describe('btBaseProfileTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll called')
      await clickRequestPermission(PERMISSION_TEXT);
      await tryToEnableBt();
      expect(true)
        .assertEqual(A2dpSourceProfile != null && HandsFreeAudioGatewayProfile != null && HidHostProfile != null &&
          PanProfile != null);
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach called')
      await tryToEnableBt()
      done()
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called')
    })
    afterAll(() => {
      hilog.info(domain, tag, 'afterAll called')
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_static_1700
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1700
     * @tc.desc   Test createA2dpSrcProfile/createHfpAgProfile/createHidHostProfile/createPanProfile api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let asp = a2dp.createA2dpSrcProfile();
          expect(true).assertEqual(asp != null);
        } catch (err) {
          hilog.error(domain, tag, "bluetooth createA2dpSrcProfile errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createA2dpSrcProfile is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }

        try {
          let hp = hfp.createHfpAgProfile();
          expect(true).assertEqual(hp != null);
        } catch (err) {
          hilog.error(domain, tag, "bluetooth createHfpAgProfile errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createHfpAgProfile is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }

        try {
          let hhp = hid.createHidHostProfile();
          expect(true).assertEqual(hhp != null);
        } catch (err) {
          hilog.error(domain, tag, "bluetooth createHidHostProfile errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createHidHostProfile is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }

        try {
          let pp = pan.createPanProfile();
          expect(true).assertEqual(pp != null);
        } catch (err) {
          hilog.error(domain, tag, "bluetooth createPanProfile errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createPanProfile is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name SUB_COMMUNICATION_BLUETOOTH_PAN_ISPANSUPPORTED_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PANISPANSUPPORTED_0100
     * @tc.desc 测试 pan.PanProfile.isPanSupported - 设备支持PAN返回值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAN_ISPANSUPPORTED_static_0100', Level.LEVEL0, () => {
      try {
        let panProfile: pan.PanProfile = pan.createPanProfile();
        let result: boolean = panProfile.isPanSupported();
        hilog.info(domain, tag,
          '[bt_arkts] SUB_COMMUNICATION_BLUETOOTH_PAN_ISPANSUPPORTED_static_0100 result is ' + JSON.stringify(result));
        expect(typeof result).assertEqual("boolean");
      } catch (err) {
        hilog.info(domain, tag,
          "[bt_arkts] SUB_COMMUNICATION_BLUETOOTH_PAN_ISPANSUPPORTED_static_0100 error: " + JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(domain, tag, "设备 is not support.");
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PANISTETHERINGON_0100
     * @tc.desc 测试 PanProfile 的 isTetheringOn 方法 - 获取网络共享状态
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_static_0100', Level.LEVEL0, () => {
      let panProfile: pan.PanProfile = pan.createPanProfile();
      try {
        let result: boolean = panProfile.isTetheringOn();
        expect(typeof result).assertEqual('boolean');
        hilog.info(domain, tag, '[bt_arkts] isTetheringOn result is ' + JSON.stringify(result));
      } catch (err) {
        hilog.info(domain, tag, "[bt_arkts] isTetheringOn error: " + JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(domain, tag, "设备 is not support.");
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_MAP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_MAP_0100
     * @tc.desc   Test createMapMseProfile api11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_MAP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let mapMseProfile = map.createMapMseProfile();
          hilog.info(domain, tag, 'MapMse success' + mapMseProfile);
          expect(true).assertEqual(mapMseProfile != null);
        } catch (err) {
          hilog.error(domain, tag,
            "bluetooth map createMapMseProfile errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createMapMseProfile is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_PBAP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PBAP_0100
     * @tc.desc   Test createPbapServerProfile api11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PBAP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let pbapServerProfile = pbap.createPbapServerProfile();
          hilog.info(domain, tag, 'pbapServer success' + pbapServerProfile);
          expect(true).assertEqual(pbapServerProfile != null);
        } catch (err) {
          hilog.error(domain, tag,
            "bluetooth pbap pbapServerProfile errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createPbapServerProfile is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_PANROLE_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PANROLE_0100
     * @tc.desc   Test PanRole enum api26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_PANROLE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let ROLE_PANNAP = bluetooth.PanRole.ROLE_PANNAP;
          hilog.info(domain, tag, 'PanRole ROLE_PANNAP: ' + ROLE_PANNAP);
          expect(ROLE_PANNAP).assertEqual(0);

          let ROLE_PANU = bluetooth.PanRole.ROLE_PANU;
          hilog.info(domain, tag, 'PanRole ROLE_PANU: ' + ROLE_PANU);
          expect(ROLE_PANU).assertEqual(1);
        } catch (err) {
          hilog.error(domain, tag, "bluetooth PanRole errCode:" + err.code + ",errMessage:" + err.message);
          expect().assertFail();
        }
        done();
      })

  })
}