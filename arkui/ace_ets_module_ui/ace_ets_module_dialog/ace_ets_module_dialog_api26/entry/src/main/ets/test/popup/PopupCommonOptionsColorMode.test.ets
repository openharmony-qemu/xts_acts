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

export default function PopupCommonOptionsColorMode() {
  describe('PopupCommonOptionsColorMode', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] PopupCommonOptionsColorMode beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupCommonOptionsColorMode'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'PopupCommonOptionsColorMode') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push PopupCommonOptionsColorMode error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(800);
      console.info('[ARKUI_DYN] PopupCommonOptionsColorMode afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0100
     * @tc.name SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0100
     * @tc.desc openPopup PopupCommonOptions colorMode FOLLOW_SYSTEM
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_common_color_follow_system'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('Common color FOLLOW_SYSTEM'));
      expect(node !== null).assertTrue();
      let closeBtn = await driver.findComponent(ON.id('popup_common_color_close'));
      expect(closeBtn !== null).assertTrue();
      await closeBtn.click();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0200
     * @tc.name SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0200
     * @tc.desc openPopup PopupCommonOptions colorMode FOLLOW_TARGET
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_common_color_follow_target'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('Common color FOLLOW_TARGET'));
      expect(node !== null).assertTrue();
      let closeBtn = await driver.findComponent(ON.id('popup_common_color_close'));
      await closeBtn.click();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0300
     * @tc.name SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0300
     * @tc.desc openPopup PopupCommonOptions colorMode combined path
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_common_color_combined'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('Common color combined'));
      expect(node !== null).assertTrue();
      let closeBtn = await driver.findComponent(ON.id('popup_common_color_close'));
      await closeBtn.click();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0300 END');
      done();
    });

  });
}
