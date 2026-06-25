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

export default function ChipGroupV2AbnormalRootTest() {
  describe('ChipGroupV2AbnormalRootTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/abnormal/ChipGroupV2AbnormalRoot',
      };
      try {
        router.clear();
        if (!('ChipGroupV2AbnormalRoot' == router.getState().name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push ChipGroupV2AbnormalRoot error:' + err);
      }
      done();
    });
    afterEach(() => { hilog.info(0x0000, 'AbnTest', 'afterEach'); });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITEMSTYLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_itemStyle_u', 'abn_itemStyle_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SELECTEDINDEXES_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_selectedIndexes_u', 'abn_selectedIndexes_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_MULTIPLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_multiple_u', 'abn_multiple_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CHIPGROUPSPACE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_chipGroupSpace_u', 'abn_chipGroupSpace_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CHIPGROUPPADDING_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_chipGroupPadding_u', 'abn_chipGroupPadding_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ONCHANGE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onChange_u', 'abn_onChange_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SUFFIX_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_suffix_u', 'abn_suffix_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITEMSEMPTY_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_itemsEmpty_u', 'abn_itemsEmpty_d');
    });
  });
}
