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

export default function ChipGroupV2AbnormalItemTest() {
  describe('ChipGroupV2AbnormalItemTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/abnormal/ChipGroupV2AbnormalItem',
      };
      try {
        router.clear();
        if (!('ChipGroupV2AbnormalItem' == router.getState().name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push ChipGroupV2AbnormalItem error:' + err);
      }
      done();
    });
    afterEach(() => { hilog.info(0x0000, 'AbnTest', 'afterEach'); });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITPREICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itPreIcon_u', 'abn_itPreIcon_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITPRESYM_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itPreSym_u', 'abn_itPreSym_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITSUFICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itSufIcon_u', 'abn_itSufIcon_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITSUFSYM_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itSufSym_u', 'abn_itSufSym_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITALLOWCLOSE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itAllowClose_u', 'abn_itAllowClose_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITCLOSEICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itCloseIcon_u', 'abn_itCloseIcon_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITA11YDESC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_itA11yDesc_u', 'abn_itA11yDesc_d', 'accessibilityDescription', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITA11YLV_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_itA11yLv_u', 'abn_itA11yLv_d', 'accessibilityLevel', 'root');
    });
  });
}
