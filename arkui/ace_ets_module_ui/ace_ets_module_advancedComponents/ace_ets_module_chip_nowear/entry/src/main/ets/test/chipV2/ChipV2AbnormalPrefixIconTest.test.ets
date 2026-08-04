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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function ChipV2AbnormalPrefixIconTest() {
  describe('ChipV2AbnormalPrefixIconTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chipV2/abnormal/ChipV2AbnormalPrefixIcon',
      };
      try {
        router.clear();
        if (!('ChipV2AbnormalPrefixIcon' == router.getState().name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push ChipV2AbnormalPrefixIcon error:' + err);
      }
      done();
    });
    afterEach(() => { hilog.info(0x0000, 'AbnTest', 'afterEach'); });
    it('SUB_ARKUI_CHIPV2_ABN_PRESIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_preSize_u', 'abn_preSize_d', 'size', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PREFILL_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_preFill_u', 'abn_preFill_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PREACTFILL_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_preActFill_u', 'abn_preActFill_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PREMODIFIER_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_preModifier_u', 'abn_preModifier_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PRESYMNORMAL_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_preSymNormal_u', 'abn_preSymNormal_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PRESYMACT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_preSymAct_u', 'abn_preSymAct_d');
    });
  });
}
