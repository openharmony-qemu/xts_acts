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

export default function DisplayModeInSubWindow() {
  describe('DisplayModeInSubWindow', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DisplayModeInSubWindow beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DisplayModeInSubWindow', 'MainAbility/pages/dialog/DisplayModeInSubWindow');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DisplayModeInSubWindow afterEach');
    });
    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DisplayModeInSubWindow afterAll');
    });


    /**
     * @tc.number SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0100
     * @tc.name SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0100
     * @tc.desc displayModeInSubWindow SCREEN_BASED with showInSubWindow true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let flag = await driver.findComponent(ON.id('btn_subwindow_true'));
      await flag.click();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_dialog_screen_based'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('dialog content SCREEN_BASED'));
      expect(node !== null).assertTrue();
      let ok = await driver.findComponent(ON.id('dialog_confirm'));
      await ok.click();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0200
     * @tc.name SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0200
     * @tc.desc displayModeInSubWindow WINDOW_BASED with showInSubWindow true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let flag = await driver.findComponent(ON.id('btn_subwindow_true'));
      await flag.click();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_dialog_window_based'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('dialog content WINDOW_BASED'));
      expect(node !== null).assertTrue();
      let ok = await driver.findComponent(ON.id('dialog_confirm'));
      await ok.click();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0300
     * @tc.name SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0300
     * @tc.desc displayModeInSubWindow SCREEN_BASED with showInSubWindow false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_dialog_screen_nosub'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('dialog content SCREEN_NOSUB'));
      expect(node !== null).assertTrue();
      let ok = await driver.findComponent(ON.id('dialog_confirm'));
      await ok.click();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0400
     * @tc.name SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0400
     * @tc.desc displayModeInSubWindow WINDOW_BASED combined reopen
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_dialog_window_sub'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('dialog content WINDOW_SUB'));
      expect(node !== null).assertTrue();
      let cancel = await driver.findComponent(ON.id('dialog_cancel'));
      await cancel.click();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0400 END');
      done();
    });

  });
}
