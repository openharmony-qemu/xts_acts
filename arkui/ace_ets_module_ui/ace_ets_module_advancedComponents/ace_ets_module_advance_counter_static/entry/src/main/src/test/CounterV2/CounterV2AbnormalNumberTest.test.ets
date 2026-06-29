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

'use static';
import { describe, beforeAll, beforeEach, afterEach, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalNumberTest(): void {
  describe('CounterV2AbnormalNumberTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.counter.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalNumber',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("CounterV2AbnormalNumber" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] push CounterV2AbnormalNumber error:' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });



    it('SUB_ARKUI_COUNTERV2_ABN_LABEL_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_label_u', 'abn_label_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_VALUE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_value_u', 'abn_value_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_MIN_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_min_u', 'abn_min_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_MAX_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_max_u', 'abn_max_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_STEP_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_step_u', 'abn_step_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_TEXTWIDTH_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_textWidth_u', 'abn_textWidth_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_FOCUSABLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_focusable_u', 'abn_focusable_d', 'focusable', 'inner');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_ONCHANGE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onChange_u', 'abn_onChange_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_ONFOCUSINC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onFocusInc_u', 'abn_onFocusInc_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_ONFOCUSDEC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onFocusDec_u', 'abn_onFocusDec_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_ONBLURINC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onBlurInc_u', 'abn_onBlurInc_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_ONBLURDEC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onBlurDec_u', 'abn_onBlurDec_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_ONHOVERINC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onHoverInc_u', 'abn_onHoverInc_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_ONHOVERDEC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onHoverDec_u', 'abn_onHoverDec_d');
    });

  });
}
