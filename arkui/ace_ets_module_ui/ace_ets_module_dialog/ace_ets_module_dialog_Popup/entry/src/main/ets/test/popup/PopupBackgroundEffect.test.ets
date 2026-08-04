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

import router from '@ohos.router';
import { describe, beforeAll, afterEach, it, expect, Level } from "@ohos/hypium";
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils';

export default function PopupBackgroundEffectTest() {
  describe('PopupBackgroundEffectTest', () => {

    beforeAll(async (done: Function) => {
      console.info("[PopupBackgroundEffectTest] beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupBackgroundTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("[PopupBackgroundEffectTest] get state success " + JSON.stringify(pages));
        if (!("PopupBackgroundTestPage" == pages.name)) {
          console.info("[PopupBackgroundEffectTest] page name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("[PopupBackgroundEffectTest] push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("[PopupBackgroundEffectTest] push page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_ThemeColorMode_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_ThemeColorMode_0100
     * @tc.desc   Test ThemeColorMode.SYSTEM enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_ThemeColorMode_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_ThemeColorMode_0100 START');
      expect(ThemeColorMode.SYSTEM).assertEqual(0);
      console.info('ThemeColorMode.SYSTEM = ' + ThemeColorMode.SYSTEM);
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_ThemeColorMode_0200
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_ThemeColorMode_0200
     * @tc.desc   Test ThemeColorMode.LIGHT enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_ThemeColorMode_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_ThemeColorMode_0200 START');
      expect(ThemeColorMode.LIGHT).assertEqual(1);
      console.info('ThemeColorMode.LIGHT = ' + ThemeColorMode.LIGHT);
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_ThemeColorMode_0300
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_ThemeColorMode_0300
     * @tc.desc   Test ThemeColorMode.DARK enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_ThemeColorMode_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_ThemeColorMode_0300 START');
      expect(ThemeColorMode.DARK).assertEqual(2);
      console.info('ThemeColorMode.DARK = ' + ThemeColorMode.DARK);
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_AdaptiveColor_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_AdaptiveColor_0100
     * @tc.desc   Test AdaptiveColor.DEFAULT enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_AdaptiveColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_AdaptiveColor_0100 START');
      expect(AdaptiveColor.DEFAULT).assertEqual(0);
      console.info('AdaptiveColor.DEFAULT = ' + AdaptiveColor.DEFAULT);
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_AdaptiveColor_0200
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_AdaptiveColor_0200
     * @tc.desc   Test AdaptiveColor.AVERAGE enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_AdaptiveColor_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_AdaptiveColor_0200 START');
      expect(AdaptiveColor.AVERAGE).assertEqual(1);
      console.info('AdaptiveColor.AVERAGE = ' + AdaptiveColor.AVERAGE);
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleActivePolicy_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleActivePolicy_0100
     * @tc.desc   Test BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleActivePolicy_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleActivePolicy_0100 START');
      expect(BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE).assertEqual(0);
      console.info('BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE = ' + BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE);
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleActivePolicy_0200
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleActivePolicy_0200
     * @tc.desc   Test BlurStyleActivePolicy.ALWAYS_ACTIVE enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleActivePolicy_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleActivePolicy_0200 START');
      expect(BlurStyleActivePolicy.ALWAYS_ACTIVE).assertEqual(1);
      console.info('BlurStyleActivePolicy.ALWAYS_ACTIVE = ' + BlurStyleActivePolicy.ALWAYS_ACTIVE);
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleActivePolicy_0300
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleActivePolicy_0300
     * @tc.desc   Test BlurStyleActivePolicy.ALWAYS_INACTIVE enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleActivePolicy_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleActivePolicy_0300 START');
      expect(BlurStyleActivePolicy.ALWAYS_INACTIVE).assertEqual(2);
      console.info('BlurStyleActivePolicy.ALWAYS_INACTIVE = ' + BlurStyleActivePolicy.ALWAYS_INACTIVE);
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_EnumUI_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_EnumUI_0100
     * @tc.desc   Test all enum values via UI buttons
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_EnumUI_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_EnumUI_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btnTheme = await driver.findComponent(ON.id('btn_theme_color_mode'));
      expect(btnTheme).not().assertUndefined();
      await btnTheme.click();
      await Utils.sleep(500);
      let resultText = await driver.findComponent(ON.id('result_text'));
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('SYSTEM=0')).assertLarger(-1);
      expect(resultStr.indexOf('LIGHT=1')).assertLarger(-1);
      expect(resultStr.indexOf('DARK=2')).assertLarger(-1);
      console.info('ThemeColorMode result: ' + resultStr);

      let btnAdaptive = await driver.findComponent(ON.id('btn_adaptive_color'));
      expect(btnAdaptive).not().assertUndefined();
      await btnAdaptive.click();
      await Utils.sleep(500);
      let resultText2 = await driver.findComponent(ON.id('result_text'));
      let resultStr2 = await resultText2.getText();
      expect(resultStr2.indexOf('DEFAULT=0')).assertLarger(-1);
      expect(resultStr2.indexOf('AVERAGE=1')).assertLarger(-1);
      console.info('AdaptiveColor result: ' + resultStr2);

      let btnPolicy = await driver.findComponent(ON.id('btn_blur_policy'));
      expect(btnPolicy).not().assertUndefined();
      await btnPolicy.click();
      await Utils.sleep(500);
      let resultText3 = await driver.findComponent(ON.id('result_text'));
      let resultStr3 = await resultText3.getText();
      expect(resultStr3.indexOf('FOLLOWS_WINDOW=0')).assertLarger(-1);
      expect(resultStr3.indexOf('ALWAYS_ACTIVE=1')).assertLarger(-1);
      expect(resultStr3.indexOf('ALWAYS_INACTIVE=2')).assertLarger(-1);
      console.info('BlurStyleActivePolicy result: ' + resultStr3);

      console.info('PopupBackgroundEffectTest_EnumUI_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_colorMode_LIGHT_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_colorMode_LIGHT_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions colorMode=LIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_LIGHT_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_LIGHT_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blur_opts_light'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('colorMode=LIGHT'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with colorMode=LIGHT visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_LIGHT_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_colorMode_DARK_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_colorMode_DARK_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions colorMode=DARK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_DARK_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_DARK_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blur_opts_dark'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('colorMode=DARK'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with colorMode=DARK visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_DARK_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_colorMode_SYSTEM_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_colorMode_SYSTEM_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions colorMode=SYSTEM(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_SYSTEM_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_SYSTEM_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blur_opts_system'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('colorMode=SYSTEM'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with colorMode=SYSTEM visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_colorMode_SYSTEM_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_adaptiveColor_DEFAULT_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_adaptiveColor_DEFAULT_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions adaptiveColor=DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_adaptiveColor_DEFAULT_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_adaptiveColor_DEFAULT_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blur_opts_adaptive_default'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('adaptiveColor=DEFAULT'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with adaptiveColor=DEFAULT visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_adaptiveColor_DEFAULT_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_adaptiveColor_AVERAGE_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_adaptiveColor_AVERAGE_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions adaptiveColor=AVERAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_adaptiveColor_AVERAGE_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_adaptiveColor_AVERAGE_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blur_opts_adaptive_average'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('adaptiveColor=AVERAGE'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with adaptiveColor=AVERAGE visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_adaptiveColor_AVERAGE_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_scale_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_scale_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions scale boundary values (0, 0.5, 1.0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_scale_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_scale_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn0 = await driver.findComponent(ON.id('btn_blur_opts_scale_0'));
      expect(btn0).not().assertUndefined();
      await btn0.click();
      await Utils.sleep(1500);
      let popupText0 = await driver.findComponent(ON.text('scale=0'));
      expect(popupText0).not().assertUndefined();
      await btn0.click();
      await Utils.sleep(500);

      let btn05 = await driver.findComponent(ON.id('btn_blur_opts_scale_05'));
      expect(btn05).not().assertUndefined();
      await btn05.click();
      await Utils.sleep(1500);
      let popupText05 = await driver.findComponent(ON.text('scale=0.5'));
      expect(popupText05).not().assertUndefined();
      await btn05.click();
      await Utils.sleep(500);

      let btn1 = await driver.findComponent(ON.id('btn_blur_opts_scale_1'));
      expect(btn1).not().assertUndefined();
      await btn1.click();
      await Utils.sleep(1500);
      let popupText1 = await driver.findComponent(ON.text('scale=1.0'));
      expect(popupText1).not().assertUndefined();
      await btn1.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_scale_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_blurOptions_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_blurOptions_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions blurOptions grayscale values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_blurOptions_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_blurOptions_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn00 = await driver.findComponent(ON.id('btn_blur_opts_gray_00'));
      expect(btn00).not().assertUndefined();
      await btn00.click();
      await Utils.sleep(1500);
      let popupText00 = await driver.findComponent(ON.text('grayscale=[0,0]'));
      expect(popupText00).not().assertUndefined();
      await btn00.click();
      await Utils.sleep(500);

      let btn20100 = await driver.findComponent(ON.id('btn_blur_opts_gray_20100'));
      expect(btn20100).not().assertUndefined();
      await btn20100.click();
      await Utils.sleep(1500);
      let popupText20100 = await driver.findComponent(ON.text('grayscale=[20,100]'));
      expect(popupText20100).not().assertUndefined();
      await btn20100.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_blurOptions_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_policy_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_policy_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions policy enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_policy_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_policy_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btnFollows = await driver.findComponent(ON.id('btn_blur_opts_policy_follows'));
      expect(btnFollows).not().assertUndefined();
      await btnFollows.click();
      await Utils.sleep(1500);
      let popupTextFollows = await driver.findComponent(ON.text('policy=FOLLOWS_WINDOW_ACTIVE_STATE'));
      expect(popupTextFollows).not().assertUndefined();
      await btnFollows.click();
      await Utils.sleep(500);

      let btnAlways = await driver.findComponent(ON.id('btn_blur_opts_policy_always'));
      expect(btnAlways).not().assertUndefined();
      await btnAlways.click();
      await Utils.sleep(1500);
      let popupTextAlways = await driver.findComponent(ON.text('policy=ALWAYS_ACTIVE'));
      expect(popupTextAlways).not().assertUndefined();
      await btnAlways.click();
      await Utils.sleep(500);

      let btnInactive = await driver.findComponent(ON.id('btn_blur_opts_policy_inactive'));
      expect(btnInactive).not().assertUndefined();
      await btnInactive.click();
      await Utils.sleep(1500);
      let popupTextInactive = await driver.findComponent(ON.text('policy=ALWAYS_INACTIVE'));
      expect(popupTextInactive).not().assertUndefined();
      await btnInactive.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_policy_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_inactiveColor_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_inactiveColor_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions inactiveColor parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_inactiveColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_inactiveColor_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blur_opts_inactive_color'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('inactiveColor'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with inactiveColor visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_inactiveColor_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_BlurStyleOpts_AllParams_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_BlurStyleOpts_AllParams_0100
     * @tc.desc   Test PopupOptions backgroundBlurStyleOptions with all params combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_BlurStyleOpts_AllParams_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_BlurStyleOpts_AllParams_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blur_opts_all_params'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('All backgroundBlurStyleOptions params'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with all BlurStyleOpts params visible');

      let resultText = await driver.findComponent(ON.id('result_text'));
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('BlurStyleOpts')).assertLarger(-1);
      console.info('result: ' + resultStr);

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_BlurStyleOpts_AllParams_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_radius_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_radius_0100
     * @tc.desc   Test PopupOptions backgroundEffect radius parameter (0 and 60)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_radius_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_radius_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn0 = await driver.findComponent(ON.id('btn_effect_radius_0'));
      expect(btn0).not().assertUndefined();
      await btn0.click();
      await Utils.sleep(1500);
      let popupText0 = await driver.findComponent(ON.text('radius=0'));
      expect(popupText0).not().assertUndefined();
      await btn0.click();
      await Utils.sleep(500);

      let btn60 = await driver.findComponent(ON.id('btn_effect_radius_60'));
      expect(btn60).not().assertUndefined();
      await btn60.click();
      await Utils.sleep(1500);
      let popupText60 = await driver.findComponent(ON.text('radius=60'));
      expect(popupText60).not().assertUndefined();
      await btn60.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_radius_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_saturation_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_saturation_0100
     * @tc.desc   Test PopupOptions backgroundEffect saturation parameter (0 and 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_saturation_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_saturation_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn0 = await driver.findComponent(ON.id('btn_effect_sat_0'));
      expect(btn0).not().assertUndefined();
      await btn0.click();
      await Utils.sleep(1500);
      let popupText0 = await driver.findComponent(ON.text('saturation=0'));
      expect(popupText0).not().assertUndefined();
      await btn0.click();
      await Utils.sleep(500);

      let btn10 = await driver.findComponent(ON.id('btn_effect_sat_10'));
      expect(btn10).not().assertUndefined();
      await btn10.click();
      await Utils.sleep(1500);
      let popupText10 = await driver.findComponent(ON.text('saturation=10'));
      expect(popupText10).not().assertUndefined();
      await btn10.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_saturation_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_brightness_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_brightness_0100
     * @tc.desc   Test PopupOptions backgroundEffect brightness parameter (0, 1, 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_brightness_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_brightness_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn0 = await driver.findComponent(ON.id('btn_effect_bright_0'));
      expect(btn0).not().assertUndefined();
      await btn0.click();
      await Utils.sleep(1500);
      let popupText0 = await driver.findComponent(ON.text('brightness=0'));
      expect(popupText0).not().assertUndefined();
      await btn0.click();
      await Utils.sleep(500);

      let btn1 = await driver.findComponent(ON.id('btn_effect_bright_1'));
      expect(btn1).not().assertUndefined();
      await btn1.click();
      await Utils.sleep(1500);
      let popupText1 = await driver.findComponent(ON.text('brightness=1'));
      expect(popupText1).not().assertUndefined();
      await btn1.click();
      await Utils.sleep(500);

      let btn2 = await driver.findComponent(ON.id('btn_effect_bright_2'));
      expect(btn2).not().assertUndefined();
      await btn2.click();
      await Utils.sleep(1500);
      let popupText2 = await driver.findComponent(ON.text('brightness=2'));
      expect(popupText2).not().assertUndefined();
      await btn2.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_brightness_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_color_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_color_0100
     * @tc.desc   Test PopupOptions backgroundEffect color parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_color_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_color_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_effect_color'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('color=Color.Pink'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with color visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_color_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_adaptiveColor_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_adaptiveColor_0100
     * @tc.desc   Test PopupOptions backgroundEffect adaptiveColor parameter (DEFAULT and AVERAGE)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_adaptiveColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_adaptiveColor_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btnDefault = await driver.findComponent(ON.id('btn_effect_adaptive_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await Utils.sleep(1500);
      let popupTextDefault = await driver.findComponent(ON.text('adaptiveColor=DEFAULT'));
      expect(popupTextDefault).not().assertUndefined();
      await btnDefault.click();
      await Utils.sleep(500);

      let btnAverage = await driver.findComponent(ON.id('btn_effect_adaptive_average'));
      expect(btnAverage).not().assertUndefined();
      await btnAverage.click();
      await Utils.sleep(1500);
      let popupTextAverage = await driver.findComponent(ON.text('adaptiveColor=AVERAGE'));
      expect(popupTextAverage).not().assertUndefined();
      await btnAverage.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_adaptiveColor_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_blurOptions_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_blurOptions_0100
     * @tc.desc   Test PopupOptions backgroundEffect blurOptions grayscale parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_blurOptions_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_blurOptions_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn00 = await driver.findComponent(ON.id('btn_effect_gray_00'));
      expect(btn00).not().assertUndefined();
      await btn00.click();
      await Utils.sleep(1500);
      let popupText00 = await driver.findComponent(ON.text('grayscale=[0,0]'));
      expect(popupText00).not().assertUndefined();
      await btn00.click();
      await Utils.sleep(500);

      let btn20100 = await driver.findComponent(ON.id('btn_effect_gray_20100'));
      expect(btn20100).not().assertUndefined();
      await btn20100.click();
      await Utils.sleep(1500);
      let popupText20100 = await driver.findComponent(ON.text('grayscale=[20,100]'));
      expect(popupText20100).not().assertUndefined();
      await btn20100.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_blurOptions_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_policy_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_policy_0100
     * @tc.desc   Test PopupOptions backgroundEffect policy enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_policy_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_policy_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btnFollows = await driver.findComponent(ON.id('btn_effect_policy_follows'));
      expect(btnFollows).not().assertUndefined();
      await btnFollows.click();
      await Utils.sleep(1500);
      let popupTextFollows = await driver.findComponent(ON.text('policy=FOLLOWS_WINDOW_ACTIVE_STATE'));
      expect(popupTextFollows).not().assertUndefined();
      await btnFollows.click();
      await Utils.sleep(500);

      let btnAlways = await driver.findComponent(ON.id('btn_effect_policy_always'));
      expect(btnAlways).not().assertUndefined();
      await btnAlways.click();
      await Utils.sleep(1500);
      let popupTextAlways = await driver.findComponent(ON.text('policy=ALWAYS_ACTIVE'));
      expect(popupTextAlways).not().assertUndefined();
      await btnAlways.click();
      await Utils.sleep(500);

      let btnInactive = await driver.findComponent(ON.id('btn_effect_policy_inactive'));
      expect(btnInactive).not().assertUndefined();
      await btnInactive.click();
      await Utils.sleep(1500);
      let popupTextInactive = await driver.findComponent(ON.text('policy=ALWAYS_INACTIVE'));
      expect(popupTextInactive).not().assertUndefined();
      await btnInactive.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_policy_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_inactiveColor_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_inactiveColor_0100
     * @tc.desc   Test PopupOptions backgroundEffect inactiveColor parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_inactiveColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_inactiveColor_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_effect_inactive_color'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('inactiveColor'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with effect inactiveColor visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_inactiveColor_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Effect_AllParams_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Effect_AllParams_0100
     * @tc.desc   Test PopupOptions backgroundEffect with all params combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Effect_AllParams_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Effect_AllParams_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_effect_all_params'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('All backgroundEffect params'));
      expect(popupText).not().assertUndefined();
      console.info('Popup with all Effect params visible');

      let resultText = await driver.findComponent(ON.id('result_text'));
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('EffectParams')).assertLarger(-1);
      console.info('result: ' + resultStr);

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Effect_AllParams_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_CustomBlurStyleOpts_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_CustomBlurStyleOpts_0100
     * @tc.desc   Test CustomPopupOptions backgroundBlurStyleOptions with all params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_CustomBlurStyleOpts_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_CustomBlurStyleOpts_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_custom_blur_opts'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('CustomPopup Test'));
      expect(popupText).not().assertUndefined();
      console.info('CustomPopup with BlurStyleOpts visible');

      let resultText = await driver.findComponent(ON.id('result_text'));
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('BlurStyleOpts')).assertLarger(-1);
      console.info('result: ' + resultStr);

      let closeBtn = await driver.findComponent(ON.id('close_popup'));
      expect(closeBtn).not().assertUndefined();
      await closeBtn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_CustomBlurStyleOpts_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_CustomEffect_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_CustomEffect_0100
     * @tc.desc   Test CustomPopupOptions backgroundEffect with all params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_CustomEffect_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_CustomEffect_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_custom_effect'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('CustomPopup Test'));
      expect(popupText).not().assertUndefined();
      console.info('CustomPopup with Effect visible');

      let resultText = await driver.findComponent(ON.id('result_text'));
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('Effect')).assertLarger(-1);
      console.info('result: ' + resultStr);

      let closeBtn = await driver.findComponent(ON.id('close_popup'));
      expect(closeBtn).not().assertUndefined();
      await closeBtn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_CustomEffect_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_Default_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_Default_0100
     * @tc.desc   Test PopupOptions without backgroundBlurStyleOptions or backgroundEffect (default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_Default_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_Default_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_no_background'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(1500);

      let popupText = await driver.findComponent(ON.text('Popup without'));
      expect(popupText).not().assertUndefined();
      console.info('Popup without backgroundOpts visible');

      await btn.click();
      await Utils.sleep(500);

      console.info('PopupBackgroundEffectTest_Default_0100 END');
      done();
    });

    /**
     * @tc.name   PopupBackgroundEffectTest_ReturnValue_0100
     * @tc.number SUB_ARKUI_API_PopupBackgroundEffect_ReturnValue_0100
     * @tc.desc   Test bindPopup returns T (component itself) for chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PopupBackgroundEffectTest_ReturnValue_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PopupBackgroundEffectTest_ReturnValue_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_return_check'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('T')).assertLarger(-1);
      console.info('ReturnValue result: ' + resultStr);
      console.info('PopupBackgroundEffectTest_ReturnValue_0100 END');
      done();
    });
  })
}