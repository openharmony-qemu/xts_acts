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

export default function PopupOptionsColorMode() {
  describe('PopupOptionsColorMode', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] PopupOptionsColorMode beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupOptionsColorMode'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'PopupOptionsColorMode') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push PopupOptionsColorMode error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(800);
      console.info('[ARKUI_DYN] PopupOptionsColorMode afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0100
     * @tc.name SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0100
     * @tc.desc PopupOptions colorMode FOLLOW_SYSTEM shows popup text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_popup_color_follow_system'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions colorMode FOLLOW_SYSTEM'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0200
     * @tc.name SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0200
     * @tc.desc PopupOptions colorMode FOLLOW_TARGET shows popup text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_popup_color_follow_target'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions colorMode FOLLOW_TARGET'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0300
     * @tc.name SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0300
     * @tc.desc PopupOptions colorMode under dark WithTheme FOLLOW_TARGET
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_popup_color_dark_theme'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions colorMode dark theme'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0400
     * @tc.name SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0400
     * @tc.desc PopupOptions colorMode under dark WithTheme FOLLOW_SYSTEM
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_popup_color_light_follow'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions colorMode light follow system'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0400 END');
      done();
    });

  });
}
