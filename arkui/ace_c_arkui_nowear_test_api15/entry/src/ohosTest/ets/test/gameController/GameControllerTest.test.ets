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
import keyeventlib from 'libkeyeventlib.so';
import Utils from '../common/Utils';

const KEYCODE_BUTTON_A = 2301;
const KEYCODE_BUTTON_B = 2302;
const KEYCODE_BUTTON_X = 2304;
const KEYCODE_BUTTON_Y = 2305;
const KEYCODE_BUTTON_L1 = 2307;
const KEYCODE_BUTTON_R1 = 2308;
const KEYCODE_BUTTON_L2 = 2309;
const KEYCODE_BUTTON_R2 = 2310;
const KEYCODE_BUTTON_SELECT = 2311;
const KEYCODE_BUTTON_START = 2312;
const KEYCODE_BUTTON_MODE = 2313;
const KEYCODE_BUTTON_THUMBL = 2314;
const KEYCODE_BUTTON_THUMBR = 2315;

const AXIS_ABS_X = 0;
const AXIS_ABS_Y = 1;
const AXIS_ABS_Z = 2;
const AXIS_ABS_RZ = 3;
const AXIS_ABS_GAS = 4;
const AXIS_ABS_BRAKE = 5;
const AXIS_ABS_HAT0X = 6;
const AXIS_ABS_HAT0Y = 7;

function assertAllAxisInRange(tag: string): void {
  let absX: number = keyeventlib.GetLastAxisValue(AXIS_ABS_X);
  let absY: number = keyeventlib.GetLastAxisValue(AXIS_ABS_Y);
  let absZ: number = keyeventlib.GetLastAxisValue(AXIS_ABS_Z);
  let absRz: number = keyeventlib.GetLastAxisValue(AXIS_ABS_RZ);
  let absGas: number = keyeventlib.GetLastAxisValue(AXIS_ABS_GAS);
  let absBrake: number = keyeventlib.GetLastAxisValue(AXIS_ABS_BRAKE);
  let absHat0X: number = keyeventlib.GetLastAxisValue(AXIS_ABS_HAT0X);
  let absHat0Y: number = keyeventlib.GetLastAxisValue(AXIS_ABS_HAT0Y);
  console.info(`[${tag}] absX=${absX} absY=${absY} absZ=${absZ} absRz=${absRz} absGas=${absGas} absBrake=${absBrake} absHat0X=${absHat0X} absHat0Y=${absHat0Y}`);
  expect(absHat0Y >= -1 && absHat0Y <= 1).assertTrue();
  expect(absHat0X >= -1 && absHat0X <= 1).assertTrue();
  expect(absX >= -1 && absX <= 1).assertTrue();
  expect(absY >= -1 && absY <= 1).assertTrue();
  expect(absZ >= -1 && absZ <= 1).assertTrue();
  expect(absRz >= -1 && absRz <= 1).assertTrue();
  expect(absGas >= 0 && absGas <= 1).assertTrue();
  expect(absBrake >= 0 && absBrake <= 1).assertTrue();
}

export default function gameControllerTest() {
  describe('GameControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('GameControllerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GameController/GameController',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('GameControllerPage' == pages.name)) {
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push GameController page success');
        }
      } catch (err) {
        console.error('push GameController page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   gameController_button_a_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_a_0100
     * @tc.desc   trigger BUTTON_A and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_a_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_a_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_A);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_a_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_b_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_b_0100
     * @tc.desc   trigger BUTTON_B and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_b_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_b_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_B);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_b_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_x_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_x_0100
     * @tc.desc   trigger BUTTON_X and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_x_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_x_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_X);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_x_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_y_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_y_0100
     * @tc.desc   trigger BUTTON_Y and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_y_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_y_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_Y);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_y_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_l1_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_l1_0100
     * @tc.desc   trigger BUTTON_L1 and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_l1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_l1_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_L1);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_l1_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_r1_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_r1_0100
     * @tc.desc   trigger BUTTON_R1 and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_r1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_r1_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_R1);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_r1_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_l2_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_l2_0100
     * @tc.desc   trigger BUTTON_L2 and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_l2_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_l2_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_L2);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_l2_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_r2_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_r2_0100
     * @tc.desc   trigger BUTTON_R2 and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_r2_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_r2_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_R2);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_r2_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_select_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_select_0100
     * @tc.desc   trigger BUTTON_SELECT and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_select_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_select_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_SELECT);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_select_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_start_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_start_0100
     * @tc.desc   trigger BUTTON_START and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_start_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_start_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_START);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_start_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_mode_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_mode_0100
     * @tc.desc   trigger BUTTON_MODE and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_mode_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_mode_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_MODE);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_mode_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_thumbl_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_thumbl_0100
     * @tc.desc   trigger BUTTON_THUMBL and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_thumbl_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_thumbl_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_THUMBL);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_thumbl_0100');
      done();
    });

    /**
     * @tc.name   gameController_button_thumbr_0100
     * @tc.number SUB_ArkUI_ArkUI_gameController_button_thumbr_0100
     * @tc.desc   trigger BUTTON_THUMBR and verify all axis values in valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gameController_button_thumbr_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gameController_button_thumbr_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KEYCODE_BUTTON_THUMBR);
      await Utils.sleep(500);
      assertAllAxisInRange('gameController_button_thumbr_0100');
      done();
    });
  });
}
