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
import { Driver } from '@ohos.UiTest';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function DialogEnumsAssertExtra() {
  describe('DialogEnumsAssertExtra', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogEnumsAssertExtra beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogEnumsAssertExtra', 'MainAbility/pages/dialog/DialogEnumsAssertExtra');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogEnumsAssertExtra afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogEnumsAssertExtra afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100
     * @tc.desc DialogEnumsAssertExtra batch1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100 START');
      let driver = await Driver.create();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_5');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result', ['PASS:', 'TOP_END']);

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_6');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result', ['PASS:', 'CENTER_START']);

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_7');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result', ['PASS:', 'CENTER_END']);

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_8');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result', ['PASS:', 'BOTTOM_START']);

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500
     * @tc.desc DialogEnumsAssertExtra batch2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500 START');
      let driver = await Driver.create();

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_align_9');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result', ['PASS:', 'BOTTOM_END']);

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_orient_0');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result', ['PASS:', 'AUTO']);

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_orient_1');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result', ['PASS:', 'HORIZONTAL']);

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_orient_2');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result', ['PASS:', 'VERTICAL']);

      await DialogApi26TestHelper.clickId(driver, 'btn_enum_text_style');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'enums_extra_result',
        ['PASS:', 'DialogTextStyleOptions']);

      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500 END');
      done();
    });

  });
}
