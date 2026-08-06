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


import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function PopupOptionsLevelMode() {
  describe('PopupOptionsLevelMode', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] PopupOptionsLevelMode beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('PopupOptionsLevelMode', 'MainAbility/pages/popup/PopupOptionsLevelMode');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] PopupOptionsLevelMode afterEach');
    });
    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] PopupOptionsLevelMode afterAll');
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
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_popup_level_default'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions levelMode default'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
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
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_popup_level_overlay'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions levelMode OVERLAY'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
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
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_popup_level_embedded'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PopupOptions levelMode EMBEDDED'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
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
      await CommonFunc.sleep(200);
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
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0400 END');
      done();
    });

  });
}
