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
import { describe, beforeEach, afterEach, it, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalInlineTest() {
  describe('CounterV2AbnormalInlineTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = { url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalInline' };
      try {
        router.clear();
        if (router.getState().name !== 'CounterV2AbnormalInline') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push CounterV2AbnormalInline error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLVALUE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlValue_u', 'abn_inlValue_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLMIN_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlMin_u', 'abn_inlMin_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLMAX_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlMax_u', 'abn_inlMax_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLSTEP_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlStep_u', 'abn_inlStep_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLTEXTWIDTH_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlTextWidth_u', 'abn_inlTextWidth_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLFOCUSABLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlFocusable_u', 'abn_inlFocusable_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLONCHANGE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlOnChange_u', 'abn_inlOnChange_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLHOVERINC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlHoverInc_u', 'abn_inlHoverInc_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLHOVERDEC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_inlHoverDec_u', 'abn_inlHoverDec_d');
    });

  });
}
