'use static';
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

import { describe, beforeAll, beforeEach, afterEach, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalInlineTest(): void {
  describe('CounterV2AbnormalInlineTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.counter.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalInline',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("CounterV2AbnormalInline" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] push CounterV2AbnormalInline error:' + err);
      }
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
