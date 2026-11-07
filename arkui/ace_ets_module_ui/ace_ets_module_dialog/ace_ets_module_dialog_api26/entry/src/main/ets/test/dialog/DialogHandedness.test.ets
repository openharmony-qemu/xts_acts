/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import { Driver, ON } from '@ohos.UiTest';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function DialogHandedness() {
  describe('DialogHandedness', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] dialogHandedness beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded(
        'DialogHandedness', 'MainAbility/pages/dialog/DialogHandedness');
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      done();
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      console.info('[ARKUI_DYN] dialogHandedness afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] dialogHandedness afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogHandedness_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogHandedness_0100
     * @tc.desc HandednessFollowMode enum NONE/FOLLOW_ANCHOR/FOLLOW_GRIP_HAND
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogHandedness_0100', Level.LEVEL2, async (done: Function) => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.clickId(driver, 'btn_handedness_enum');
      let label = await driver.findComponent(ON.id('handedness_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:HandednessFollowMode') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogHandedness_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogHandedness_0200
     * @tc.desc adaptToHandedness assign on alert/sheet/prompt options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogHandedness_0200', Level.LEVEL2, async (done: Function) => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.clickId(driver, 'btn_handedness_opts');
      let label = await driver.findComponent(ON.id('handedness_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:OptionsAssign') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogHandedness_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogHandedness_0300
     * @tc.desc CustomDialogControllerOptions.adaptToHandedness open
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogHandedness_0300', Level.LEVEL2, async (done: Function) => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.clickId(driver, 'btn_handedness_custom');
      await DialogApi26TestHelper.expectTextVisible(driver, 'HandednessCustom');
      await DialogApi26TestHelper.clickId(driver, 'handedness_close_btn');
      let label = await driver.findComponent(ON.id('handedness_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:CustomDialogOpen') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogHandedness_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogHandedness_0400
     * @tc.desc DialogBaseOptions.adaptToHandedness via DialogPresenter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogHandedness_0400', Level.LEVEL2, async (done: Function) => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.clickId(driver, 'btn_handedness_present');
      await DialogApi26TestHelper.dismissByText(driver, 'HandOK');
      let label = await driver.findComponent(ON.id('handedness_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:DialogBaseOptions') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogHandedness_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogHandedness_0500
     * @tc.desc AlertDialogParam.adaptToHandedness show
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogHandedness_0500', Level.LEVEL2, async (done: Function) => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.clickId(driver, 'btn_handedness_alert');
      await DialogApi26TestHelper.dismissByText(driver, 'OK');
      let label = await driver.findComponent(ON.id('handedness_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:AlertDialogParam') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogHandedness_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogHandedness_0600
     * @tc.desc ActionSheetOptions.adaptToHandedness show
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogHandedness_0600', Level.LEVEL2, async (done: Function) => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.clickId(driver, 'btn_handedness_sheet');
      await DialogApi26TestHelper.dismissByText(driver, 'Item');
      let label = await driver.findComponent(ON.id('handedness_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:ActionSheetOptions') >= 0).assertTrue();
      done();
    });
  });
}
