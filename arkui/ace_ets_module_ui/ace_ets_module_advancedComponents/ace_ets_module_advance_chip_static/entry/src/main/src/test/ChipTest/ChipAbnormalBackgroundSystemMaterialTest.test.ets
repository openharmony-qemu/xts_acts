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

import { describe, beforeEach, afterEach, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { assertSystemMaterialSame } from '../common/AbnormalAssertHelper';

export default function ChipAbnormalBackgroundSystemMaterialTest(): void {
  describe('ChipAbnormalBackgroundSystemMaterialTest', () => {

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Chip/abnormal/ChipAbnormalBackgroundSystemMaterial',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('ChipAbnormalBackgroundSystemMaterial' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ChipAbnormalBackgroundSystemMaterial error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
    });

    it('SUB_ARKUI_CHIP_ABN_BGSYSMAT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_bgSysMat_u', 'abn_bgSysMat_d');
    });

    it('SUB_ARKUI_CHIP_ABN_ACTBGSYSMAT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_actBgSysMat_u', 'abn_actBgSysMat_d');
    });
  });
}
