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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { assertPropSame, assertChildrenSame } from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalOptionsTest(): void {
  describe('CounterV2AbnormalOptionsTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('CounterV2AbnormalOptions' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('[ARKUI_NEW] push CounterV2AbnormalOptions error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(300);
      } catch (err) {
        console.log('CounterV2AbnormalOptionsTest afterEach err: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_DIRECTION_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_DIRECTION_UNDEFINED_0100
     * @tc.desc     direction undefined assert prop same test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DIRECTION_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertPropSame('abn_direction_u', 'abn_direction_d', 'direction', 'inner');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DIRECTION_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_NUMBEROPTS_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_NUMBEROPTS_UNDEFINED_0100
     * @tc.desc     numberOpts undefined assert children same test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_NUMBEROPTS_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertChildrenSame('abn_numberOpts_u', 'abn_numberOpts_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_NUMBEROPTS_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_INLINEOPTS_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_INLINEOPTS_UNDEFINED_0100
     * @tc.desc     inlineOpts undefined assert children same test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_INLINEOPTS_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertChildrenSame('abn_inlineOpts_u', 'abn_inlineOpts_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_INLINEOPTS_UNDEFINED_0100  error: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_ABN_DATEOPTS_UNDEFINED_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_ABN_DATEOPTS_UNDEFINED_0100
     * @tc.desc     dateOpts undefined assert children same test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_ABN_DATEOPTS_UNDEFINED_0100', Level.LEVEL0, () => {
      try {
        assertChildrenSame('abn_dateOpts_u', 'abn_dateOpts_d');
      } catch (err) {
        expect(true).assertEqual(false);
        console.log('SUB_ARKUI_COUNTERV2_ABN_DATEOPTS_UNDEFINED_0100  error: ' + err);
      }
    });
  });
}
