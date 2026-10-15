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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest';
import bluetooth from '@ohos.bluetooth.access';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'btAccessTest';

function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay)
  });
}

let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";
let CLOSE_BT_TEXT: string = "关闭";

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
}


export default function btAccessTest(): void {
  describe('btAccessTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll called')
      await clickRequestPermission(PERMISSION_TEXT);
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach called')
      let state = bluetooth.getState();
      hilog.info(domain, tag, '[bluetooth_js] bluetooth state =' + JSON.stringify(state));
      if (state != bluetooth.BluetoothState.STATE_ON) {
        bluetooth.enableBluetooth();
        await clickRequestPermission(OPEN_BT_TEXT);
        await sleep(3000);
        let openSt = bluetooth.getState();
        hilog.info(domain, tag, '[bluetooth_js] bluetooth enable state =' + JSON.stringify(openSt));
      }
      done();
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called')
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterAll called')
      await sleep(3000);
      bluetooth.enableBluetoothAsync();
      await sleep(3000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(3000);
      hilog.info(domain, tag, '[bluetooth_js] bluetooth enable state =' + JSON.stringify(bluetooth.getState()));
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_ACCESS_ISBLUETOOTHSUPPORTED_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ACCESSISBLUETOOTHSUPPORTED_0100
     * @tc.desc   20260428API26用例覆盖isBluetoothSupported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_COMMUNICATION_BLUETOOTH_ACCESS_ISBLUETOOTHSUPPORTED_static_0100",
      TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let isSupported = bluetooth.isBluetoothSupported();
          hilog.info(domain, tag, "[bluetooth_js]isBluetoothSupported result:" + isSupported);
          expect(typeof isSupported === 'boolean').assertTrue();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]isBluetoothSupported is failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_ACCESS_CONVERTUUID_ADD_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_ACCESSCONVERTUUIDADD_0200
     * @tc.desc   20251113API22用例覆盖convertUuid 4-4.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("SUB_COMMUNICATION_BLUETOOTH_ACCESS_CONVERTUUID_ADD_static_0200",
      TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let uuid = '';
          let converuuid = bluetooth.convertUuid(uuid);
          hilog.info(domain, tag, "[bluetooth_js]converuuid result:" + JSON.stringify(converuuid));
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]converUuid ADD0200 is failed, code is ${error.code}, message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, "[bluetooth_js]converuuid is not support");
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

  })
}