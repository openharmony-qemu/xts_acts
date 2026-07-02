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

export default function ChipGroupV2AbnormalSpacePaddingTest() {
  describe('ChipGroupV2AbnormalSpacePaddingTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/abnormal/ChipGroupV2AbnormalSpacePadding',
      };
      try {
        router.clear();
        if (!('ChipGroupV2AbnormalSpacePadding' == router.getState().name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push ChipGroupV2AbnormalSpacePadding error:' + err);
      }
      done();
    });
    afterEach(() => { hilog.info(0x0000, 'AbnTest', 'afterEach'); });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SPCITEM_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_spcItem_u', 'abn_spcItem_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SPCSTART_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_spcStart_u', 'abn_spcStart_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SPCEND_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_spcEnd_u', 'abn_spcEnd_d');
    });
  });
}
