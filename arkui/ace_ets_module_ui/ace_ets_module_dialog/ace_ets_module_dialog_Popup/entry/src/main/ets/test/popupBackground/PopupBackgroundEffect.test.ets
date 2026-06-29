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

export default function PopupBackgroundEffect() {
  describe('PopupBackgroundEffect', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupBackground/PopupBackgroundEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PopupBackgroundEffect state success ' + JSON.stringify(pages));
        if (!('PopupBackgroundEffect' == pages.name)) {
          console.info('get PopupBackgroundEffect state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push PopupBackgroundEffect page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PopupBackgroundEffect page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PopupBackgroundEffect after each called");
    });

    /**
     * @tc.name   PopupBackgroundEffect_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0100
     * @tc.desc   To test PopupOptions backgroundEffect radius 0
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0100', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('radius_0'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup radius 0'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_0200
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0200
     * @tc.desc   To test PopupOptions backgroundEffect radius 20
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0200', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('radius_20'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup radius 20'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0200 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_0300
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0300
     * @tc.desc   To test PopupOptions backgroundEffect radius 60
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0300', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('radius_60'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup radius 60'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0300 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_0400
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0400
     * @tc.desc   To test PopupOptions backgroundEffect saturation 0
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0400', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('saturation_0'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup saturation 0'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0400 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_0500
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0500
     * @tc.desc   To test PopupOptions backgroundEffect saturation 1
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0500', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('saturation_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup saturation 1'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0500 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_0600
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0600
     * @tc.desc   To test PopupOptions backgroundEffect saturation 2
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0600', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('saturation_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup saturation 2'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0600 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_0700
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0700
     * @tc.desc   To test PopupOptions backgroundEffect brightness 0
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0700', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('brightness_0'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup brightness 0'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0700 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_0800
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0800
     * @tc.desc   To test PopupOptions backgroundEffect brightness 1
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0800', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('brightness_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup brightness 1'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0800 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_0900
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_0900
     * @tc.desc   To test PopupOptions backgroundEffect brightness 2
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_0900', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('brightness_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup brightness 2'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_0900 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_1000
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_1000
     * @tc.desc   To test PopupOptions backgroundEffect color Color.Red
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_1000', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('color_red'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup color red'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_1000 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_1100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_1100
     * @tc.desc   To test PopupOptions backgroundEffect color string '#80FF0000'
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_1100', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('color_string'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup color string'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_1100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_1200
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_1200
     * @tc.desc   To test PopupOptions backgroundEffect adaptiveColor DEFAULT
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_1200', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_DEFAULT'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup adaptiveColor DEFAULT'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_1200 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_1300
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_1300
     * @tc.desc   To test PopupOptions backgroundEffect adaptiveColor AVERAGE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_1300', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_AVERAGE'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup adaptiveColor AVERAGE'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_1300 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_1400
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_1400
     * @tc.desc   To test PopupOptions backgroundEffect policy ALWAYS_ACTIVE
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_1400', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_1400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_ACTIVE'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup policy ALWAYS_ACTIVE'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_1400 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_1500
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_1500
     * @tc.desc   To test PopupOptions backgroundEffect policy ALWAYS_INACTIVE with inactiveColor
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_1500', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_1500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_INACTIVE_inactiveColor'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup policy ALWAYS_INACTIVE inactiveColor'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_1500 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffect_1600
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_1600
     * @tc.desc   To test PopupOptions backgroundEffect with all combined properties
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupBackgroundEffect_1600', Level.LEVEL2, async (done: Function) => {
      console.info('PopupBackgroundEffect_1600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('combinedOptions'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('Popup combined effect options'));
      expect(popupText != null).assertTrue();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupBackgroundEffect_1600 END');
      done();
    });
  })
}