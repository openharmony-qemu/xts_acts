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

export default function DialogStyleAlert() {
  describe('DialogStyleAlert', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogStyleAlert beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogStyleAlert', 'MainAbility/pages/dialog/DialogStyleAlert');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogStyleAlert afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogStyleAlert afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0100
     * @tc.desc DialogStyleAlert matrix scan (8 steps)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0100 START');
      let driver = await Driver.create();

      // step 1: SUB_ArkUI_DialogApi26_DialogStyleAlert_0100
      await DialogApi26TestHelper.clickId(driver, 'btn_style_alert_basic');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlertTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'AlertOK');

      // step 2: SUB_ArkUI_DialogApi26_DialogStyleAlert_0200
      await DialogApi26TestHelper.clickId(driver, 'btn_style_alert_vertical');
      await DialogApi26TestHelper.expectTextVisible(driver, 'VerticalTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'VertB');

      // step 3: SUB_ArkUI_DialogApi26_DialogStyleAlert_0300
      await DialogApi26TestHelper.clickId(driver, 'btn_style_alert_auto');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AutoTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'AutoOK');

      // step 4: SUB_ArkUI_DialogApi26_DialogStyleAlert_0400
      await DialogApi26TestHelper.clickId(driver, 'btn_style_alert_disabled');
      await DialogApi26TestHelper.expectTextVisible(driver, 'DisableTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'EnableOK');

      // step 5: SUB_ArkUI_DialogApi26_DialogStyleAlert_0500
      await DialogApi26TestHelper.clickId(driver, 'btn_style_alert_wordbreak');
      await DialogApi26TestHelper.expectTextVisible(driver, 'WordBreakTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'WBClose');

      // step 6: SUB_ArkUI_DialogApi26_DialogStyleAlert_0600
      await DialogApi26TestHelper.clickId(driver, 'btn_style_alert_basic');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AlertMessage');
      await DialogApi26TestHelper.dismissByText(driver, 'AlertCancel');

      // step 7: SUB_ArkUI_DialogApi26_DialogStyleAlert_0700
      await DialogApi26TestHelper.clickId(driver, 'btn_style_alert_wb_all');
      await DialogApi26TestHelper.expectTextVisible(driver, 'WBAllTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'WBAllOK');

      // step 8: SUB_ArkUI_DialogApi26_DialogStyleAlert_0800
      await DialogApi26TestHelper.clickId(driver, 'btn_style_alert_subtitle');
      await DialogApi26TestHelper.expectTextVisible(driver, 'SubTitleValue');
      await DialogApi26TestHelper.dismissByText(driver, 'SubTitleOK');

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0100 END');
      done();
    });

  });
}
