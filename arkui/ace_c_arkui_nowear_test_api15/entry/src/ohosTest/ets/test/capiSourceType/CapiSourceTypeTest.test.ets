/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver } from '@ohos.UiTest';
import nativeSourceType from 'libnativeSourceType.so';
import Utils from '../common/Utils';

let displayID: number = AppStorage.get('displayID') ? AppStorage.get('displayID') as number : 0;

const KEYCODE_TAB = 2048;
const KEYCODE_ENTER = 2057;
const KEYCODE_BUTTON_A = 2301;

export default function capiSourceTypeTest() {
  describe('CapiSourceTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CapiSourceTypeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CapiSourceType/CapiSourceType',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('CapiSourceTypePage' == pages.name)) {
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push CapiSourceType page success');
        }
      } catch (err) {
        console.error('push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   capiSourceType_keyboard_0100
     * @tc.number SUB_ArkUI_ArkUI_capiSourceType_keyboard_0100
     * @tc.desc   Tab to keyboard button, Enter, verify sourceType == 4 (keyboard)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capiSourceType_keyboard_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[capiSourceType_keyboard_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_TAB, displayID);
      await Utils.sleep(500);
      await driver.triggerKey(KEYCODE_ENTER, displayID);
      await Utils.sleep(500);
      if (nativeSourceType && nativeSourceType.getLastSourceType) {
        let sourceType: number = nativeSourceType.getLastSourceType();
        console.info('[capiSourceType_keyboard_0100] sourceType=' + sourceType);
        expect(sourceType).assertEqual(4);
      } else {
        console.info('[capiSourceType_keyboard_0100] nativeSourceType not available, skip');
      }
      done();
    });

    /**
     * @tc.name   capiSourceType_gamepad_0100
     * @tc.number SUB_ArkUI_ArkUI_capiSourceType_gamepad_0100
     * @tc.desc   Tab to gamepad button, press A, verify sourceType == 5 (joystick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capiSourceType_gamepad_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[capiSourceType_gamepad_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_TAB, displayID);
      await Utils.sleep(500);
      await driver.triggerKey(KEYCODE_BUTTON_A, displayID);
      await Utils.sleep(500);
      if (nativeSourceType && nativeSourceType.getLastSourceType) {
        let sourceType: number = nativeSourceType.getLastSourceType();
        console.info('[capiSourceType_gamepad_0100] sourceType=' + sourceType);
        expect(sourceType).assertEqual(5);
      } else {
        console.info('[capiSourceType_gamepad_0100] nativeSourceType not available, skip');
      }
      done();
    });
  });
}
