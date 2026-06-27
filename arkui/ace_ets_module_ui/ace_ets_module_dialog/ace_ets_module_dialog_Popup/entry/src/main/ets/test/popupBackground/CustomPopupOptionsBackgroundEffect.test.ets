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

export default function CustomPopupOptionsBackgroundEffect() {
  describe('CustomPopupOptionsBackgroundEffect', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomPopupOptionsBackgroundEffect beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupBackground/CustomPopupOptionsBackgroundEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomPopupOptionsBackgroundEffect state pages: " + JSON.stringify(pages));
        if (!("CustomPopupOptionsBackgroundEffect" == pages.name)) {
          console.info("get CustomPopupOptionsBackgroundEffect state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomPopupOptionsBackgroundEffect success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomPopupOptionsBackgroundEffect page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CustomPopupOptionsBackgroundEffect after each called");
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0100
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0100
     * @tc.desc   To test CustomPopupOptions backgroundEffect radius 0
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0100', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('radius_0'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_0100 Popup radius 0 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0100 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0200
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0200
     * @tc.desc   To test CustomPopupOptions backgroundEffect radius 20
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0200', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('radius_20'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_0200 Popup radius 20 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0200 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0300
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0300
     * @tc.desc   To test CustomPopupOptions backgroundEffect radius 60
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0300', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('radius_60'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      
      console.info('CustomPopupOptionsBackgroundEffect_0300 Popup radius 60 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0300 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0400
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0400
     * @tc.desc   To test CustomPopupOptions backgroundEffect saturation 0
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0400', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('saturation_0'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_0400 Popup saturation 0 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0400 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0500
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0500
     * @tc.desc   To test CustomPopupOptions backgroundEffect saturation 1
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0500', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('saturation_1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_0500 Popup saturation 1 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0500 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0600
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0600
     * @tc.desc   To test CustomPopupOptions backgroundEffect saturation 2
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0600', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('saturation_2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_0600 Popup saturation 2 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0600 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0700
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0700
     * @tc.desc   To test CustomPopupOptions backgroundEffect brightness 0
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0700', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('brightness_0'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_0700 Popup brightness 0 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0700 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0800
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0800
     * @tc.desc   To test CustomPopupOptions backgroundEffect brightness 1
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0800', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('brightness_1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_0800 Popup brightness 1 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0800 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_0900
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_0900
     * @tc.desc   To test CustomPopupOptions backgroundEffect brightness 2
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_0900', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('brightness_2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_0900 Popup brightness 2 is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_0900 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_1000
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_1000
     * @tc.desc   To test CustomPopupOptions backgroundEffect color Color.Red
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_1000', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('color_red'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_1000 Popup color Color.Red is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_1000 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_1100
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_1100
     * @tc.desc   To test CustomPopupOptions backgroundEffect color string '#80FF0000'
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_1100', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('color_string'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_1100 Popup color string is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_1100 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_1200
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_1200
     * @tc.desc   To test CustomPopupOptions backgroundEffect adaptiveColor DEFAULT
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_1200', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_DEFAULT'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_1200 Popup adaptiveColor DEFAULT is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_1200 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_1300
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_1300
     * @tc.desc   To test CustomPopupOptions backgroundEffect adaptiveColor AVERAGE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_1300', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_AVERAGE'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_1300 Popup adaptiveColor AVERAGE is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_1300 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_1400
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_1400
     * @tc.desc   To test CustomPopupOptions backgroundEffect policy ALWAYS_ACTIVE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_1400', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_1400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_ACTIVE'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_1400 Popup policy ALWAYS_ACTIVE is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_1400 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_1500
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_1500
     * @tc.desc   To test CustomPopupOptions backgroundEffect policy ALWAYS_INACTIVE with inactiveColor
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_1500', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_1500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_INACTIVE_inactiveColor'));
      await button.click();
      await CommonFunc.sleep(1000);

      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(popupText != null).assertTrue();
      console.info('CustomPopupOptionsBackgroundEffect_1500 Popup policy ALWAYS_INACTIVE inactiveColor is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.id('close_popup'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsBackgroundEffect_1500 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsBackgroundEffect_1600
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsBackgroundEffect_1600
     * @tc.desc   To test CustomPopupOptions backgroundEffect with all combined properties
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsBackgroundEffect_1600', Level.LEVEL2, async (done: Function) => {
      console.info('CustomPopupOptionsBackgroundEffect_1600 START');
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
      console.info('CustomPopupOptionsBackgroundEffect_1600 END');
      done();
    });
  })
}