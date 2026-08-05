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

export default function DialogAbnormalOpts() {
  describe('DialogAbnormalOpts', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogAbnormalOpts beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogAbnormalOpts', 'MainAbility/pages/dialog/DialogAbnormalOpts');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogAbnormalOpts afterEach');
    });

    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogAbnormalOpts afterAll');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100
     * @tc.desc undefined probes: subtitle/width/height/mask/offset/border/shadow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100 START');
      let driver = await Driver.create();
      let steps: string[] = [
        'btn_abn_subtitle',
        'btn_abn_width',
        'btn_abn_height',
        'btn_abn_maskColor',
        'btn_abn_offset',
        'btn_abn_borderWidth',
        'btn_abn_borderRadius',
        'btn_abn_shadow'
      ];
      for (let i = 0; i < steps.length; i++) {
        let bid = steps[i];
        await DialogApi26TestHelper.clickId(driver, bid);
        await DialogApi26TestHelper.expectIdTextContains(driver, 'abn_cover', ['ok:', 'fail:', 'null'], true);
        await DialogApi26TestHelper.dismissDialogSoft(driver, 'AbnOK');
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100 END');
      done();
    });
  });
}
