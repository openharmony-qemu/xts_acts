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
import { Driver, ON, BY } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CustomPopupOptionsBackgroundBlurStyleOptions() {
  describe('CustomPopupOptionsBackgroundBlurStyleOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomPopupOptionsBackgroundBlurStyleOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupBackground/CustomPopupOptionsBackgroundBlurStyleOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomPopupOptionsBackgroundBlurStyleOptions state pages: " + JSON.stringify(pages));
        if (!("CustomPopupOptionsBackgroundBlurStyleOptions" == pages.name)) {
          console.info("get CustomPopupOptionsBackgroundBlurStyleOptions state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomPopupOptionsBackgroundBlurStyleOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomPopupOptionsBackgroundBlurStyleOptions page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CustomPopupOptionsBackgroundBlurStyleOptions after each called");
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0100
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0100
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions policy FOLLOWS_WINDOW_ACTIVE_STATE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0100', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_FOLLOWS_WINDOW_ACTIVE_STATE'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0100 Popup policy FOLLOWS_WINDOW_ACTIVE_STATE is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0100 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0200
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0200
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions policy ALWAYS_ACTIVE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0200', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_ACTIVE'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0200 Popup policy ALWAYS_ACTIVE is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0200 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0300
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0300
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions policy ALWAYS_INACTIVE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0300', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_INACTIVE'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0300 Popup policy ALWAYS_INACTIVE is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0300 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0400
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0400
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions inactiveColor Color.Red
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0400', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_red'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0400 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0500
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0500
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions inactiveColor string '#FFFF0000'
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0500', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_string'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0500 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0600
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0600
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions inactiveColor number 0xFFFF0000
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0600', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_number'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0600 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0700
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0700
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions colorMode ThemeColorMode.LIGHT
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0700', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('colorMode_LIGHT'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0700 Popup colorMode LIGHT is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0700 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0800
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0800
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions colorMode ThemeColorMode.DARK
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0800', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('colorMode_DARK'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0800 Popup colorMode DARK is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0800 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_0900
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_0900
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions adaptiveColor AdaptiveColor.DEFAULT
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_0900', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_DEFAULT'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0900 Popup adaptiveColor DEFAULT is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_0900 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_1000
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_1000
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions adaptiveColor AdaptiveColor.AVERAGE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_1000', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_AVERAGE'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1000 Popup adaptiveColor AVERAGE is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1000 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_1100
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_1100
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions scale 0
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_1100', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_0'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1100 Popup scale 0 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1100 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_1200
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_1200
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions scale 1
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_1200', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1200 Popup scale 1 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1200 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_1300
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_1300
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions scale 2
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_1300', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1300 Popup scale 2 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1300 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundBlurStyleOptions_1400
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundBlurStyleOptions_1400
     * @tc.desc   To test CustomPopupOptions backgroundBlurStyleOptions with all combined properties
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundBlurStyleOptions_1400', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('combinedOptions'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundBlurStyleOptions_1400 END');
      done();
    });
  })
}