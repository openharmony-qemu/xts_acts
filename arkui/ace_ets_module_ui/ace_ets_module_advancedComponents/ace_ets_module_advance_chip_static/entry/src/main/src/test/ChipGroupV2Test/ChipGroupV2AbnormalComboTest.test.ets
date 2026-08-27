'use static';
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

import { describe, beforeEach, afterEach, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function ChipGroupV2AbnormalComboTest(): void {
  describe('ChipGroupV2AbnormalComboTest', () => {

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/ChipGroupV2AbnormalCombo',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("ChipGroupV2AbnormalCombo" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] push ChipGroupV2AbnormalCombo error:' + err);
      }
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(300);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
    });

    it('SUB_ARKUI_CHIPGROUPV2_ABN_CMBG1_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_cmbG1_u', 'abn_cmbG1_d', 'backgroundColor', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CMBG2_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_cmbG2_u', 'abn_cmbG2_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CMBG3_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_cmbG3_u', 'abn_cmbG3_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CMBG4_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_cmbG4_u', 'abn_cmbG4_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CMBG5_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_cmbG5_u', 'abn_cmbG5_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CMBG6_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_cmbG6_u', 'abn_cmbG6_d');
    });
  });
}
