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

export default function DialogAlignWordBreakExtra() {
  describe('DialogAlignWordBreakExtra', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogAlignWordBreakExtra beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogAlignWordBreakExtra', 'MainAbility/pages/dialog/DialogAlignWordBreakExtra');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogAlignWordBreakExtra afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogAlignWordBreakExtra afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100
     * @tc.desc DialogAlignWordBreakExtra matrix scan (9 steps)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100 START');
      let driver = await Driver.create();

      // step 1: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_default_normal');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWDEFAULT_NORMAL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_DEFAULT_NORMAL');

      // step 2: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0200
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_default_break_all');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWDEFAULT_BREAK_ALL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_DEFAULT_BREAK_ALL');

      // step 3: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0300
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_default_break_word');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWDEFAULT_BREAK_WORD');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_DEFAULT_BREAK_WORD');

      // step 4: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0400
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_start_normal');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_START_NORMAL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_START_NORMAL');

      // step 5: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0500
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_start_break_all');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_START_BREAK_ALL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_START_BREAK_ALL');

      // step 6: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0600
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_start_break_word');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_START_BREAK_WORD');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_START_BREAK_WORD');

      // step 7: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0700
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_end_normal');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_END_NORMAL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_END_NORMAL');

      // step 8: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0800
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_end_break_all');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_END_BREAK_ALL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_END_BREAK_ALL');

      // step 9: SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0900
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_end_break_word');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_END_BREAK_WORD');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_END_BREAK_WORD');

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100 END');
      done();
    });

  });
}
