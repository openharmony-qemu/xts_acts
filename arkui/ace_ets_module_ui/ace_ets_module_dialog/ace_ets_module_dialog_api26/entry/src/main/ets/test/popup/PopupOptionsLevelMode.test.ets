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

export default function PopupOptionsLevelMode() {
  describe('PopupOptionsLevelMode', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] PopupOptionsLevelMode beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupOptionsLevelMode'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'PopupOptionsLevelMode') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push PopupOptionsLevelMode error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(800);
      console.info('[ARKUI_DYN] PopupOptionsLevelMode afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0100
     * @tc.name SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0100
     * @tc.desc PopupOptions levelMode default overlay popup visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_popup_level_default'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions levelMode default'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0200
     * @tc.name SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0200
     * @tc.desc PopupOptions levelMode OVERLAY popup visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_popup_level_overlay'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions levelMode OVERLAY'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0300
     * @tc.name SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0300
     * @tc.desc PopupOptions levelMode EMBEDDED popup visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_popup_level_embedded'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions levelMode EMBEDDED'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0400
     * @tc.name SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0400
     * @tc.desc PopupOptions EMBEDDED popup then navigate away
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_popup_level_embedded_nav'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions EMBEDDED before nav'));
      expect(node !== null).assertTrue();
      let go = await driver.findComponent(ON.id('btn_popup_level_go_index'));
      await go.click();
      await CommonFunc.sleep(1000);
      await driver.pressBack();
      await CommonFunc.sleep(800);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0400 END');
      done();
    });

  });
}
