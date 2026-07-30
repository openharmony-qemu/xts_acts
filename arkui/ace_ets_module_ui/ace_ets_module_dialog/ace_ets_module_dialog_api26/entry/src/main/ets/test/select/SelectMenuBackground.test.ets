/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SelectMenuBackground() {
  describe('SelectMenuBackground', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] SelectMenuBackground beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/SelectMenuBackground'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'SelectMenuBackground') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push SelectMenuBackground error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(800);
      console.info('[ARKUI_DYN] SelectMenuBackground afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_SelectMenuBackground_0100
     * @tc.name SUB_ArkUI_DialogApi26_SelectMenuBackground_0100
     * @tc.desc menuBackgroundBlurStyleOptions default open select
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_SelectMenuBackground_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('select_menu_blur'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('OptionA'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_SelectMenuBackground_0200
     * @tc.name SUB_ArkUI_DialogApi26_SelectMenuBackground_0200
     * @tc.desc menuBackgroundBlurStyleOptions blue options open select
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_SelectMenuBackground_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let cfg = await driver.findComponent(ON.id('btn_blur_blue'));
      await cfg.click();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('select_menu_blur'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('OptionB'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_SelectMenuBackground_0300
     * @tc.name SUB_ArkUI_DialogApi26_SelectMenuBackground_0300
     * @tc.desc menuBackgroundBlurStyleOptions undefined/empty open select
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_SelectMenuBackground_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let cfg = await driver.findComponent(ON.id('btn_blur_empty'));
      await cfg.click();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('select_menu_blur'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('OptionC'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_SelectMenuBackground_0400
     * @tc.name SUB_ArkUI_DialogApi26_SelectMenuBackground_0400
     * @tc.desc menuBackgroundEffect purple open select
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_SelectMenuBackground_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let cfg = await driver.findComponent(ON.id('btn_effect_purple'));
      await cfg.click();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('select_menu_effect'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('OptionA'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_SelectMenuBackground_0500
     * @tc.name SUB_ArkUI_DialogApi26_SelectMenuBackground_0500
     * @tc.desc menuBackgroundEffect green open select
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_SelectMenuBackground_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let cfg = await driver.findComponent(ON.id('btn_effect_green'));
      await cfg.click();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('select_menu_effect'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('OptionB'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_SelectMenuBackground_0600
     * @tc.name SUB_ArkUI_DialogApi26_SelectMenuBackground_0600
     * @tc.desc menuBackgroundEffect undefined/empty open select
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_SelectMenuBackground_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let cfg = await driver.findComponent(ON.id('btn_effect_empty'));
      await cfg.click();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('select_menu_effect'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('OptionC'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_SelectMenuBackground_0700
     * @tc.name SUB_ArkUI_DialogApi26_SelectMenuBackground_0700
     * @tc.desc blur inactive + effect combined on select
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_SelectMenuBackground_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let b = await driver.findComponent(ON.id('btn_blur_inactive'));
      await b.click();
      let e = await driver.findComponent(ON.id('btn_effect_default'));
      await e.click();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('select_menu_both'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('OptionA'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_SelectMenuBackground_0700 END');
      done();
    });

  });
}
