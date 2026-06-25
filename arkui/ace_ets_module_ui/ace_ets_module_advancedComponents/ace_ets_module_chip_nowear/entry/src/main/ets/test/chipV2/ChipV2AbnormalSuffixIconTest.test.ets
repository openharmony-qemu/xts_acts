/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function ChipV2AbnormalSuffixIconTest() {
  describe('ChipV2AbnormalSuffixIconTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chipV2/abnormal/ChipV2AbnormalSuffixIcon',
      };
      try {
        router.clear();
        if (!('ChipV2AbnormalSuffixIcon' == router.getState().name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push ChipV2AbnormalSuffixIcon error:' + err);
      }
      done();
    });
    afterEach(() => { hilog.info(0x0000, 'AbnTest', 'afterEach'); });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sufSize_u', 'abn_sufSize_d', 'size', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFFILL_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_sufFill_u', 'abn_sufFill_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFACTFILL_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_sufActFill_u', 'abn_sufActFill_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFMODIFIER_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_sufModifier_u', 'abn_sufModifier_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFA11YLV_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sufA11yLv_u', 'abn_sufA11yLv_d', 'accessibilityLevel', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFA11YTX_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sufA11yTx_u', 'abn_sufA11yTx_d', 'accessibilityText', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFA11YDS_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sufA11yDs_u', 'abn_sufA11yDs_d', 'accessibilityDescription', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFACTION_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_sufAction_u', 'abn_sufAction_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMNORMAL_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_sufSymNormal_u', 'abn_sufSymNormal_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMACT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_sufSymAct_u', 'abn_sufSymAct_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMNORMA11Y_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_sufSymNormA11y_u', 'abn_sufSymNormA11y_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMACTA11Y_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_sufSymActA11y_u', 'abn_sufSymActA11y_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMACTION_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_sufSymAction_u', 'abn_sufSymAction_d');
    });
  });
}
