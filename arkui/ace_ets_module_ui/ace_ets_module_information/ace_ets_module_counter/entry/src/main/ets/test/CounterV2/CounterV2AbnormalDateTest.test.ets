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
  assertSmoke,
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
        console.log('[ARKUI_DYN] push CounterV2AbnormalDate error:' + err);
      }
      done();
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(300);
      } catch (err) {
        console.log('CounterV2AbnormalDateTest afterEach error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_DATEYEAR_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_DATEYEAR_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal date year undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DATEYEAR_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_dateYear_u', 'abn_dateYear_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DATEYEAR_UNDEFINED_0100  error: ' + err);
      }
      
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_DATEMONTH_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_DATEMONTH_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal date month undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DATEMONTH_UNDEFINED_0100', Level.LEVEL0, () => {     
      try {
        assertSmoke('abn_dateMonth_u', 'abn_dateMonth_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DATEMONTH_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_DATEDAY_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_DATEDAY_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal date day undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DATEDAY_UNDEFINED_0100', Level.LEVEL0, () => { 
      try {
        assertSmoke('abn_dateDay_u', 'abn_dateDay_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DATEDAY_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_DATEFOCUSABLE_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_DATEFOCUSABLE_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal date focusable undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DATEFOCUSABLE_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_dateFocusable_u', 'abn_dateFocusable_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DATEFOCUSABLE_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_DATESTEP_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_DATESTEP_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal date step undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DATESTEP_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_dateStep_u', 'abn_dateStep_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DATESTEP_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_DATEHOVERINC_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_DATEHOVERINC_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal date hoverIncrease undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DATEHOVERINC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_dateHoverInc_u', 'abn_dateHoverInc_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DATEHOVERINC_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_DATEHOVERDEC_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_DATEHOVERDEC_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal date hoverDecrease undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DATEHOVERDEC_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_dateHoverDec_u', 'abn_dateHoverDec_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DATEHOVERDEC_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.name      SUB_ARKUI_COUNTERV2_ABN_ONDATECHANGE_UNDEFINED_0100
     * @tc.number    SUB_ARKUI_COUNTERV2_ABN_ONDATECHANGE_UNDEFINED_0100
     * @tc.desc      CounterV2 abnormal onDateChange undefined test.
     * @tc.type      FUNCTION
     * @tc.size      MediumTest
     * @tc.level      Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_ONDATECHANGE_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertSmoke('abn_onDateChange_u', 'abn_onDateChange_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_ONDATECHANGE_UNDEFINED_0100  error: ' + err);
      }
    });

  });
}
