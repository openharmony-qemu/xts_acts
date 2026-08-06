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

export default function DialogAlignWordBreak() {
  describe('DialogAlignWordBreak', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogAlignWordBreak beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogAlignWordBreak', 'MainAbility/pages/dialog/DialogAlignWordBreak');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogAlignWordBreak afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogAlignWordBreak afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100
     * @tc.desc DialogAlignWordBreak matrix scan (9 steps)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100 START');
      let driver = await Driver.create();

      // step 1: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_normal');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_NORMAL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_NORMAL');

      // step 2: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0200
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_break_all');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_BREAK_ALL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_BREAK_ALL');

      // step 3: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0300
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_top_break_word');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWTOP_BREAK_WORD');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_TOP_BREAK_WORD');

      // step 4: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0400
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_center_normal');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWCENTER_NORMAL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_CENTER_NORMAL');

      // step 5: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0500
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_center_break_all');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWCENTER_BREAK_ALL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_CENTER_BREAK_ALL');

      // step 6: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0600
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_center_break_word');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWCENTER_BREAK_WORD');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_CENTER_BREAK_WORD');

      // step 7: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0700
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_bottom_normal');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWBOTTOM_NORMAL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_BOTTOM_NORMAL');

      // step 8: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0800
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_bottom_break_all');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWBOTTOM_BREAK_ALL');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_BOTTOM_BREAK_ALL');

      // step 9: SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0900
      await DialogApi26TestHelper.clickId(driver, 'btn_aw_bottom_break_word');
      await DialogApi26TestHelper.expectTextVisible(driver, 'AWBOTTOM_BREAK_WORD');
      await DialogApi26TestHelper.dismissByText(driver, 'OK_BOTTOM_BREAK_WORD');

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100 END');
      done();
    });

  });
}
