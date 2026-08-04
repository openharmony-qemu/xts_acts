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

export default function DialogBaseSizeBorder() {
  describe('DialogBaseSizeBorder', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseSizeBorder beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogBaseSizeBorder', 'MainAbility/pages/dialog/DialogBaseSizeBorder');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogBaseSizeBorder afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogBaseSizeBorder afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100
     * @tc.desc DialogBaseSizeBorder matrix scan (12 steps)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100 START');
      let driver = await Driver.create();

      // step 1: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100
      await DialogApi26TestHelper.clickId(driver, 'btn_size_width_pct');
      await DialogApi26TestHelper.expectTextVisible(driver, 'WidthPctTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'WidthPctOK');

      // step 2: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0200
      await DialogApi26TestHelper.clickId(driver, 'btn_size_width_num');
      await DialogApi26TestHelper.expectTextVisible(driver, 'WidthNumTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'WidthNumOK');

      // step 3: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0300
      await DialogApi26TestHelper.clickId(driver, 'btn_size_height');
      await DialogApi26TestHelper.expectTextVisible(driver, 'HeightTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'HeightOK');

      // step 4: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0400
      await DialogApi26TestHelper.clickId(driver, 'btn_size_bw');
      await DialogApi26TestHelper.expectTextVisible(driver, 'BWTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'BWOK');

      // step 5: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0500
      await DialogApi26TestHelper.clickId(driver, 'btn_size_br');
      await DialogApi26TestHelper.expectTextVisible(driver, 'BRTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'BROK');

      // step 6: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0600
      await DialogApi26TestHelper.clickId(driver, 'btn_size_bs');
      await DialogApi26TestHelper.expectTextVisible(driver, 'BSTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'BSOK');

      // step 7: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0700
      await DialogApi26TestHelper.clickId(driver, 'btn_size_offset');
      await DialogApi26TestHelper.expectTextVisible(driver, 'OffsetTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'OffsetOK');

      // step 8: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0800
      await DialogApi26TestHelper.clickId(driver, 'btn_size_mask');
      await DialogApi26TestHelper.expectTextVisible(driver, 'MaskColorTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'MaskColorOK');

      // step 9: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0900
      await DialogApi26TestHelper.clickId(driver, 'btn_size_ac');
      await DialogApi26TestHelper.expectTextVisible(driver, 'ACTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'ACOK');

      // step 10: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1000
      await DialogApi26TestHelper.clickId(driver, 'btn_size_focusable');
      await DialogApi26TestHelper.expectTextVisible(driver, 'FocusableTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'FocusableOK');

      // step 11: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1100
      await DialogApi26TestHelper.clickId(driver, 'btn_size_kbd');
      await DialogApi26TestHelper.expectTextVisible(driver, 'KbdTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'KbdOK');

      // step 12: SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1200
      await DialogApi26TestHelper.clickId(driver, 'btn_size_shadow');
      await DialogApi26TestHelper.expectTextVisible(driver, 'ShadowTitle');
      await DialogApi26TestHelper.dismissByText(driver, 'ShadowOK');

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100 END');
      done();
    });

  });
}
