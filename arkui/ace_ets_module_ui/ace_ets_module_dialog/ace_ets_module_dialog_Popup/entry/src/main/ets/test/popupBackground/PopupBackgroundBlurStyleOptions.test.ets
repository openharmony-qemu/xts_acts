/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function PopupBackgroundBlurStyleOptions() {
  describe('PopupBackgroundBlurStyleOptions', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupBackground/PopupBackgroundBlurStyleOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PopupBackgroundBlurStyleOptions state success ' + JSON.stringify(pages));
        if (!('PopupBackgroundBlurStyleOptions' == pages.name)) {
          console.info('get PopupBackgroundBlurStyleOptions state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push PopupBackgroundBlurStyleOptions page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PopupBackgroundBlurStyleOptions page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PopupBackgroundBlurStyleOptions after each called");
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0100
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions policy FOLLOWS_WINDOW_ACTIVE_STATE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0100', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_FOLLOWS_WINDOW_ACTIVE_STATE'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup policy FOLLOWS_WINDOW_ACTIVE_STATE'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0200
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0200
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions policy ALWAYS_ACTIVE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0200', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_ACTIVE'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup policy ALWAYS_ACTIVE'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0200 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0300
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0300
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions policy ALWAYS_INACTIVE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0300', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_INACTIVE'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup policy ALWAYS_INACTIVE'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0300 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0400
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0400
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions inactiveColor with Color.Red
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0400', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_red'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup inactiveColor red'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0400 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0500
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0500
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions inactiveColor with string '#FFFF0000'
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0500', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_string'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup inactiveColor string'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0500 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0600
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0600
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions inactiveColor with number 0xFFFF0000
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0600', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_number'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup inactiveColor number'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0600 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0700
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0700
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions colorMode ThemeColorMode.LIGHT
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0700', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('colorMode_LIGHT'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup colorMode LIGHT'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0700 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0800
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0800
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions colorMode ThemeColorMode.DARK
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0800', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('colorMode_DARK'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup colorMode DARK'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0800 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_0900
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_0900
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions adaptiveColor AdaptiveColor.DEFAULT
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_0900', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_DEFAULT'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup adaptiveColor DEFAULT'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_0900 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_1000
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_1000
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions adaptiveColor AdaptiveColor.AVERAGE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_1000', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_AVERAGE'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup adaptiveColor AVERAGE'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_1000 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_1100
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_1100
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions scale 0
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_1100', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_0'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup scale 0'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_1100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_1200
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_1200
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions scale 1
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_1200', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup scale 1'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_1200 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_1300
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_1300
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions scale 2
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_1300', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup scale 2'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_1300 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundBlurStyleOptions_1400
     * @tc.number SUB_ARKUI_API_PopupBackgroundBlurStyleOptions_1400
     * @tc.desc   To test PopupOptions backgroundBlurStyleOptions with all combined properties
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundBlurStyleOptions_1400', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundBlurStyleOptions_1400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('combinedOptions'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup combined options'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundBlurStyleOptions_1400 END');
      done();
    });
  })
}