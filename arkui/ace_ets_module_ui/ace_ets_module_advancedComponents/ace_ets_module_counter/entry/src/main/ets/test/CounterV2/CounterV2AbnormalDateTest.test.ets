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
import { describe, beforeEach, afterEach, it, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalDateTest() {
  describe('CounterV2AbnormalDateTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = { url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalDate' };
      try {
        router.clear();
        if (router.getState().name !== 'CounterV2AbnormalDate') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push CounterV2AbnormalDate error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    it('SUB_ARKUI_COUNTERV2_ABN_DATEYEAR_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_dateYear_u', 'abn_dateYear_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_DATEMONTH_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_dateMonth_u', 'abn_dateMonth_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_DATEDAY_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_dateDay_u', 'abn_dateDay_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_DATEFOCUSABLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_dateFocusable_u', 'abn_dateFocusable_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_DATESTEP_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_dateStep_u', 'abn_dateStep_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_DATEHOVERINC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_dateHoverInc_u', 'abn_dateHoverInc_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_DATEHOVERDEC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_dateHoverDec_u', 'abn_dateHoverDec_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_ONDATECHANGE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onDateChange_u', 'abn_onDateChange_d');
    });

  });
}
