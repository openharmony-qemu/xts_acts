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

export default function DialogBaseOptionsVisual() {
  describe('DialogBaseOptionsVisual', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseOptionsVisual beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogBaseOptionsVisual', 'MainAbility/pages/dialog/DialogBaseOptionsVisual');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogBaseOptionsVisual afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogBaseOptionsVisual afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100
     * @tc.desc DialogBaseOptionsVisual matrix scan (9 steps)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100 START');
      let driver = await Driver.create();

      // step 1: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_bg');
      await DialogApi26TestHelper.expectTextVisible(driver, 'BgTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'BgOK');

      let lab_btn_visual_bg = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_bg !== null) {
        let t_btn_visual_bg = await lab_btn_visual_bg.getText();
        expect(t_btn_visual_bg.indexOf('BgOK') >= 0).assertTrue();
      }

      // step 2: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0200
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_effect');
      await DialogApi26TestHelper.expectTextVisible(driver, 'EffectTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'EffectOK');

      let lab_btn_visual_effect = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_effect !== null) {
        let t_btn_visual_effect = await lab_btn_visual_effect.getText();
        expect(t_btn_visual_effect.indexOf('EffectOK') >= 0).assertTrue();
      }

      // step 3: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0300
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_level_overlay');
      await DialogApi26TestHelper.expectTextVisible(driver, 'LevelOverlay');
      await DialogApi26TestHelper.dismissByText(driver, 'LevelOK');

      let lab_btn_visual_level_overlay = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_level_overlay !== null) {
        let t_btn_visual_level_overlay = await lab_btn_visual_level_overlay.getText();
        expect(t_btn_visual_level_overlay.indexOf('LevelOK') >= 0).assertTrue();
      }

      // step 4: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0400
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_level_embedded');
      await DialogApi26TestHelper.expectTextVisible(driver, 'LevelEmbedded');
      await DialogApi26TestHelper.dismissByText(driver, 'EmbedOK');

      let lab_btn_visual_level_embedded = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_level_embedded !== null) {
        let t_btn_visual_level_embedded = await lab_btn_visual_level_embedded.getText();
        expect(t_btn_visual_level_embedded.indexOf('EmbedOK') >= 0).assertTrue();
      }

      // step 5: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0500
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_not_modal');
      await DialogApi26TestHelper.expectTextVisible(driver, 'NotModal');
      await DialogApi26TestHelper.dismissByText(driver, 'ModalOK');

      let lab_btn_visual_not_modal = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_not_modal !== null) {
        let t_btn_visual_not_modal = await lab_btn_visual_not_modal.getText();
        expect(t_btn_visual_not_modal.indexOf('ModalOK') >= 0).assertTrue();
      }

      // step 6: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0600
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_hover');
      await DialogApi26TestHelper.expectTextVisible(driver, 'HoverTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'HoverOK');

      let lab_btn_visual_hover = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_hover !== null) {
        let t_btn_visual_hover = await lab_btn_visual_hover.getText();
        expect(t_btn_visual_hover.indexOf('HoverOK') >= 0).assertTrue();
      }

      // step 7: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0700
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_transition');
      await DialogApi26TestHelper.expectTextVisible(driver, 'TransTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'TransOK');

      let lab_btn_visual_transition = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_transition !== null) {
        let t_btn_visual_transition = await lab_btn_visual_transition.getText();
        expect(t_btn_visual_transition.indexOf('TransOK') >= 0).assertTrue();
      }

      // step 8: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0800
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_level_uid');
      await DialogApi26TestHelper.expectTextVisible(driver, 'LevelUidTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'UidOK');

      let lab_btn_visual_level_uid = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_level_uid !== null) {
        let t_btn_visual_level_uid = await lab_btn_visual_level_uid.getText();
        expect(t_btn_visual_level_uid.indexOf('UidOK') >= 0).assertTrue();
      }

      // step 9: SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0900
      await DialogApi26TestHelper.clickId(driver, 'btn_visual_material');
      await DialogApi26TestHelper.expectTextVisible(driver, 'MaterialTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'MaterialOK');

      let lab_btn_visual_material = await driver.findComponent(ON.id('base_visual_action'));
      if (lab_btn_visual_material !== null) {
        let t_btn_visual_material = await lab_btn_visual_material.getText();
        expect(t_btn_visual_material.indexOf('MaterialOK') >= 0).assertTrue();
      }

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100 END');
      done();
    });

  });
}
