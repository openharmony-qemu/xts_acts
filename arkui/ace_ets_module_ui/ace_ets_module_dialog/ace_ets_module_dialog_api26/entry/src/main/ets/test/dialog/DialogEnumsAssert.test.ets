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
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function DialogEnumsAssert() {
  describe('DialogEnumsAssert', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogEnumsAssert beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogEnumsAssert', 'MainAbility/pages/dialog/DialogEnumsAssert');
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      done();
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      console.info('[ARKUI_DYN] DialogEnumsAssert afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogEnumsAssert afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100
     * @tc.desc enum groups: DialogState/Alignment/Orientation/AllEnums
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100 START');
      let driver = await Driver.create();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_state');
      let label_btn_enum_state = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_state = await label_btn_enum_state.getText();
      expect(txt_btn_enum_state.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_state.indexOf('DialogState') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align');
      let label_btn_enum_align = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_align = await label_btn_enum_align.getText();
      expect(txt_btn_enum_align.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_align.indexOf('DialogBaseAlignment') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_btn_orient');
      let label_btn_enum_btn_orient = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_btn_orient = await label_btn_enum_btn_orient.getText();
      expect(txt_btn_enum_btn_orient.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_btn_orient.indexOf('DialogButtonOrientation') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_all');
      let label_btn_enum_all = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_all = await label_btn_enum_all.getText();
      expect(txt_btn_enum_all.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_all.indexOf('AllEnums') >= 0).assertTrue();

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500
     * @tc.desc DialogState values UNINITIALIZED..DISAPPEARED
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500 START');
      let driver = await Driver.create();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_state_0');
      let label_btn_enum_state_0 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_state_0 = await label_btn_enum_state_0.getText();
      expect(txt_btn_enum_state_0.indexOf('PASS:UNINITIALIZED') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_state_1');
      let label_btn_enum_state_1 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_state_1 = await label_btn_enum_state_1.getText();
      expect(txt_btn_enum_state_1.indexOf('PASS:INITIALIZED') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_state_2');
      let label_btn_enum_state_2 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_state_2 = await label_btn_enum_state_2.getText();
      expect(txt_btn_enum_state_2.indexOf('PASS:APPEARING') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_state_3');
      let label_btn_enum_state_3 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_state_3 = await label_btn_enum_state_3.getText();
      expect(txt_btn_enum_state_3.indexOf('PASS:APPEARED') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_state_4');
      let label_btn_enum_state_4 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_state_4 = await label_btn_enum_state_4.getText();
      expect(txt_btn_enum_state_4.indexOf('PASS:DISAPPEARING') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_state_5');
      let label_btn_enum_state_5 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_state_5 = await label_btn_enum_state_5.getText();
      expect(txt_btn_enum_state_5.indexOf('PASS:DISAPPEARED') >= 0).assertTrue();

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100
     * @tc.desc DialogBaseAlignment sample values TOP/CENTER/BOTTOM/DEFAULT/TOP_START
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100 START');
      let driver = await Driver.create();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_0');
      let label_btn_enum_align_0 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_align_0 = await label_btn_enum_align_0.getText();
      expect(txt_btn_enum_align_0.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_align_0.indexOf('TOP') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_1');
      let label_btn_enum_align_1 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_align_1 = await label_btn_enum_align_1.getText();
      expect(txt_btn_enum_align_1.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_align_1.indexOf('CENTER') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_2');
      let label_btn_enum_align_2 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_align_2 = await label_btn_enum_align_2.getText();
      expect(txt_btn_enum_align_2.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_align_2.indexOf('BOTTOM') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_3');
      let label_btn_enum_align_3 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_align_3 = await label_btn_enum_align_3.getText();
      expect(txt_btn_enum_align_3.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_align_3.indexOf('DEFAULT') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_4');
      let label_btn_enum_align_4 = await driver.findComponent(ON.id('enums_result'));
      let txt_btn_enum_align_4 = await label_btn_enum_align_4.getText();
      expect(txt_btn_enum_align_4.indexOf('PASS:') >= 0).assertTrue();
      expect(txt_btn_enum_align_4.indexOf('TOP_START') >= 0).assertTrue();

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100 END');
      done();
    });

  });
}
