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

export default function ChipV2AbnormalCloseIconTest() {
  describe('ChipV2AbnormalCloseIconTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chipV2/abnormal/ChipV2AbnormalCloseIcon',
      };
      try {
        router.clear();
        if (!('ChipV2AbnormalCloseIcon' == router.getState().name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push ChipV2AbnormalCloseIcon error:' + err);
      }
      done();
    });
    afterEach(() => { hilog.info(0x0000, 'AbnTest', 'afterEach'); });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_closeIcon_u', 'abn_closeIcon_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEFONTSIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_closeFontSize_u', 'abn_closeFontSize_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEA11YLV_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_closeA11yLv_u', 'abn_closeA11yLv_d', 'accessibilityLevel', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEA11YTX_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_closeA11yTx_u', 'abn_closeA11yTx_d', 'accessibilityText', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEA11YDS_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_closeA11yDs_u', 'abn_closeA11yDs_d', 'accessibilityDescription', 'root');
    });
  });
}
