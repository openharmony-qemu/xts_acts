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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { assertSmoke } from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalInlineTest(): void {
  describe('CounterV2AbnormalInlineTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalInline',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('CounterV2AbnormalInline' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('[ARKUI_NEW] push CounterV2AbnormalInline error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(300);
      } catch (err) {
        console.log('CounterV2AbnormalInlineTest afterEach err: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLVALUE_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLVALUE_UNDEFINED_0100
     * @tc.desc     inlValue undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLVALUE_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlValue_u', 'abn_inlValue_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLVALUE_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLMIN_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLMIN_UNDEFINED_0100
     * @tc.desc     inlMin undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLMIN_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlMin_u', 'abn_inlMin_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLMIN_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLMAX_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLMAX_UNDEFINED_0100
     * @tc.desc     inlMax undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLMAX_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlMax_u', 'abn_inlMax_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLMAX_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLSTEP_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLSTEP_UNDEFINED_0100
     * @tc.desc     inlStep undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLSTEP_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlStep_u', 'abn_inlStep_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLSTEP_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLTEXTWIDTH_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLTEXTWIDTH_UNDEFINED_0100
     * @tc.desc     inlTextWidth undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLTEXTWIDTH_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlTextWidth_u', 'abn_inlTextWidth_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLTEXTWIDTH_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLFOCUSABLE_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLFOCUSABLE_UNDEFINED_0100
     * @tc.desc     inlFocusable undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLFOCUSABLE_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlFocusable_u', 'abn_inlFocusable_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLFOCUSABLE_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLONCHANGE_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLONCHANGE_UNDEFINED_0100
     * @tc.desc     inlOnChange undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLONCHANGE_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlOnChange_u', 'abn_inlOnChange_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLONCHANGE_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLHOVERINC_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLHOVERINC_UNDEFINED_0100
     * @tc.desc     inlHoverInc undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLHOVERINC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlHoverInc_u', 'abn_inlHoverInc_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLHOVERINC_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLHOVERDEC_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLHOVERDEC_UNDEFINED_0100
     * @tc.desc     inlHoverDec undefined assert smoke test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLHOVERDEC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_inlHoverDec_u', 'abn_inlHoverDec_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLHOVERDEC_UNDEFINED_0100  error: ' + err);
      }
    });
  });
}
