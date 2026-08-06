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

export default function DialogButtonMatrix() {
  describe('DialogButtonMatrix', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogButtonMatrix beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogButtonMatrix', 'MainAbility/pages/dialog/DialogButtonMatrix');
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      done();
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      console.info('[ARKUI_DYN] DialogButtonMatrix afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogButtonMatrix afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100
     * @tc.desc DialogButton matrix: value/font/bg/enabled/focus/primary/style/mix/action
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100 START');
      let driver = await Driver.create();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_value');
      await DialogApi26TestHelper.expectTextVisible(driver, 'ValueTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'ValueOK');
      let label_btn_matrix_value = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_value !== null).assertTrue();
      let txt_btn_matrix_value = await label_btn_matrix_value.getText();
      expect(txt_btn_matrix_value.indexOf('ValueOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_font');
      await DialogApi26TestHelper.expectTextVisible(driver, 'FontTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'FontOK');
      let label_btn_matrix_font = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_font !== null).assertTrue();
      let txt_btn_matrix_font = await label_btn_matrix_font.getText();
      expect(txt_btn_matrix_font.indexOf('FontOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_bg');
      await DialogApi26TestHelper.expectTextVisible(driver, 'BgBtnTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'BgBtnOK');
      let label_btn_matrix_bg = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_bg !== null).assertTrue();
      let txt_btn_matrix_bg = await label_btn_matrix_bg.getText();
      expect(txt_btn_matrix_bg.indexOf('BgBtnOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_enabled');
      await DialogApi26TestHelper.expectTextVisible(driver, 'EnabledTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'EnabledOK');
      let label_btn_matrix_enabled = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_enabled !== null).assertTrue();
      let txt_btn_matrix_enabled = await label_btn_matrix_enabled.getText();
      expect(txt_btn_matrix_enabled.indexOf('EnabledOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_focus');
      await DialogApi26TestHelper.expectTextVisible(driver, 'FocusTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'FocusOK');
      let label_btn_matrix_focus = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_focus !== null).assertTrue();
      let txt_btn_matrix_focus = await label_btn_matrix_focus.getText();
      expect(txt_btn_matrix_focus.indexOf('FocusOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_primary');
      await DialogApi26TestHelper.expectTextVisible(driver, 'PrimaryTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'PrimaryOK');
      let label_btn_matrix_primary = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_primary !== null).assertTrue();
      let txt_btn_matrix_primary = await label_btn_matrix_primary.getText();
      expect(txt_btn_matrix_primary.indexOf('PrimaryOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_style_def');
      await DialogApi26TestHelper.expectTextVisible(driver, 'StyleDefTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'StyleDefOK');
      let label_btn_matrix_style_def = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_style_def !== null).assertTrue();
      let txt_btn_matrix_style_def = await label_btn_matrix_style_def.getText();
      expect(txt_btn_matrix_style_def.indexOf('StyleDefOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_style_hi');
      await DialogApi26TestHelper.expectTextVisible(driver, 'StyleHiTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'StyleHiOK');
      let label_btn_matrix_style_hi = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_style_hi !== null).assertTrue();
      let txt_btn_matrix_style_hi = await label_btn_matrix_style_hi.getText();
      expect(txt_btn_matrix_style_hi.indexOf('StyleHiOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_mix');
      await DialogApi26TestHelper.expectTextVisible(driver, 'MixTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'MixOK');
      let label_btn_matrix_mix = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_mix !== null).assertTrue();
      let txt_btn_matrix_mix = await label_btn_matrix_mix.getText();
      expect(txt_btn_matrix_mix.indexOf('MixOK') >= 0).assertTrue();

      await DialogApi26TestHelper.clickId(driver, 'btn_matrix_action_cb');
      await DialogApi26TestHelper.expectTextVisible(driver, 'ActionTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'ActionOK');
      let label_btn_matrix_action_cb = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label_btn_matrix_action_cb !== null).assertTrue();
      let txt_btn_matrix_action_cb = await label_btn_matrix_action_cb.getText();
      expect(txt_btn_matrix_action_cb.indexOf('ActionFired') >= 0).assertTrue();

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100 END');
      done();
    });

  });
}
