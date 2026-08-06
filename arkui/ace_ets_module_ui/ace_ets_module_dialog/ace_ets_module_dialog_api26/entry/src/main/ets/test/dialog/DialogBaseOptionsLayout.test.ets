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

export default function DialogBaseOptionsLayout() {
  describe('DialogBaseOptionsLayout', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseOptionsLayout beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogBaseOptionsLayout', 'MainAbility/pages/dialog/DialogBaseOptionsLayout');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogBaseOptionsLayout afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogBaseOptionsLayout afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100
     * @tc.desc DialogBaseOptionsLayout matrix scan (11 steps)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100 START');
      let driver = await Driver.create();

      // step 1: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100
      await DialogApi26TestHelper.clickId(driver, 'btn_align_TOP');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignTOP');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_TOP = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_TOP !== null) {
        let t_btn_align_TOP = await lab_btn_align_TOP.getText();
        expect(t_btn_align_TOP.indexOf('AlignOK_TOP') >= 0).assertTrue();
      }

      // step 2: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0200
      await DialogApi26TestHelper.clickId(driver, 'btn_align_CENTER');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignCENTER');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_CENTER = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_CENTER !== null) {
        let t_btn_align_CENTER = await lab_btn_align_CENTER.getText();
        expect(t_btn_align_CENTER.indexOf('AlignOK_CENTER') >= 0).assertTrue();
      }

      // step 3: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0300
      await DialogApi26TestHelper.clickId(driver, 'btn_align_BOTTOM');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignBOTTOM');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_BOTTOM = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_BOTTOM !== null) {
        let t_btn_align_BOTTOM = await lab_btn_align_BOTTOM.getText();
        expect(t_btn_align_BOTTOM.indexOf('AlignOK_BOTTOM') >= 0).assertTrue();
      }

      // step 4: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0400
      await DialogApi26TestHelper.clickId(driver, 'btn_align_DEFAULT');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignDEFAULT');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_DEFAULT = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_DEFAULT !== null) {
        let t_btn_align_DEFAULT = await lab_btn_align_DEFAULT.getText();
        expect(t_btn_align_DEFAULT.indexOf('AlignOK_DEFAULT') >= 0).assertTrue();
      }

      // step 5: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0500
      await DialogApi26TestHelper.clickId(driver, 'btn_align_TOP_START');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignTOP_START');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_TOP_START = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_TOP_START !== null) {
        let t_btn_align_TOP_START = await lab_btn_align_TOP_START.getText();
        expect(t_btn_align_TOP_START.indexOf('AlignOK_TOP_START') >= 0).assertTrue();
      }

      // step 6: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0600
      await DialogApi26TestHelper.clickId(driver, 'btn_align_TOP_END');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignTOP_END');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_TOP_END = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_TOP_END !== null) {
        let t_btn_align_TOP_END = await lab_btn_align_TOP_END.getText();
        expect(t_btn_align_TOP_END.indexOf('AlignOK_TOP_END') >= 0).assertTrue();
      }

      // step 7: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0700
      await DialogApi26TestHelper.clickId(driver, 'btn_align_CENTER_START');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignCENTER_START');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_CENTER_START = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_CENTER_START !== null) {
        let t_btn_align_CENTER_START = await lab_btn_align_CENTER_START.getText();
        expect(t_btn_align_CENTER_START.indexOf('AlignOK_CENTER_START') >= 0).assertTrue();
      }

      // step 8: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0800
      await DialogApi26TestHelper.clickId(driver, 'btn_align_CENTER_END');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignCENTER_END');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_CENTER_END = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_CENTER_END !== null) {
        let t_btn_align_CENTER_END = await lab_btn_align_CENTER_END.getText();
        expect(t_btn_align_CENTER_END.indexOf('AlignOK_CENTER_END') >= 0).assertTrue();
      }

      // step 9: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0900
      await DialogApi26TestHelper.clickId(driver, 'btn_align_BOTTOM_START');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignBOTTOM_START');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_BOTTOM_START = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_BOTTOM_START !== null) {
        let t_btn_align_BOTTOM_START = await lab_btn_align_BOTTOM_START.getText();
        expect(t_btn_align_BOTTOM_START.indexOf('AlignOK_BOTTOM_START') >= 0).assertTrue();
      }

      // step 10: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1000
      await DialogApi26TestHelper.clickId(driver, 'btn_align_BOTTOM_END');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlignBOTTOM_END');
      await DialogApi26TestHelper.dismissByText(driver, 'AlignOK');

      let lab_btn_align_BOTTOM_END = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_align_BOTTOM_END !== null) {
        let t_btn_align_BOTTOM_END = await lab_btn_align_BOTTOM_END.getText();
        expect(t_btn_align_BOTTOM_END.indexOf('AlignOK_BOTTOM_END') >= 0).assertTrue();
      }

      // step 11: SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1100
      await DialogApi26TestHelper.clickId(driver, 'btn_layout_mask');
      await DialogApi26TestHelper.expectTextVisible(driver, 'MaskRectTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'MaskOK');

      let lab_btn_layout_mask = await driver.findComponent(ON.id('base_layout_action'));
      if (lab_btn_layout_mask !== null) {
        let t_btn_layout_mask = await lab_btn_layout_mask.getText();
        expect(t_btn_layout_mask.indexOf('MaskOK') >= 0).assertTrue();
      }

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100 END');
      done();
    });

  });
}
