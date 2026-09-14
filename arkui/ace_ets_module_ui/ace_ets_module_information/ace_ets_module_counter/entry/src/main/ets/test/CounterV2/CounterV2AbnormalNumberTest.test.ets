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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  assertPropSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalNumberTest() {
  describe('CounterV2AbnormalNumberTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = { url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalNumber' };
      try {
        router.clear();
        if (router.getState().name !== 'CounterV2AbnormalNumber') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('[ARKUI_DYN] push CounterV2AbnormalNumber error:' + err);
      }
      done();
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(300);
      } catch (err) {
        console.log('CounterV2AbnormalNumberTest afterEach error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_LABEL_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_LABEL_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal label undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_LABEL_UNDEFINED_0100', Level.LEVEL0, () => {    
      try {
        assertSmoke('abn_label_u', 'abn_label_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_LABEL_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_VALUE_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_VALUE_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal value undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_VALUE_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_value_u', 'abn_value_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_VALUE_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_MIN_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_MIN_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal min undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_MIN_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_min_u', 'abn_min_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_MIN_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_MAX_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_MAX_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal max undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_MAX_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_max_u', 'abn_max_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_MAX_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_STEP_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_STEP_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal step undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_STEP_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_step_u', 'abn_step_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_STEP_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_TEXTWIDTH_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_TEXTWIDTH_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal textWidth undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_TEXTWIDTH_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_textWidth_u', 'abn_textWidth_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_TEXTWIDTH_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_FOCUSABLE_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_FOCUSABLE_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal focusable undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_FOCUSABLE_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertPropSame('abn_focusable_u', 'abn_focusable_d', 'focusable', 'inner');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_FOCUSABLE_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_ONCHANGE_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_ONCHANGE_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal onChange undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_ONCHANGE_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_onChange_u', 'abn_onChange_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_ONCHANGE_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_ONFOCUSINC_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_ONFOCUSINC_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal onFocusIncrease undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_ONFOCUSINC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_onFocusInc_u', 'abn_onFocusInc_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_ONFOCUSINC_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_ONFOCUSDEC_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_ONFOCUSDEC_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal onFocusDecrease undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_ONFOCUSDEC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_onFocusDec_u', 'abn_onFocusDec_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_ONFOCUSDEC_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_ONBLURINC_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_ONBLURINC_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal onBlurIncrease undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_ONBLURINC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_onBlurInc_u', 'abn_onBlurInc_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_ONBLURINC_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_ONBLURDEC_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_ONBLURDEC_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal onBlurDecrease undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_ONBLURDEC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_onBlurDec_u', 'abn_onBlurDec_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_ONBLURDEC_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_ONHOVERINC_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_ONHOVERINC_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal onHoverIncrease undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_ONHOVERINC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_onHoverInc_u', 'abn_onHoverInc_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_ONHOVERINC_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_ONHOVERDEC_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_ONHOVERDEC_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal onHoverDecrease undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_ONHOVERDEC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_onHoverDec_u', 'abn_onHoverDec_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_ONHOVERDEC_UNDEFINED_0100  error: ' + err);
      }
    });

  });
}
