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

import { describe, beforeEach, afterEach, afterAll, it, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function DialogAbnormalOptsExtra() {
  describe('DialogAbnormalOptsExtra', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogAbnormalOptsExtra beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogAbnormalOptsExtra',
        'MainAbility/pages/dialog/DialogAbnormalOptsExtra');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogAbnormalOptsExtra afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogAbnormalOptsExtra afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100
     * @tc.desc undefined probes part2 + null note
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100 START');
      let driver = await Driver.create();
      let steps: string[] = [
        'btn_abn_autoCancel',
        'btn_abn_isModal',
        'btn_abn_backgroundColor',
        'btn_abn_buttonDirection',
        'btn_abn_wordBreak',
        'btn_abn_levelMode',
        'btn_abn_focusable',
        'btn_abn_omit'
      ];
      for (let i = 0; i < steps.length; i++) {
        await DialogApi26TestHelper.clickId(driver, steps[i]);
        await DialogApi26TestHelper.expectIdTextContains(driver, 'abn_cover', ['ok:', 'fail:', 'null'], true);
        await DialogApi26TestHelper.dismissDialogSoft(driver, 'AbnOK');
      }
      await DialogApi26TestHelper.clickId(driver, 'btn_abn_null_note');
      await DialogApi26TestHelper.expectIdTextContains(driver, 'abn_cover', ['ok:', 'fail:', 'null'], true);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100 END');
      done();
    });
  });
}
