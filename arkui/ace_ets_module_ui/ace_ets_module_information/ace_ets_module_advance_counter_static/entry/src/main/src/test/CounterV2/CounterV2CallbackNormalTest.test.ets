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
import { hasInspectorTree } from '../common/AbnormalInspectorHelper';
import inspector from '@ohos.arkui.inspector';

export default function CounterV2CallbackNormalTest(): void {
  describe('CounterV2CallbackNormalTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/CounterV2CallbackNormalPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('CounterV2CallbackNormalPage' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('[CounterV2Norm] push CounterV2CallbackNormalPage error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(300);
      } catch (err) {
        console.log('CounterV2CallbackNormalTest afterEach err: ' + err);
      }
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_PAGE_LOAD_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_PAGE_LOAD_0100
     * @tc.desc     page load assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_PAGE_LOAD_0100', Level.LEVEL0, () => {
      const routerInstance = AppStorage.get<Router>('router') as Router;
      let pages = routerInstance.getState();
      expect(pages.name).assertEqual('CounterV2CallbackNormalPage');
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_NUMBEROPTS_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_NUMBEROPTS_0100
     * @tc.desc     numberOpts inspector tree assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_NUMBEROPTS_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_opts_number')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_DATEOPTS_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_DATEOPTS_0100
     * @tc.desc     dateOpts inspector tree and year button assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_DATEOPTS_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_opts_date')).assertTrue();
      let yearBtn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[3]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0];
      expect(yearBtn.getElement('$attrs').getString('accessibilityText')).assertContain('2024年');
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_NUMBER_CALLBACKS_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_NUMBER_CALLBACKS_0100
     * @tc.desc     number callbacks inspector tree assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_NUMBER_CALLBACKS_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_number_callbacks')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_ONFOCUSINC_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_ONFOCUSINC_0100
     * @tc.desc     onFocusInc callback assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_ONFOCUSINC_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_number_callbacks')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_ONFOCUSDEC_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_ONFOCUSDEC_0100
     * @tc.desc     onFocusDec callback assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_ONFOCUSDEC_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_number_callbacks')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_ONBLURINC_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_ONBLURINC_0100
     * @tc.desc     onBlurInc callback assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_ONBLURINC_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_number_callbacks')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_ONBLURDEC_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_ONBLURDEC_0100
     * @tc.desc     onBlurDec callback assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_ONBLURDEC_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_number_callbacks')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_ONHOVERINC_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_ONHOVERINC_0100
     * @tc.desc     onHoverInc callback assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_ONHOVERINC_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_number_callbacks')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_ONHOVERDEC_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_ONHOVERDEC_0100
     * @tc.desc     onHoverDec callback assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_ONHOVERDEC_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_number_callbacks')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_DATE_ONHOVERINC_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_DATE_ONHOVERINC_0100
     * @tc.desc     date onHoverInc callback assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_DATE_ONHOVERINC_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_date_callbacks')).assertTrue();
    });

    /**
     * @tc.number   SUB_ARKUI_COUNTERV2_NORM_DATE_ONHOVERDEC_0100
     * @tc.name     SUB_ARKUI_COUNTERV2_NORM_DATE_ONHOVERDEC_0100
     * @tc.desc     date onHoverDec callback assert test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_COUNTERV2_NORM_DATE_ONHOVERDEC_0100', Level.LEVEL0, () => {
      expect(hasInspectorTree('norm_date_callbacks')).assertTrue();
    });
  });
}
