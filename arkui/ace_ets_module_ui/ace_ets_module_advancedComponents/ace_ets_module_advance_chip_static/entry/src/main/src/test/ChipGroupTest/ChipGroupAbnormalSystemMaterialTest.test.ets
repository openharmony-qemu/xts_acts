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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { assertSystemMaterialSame } from '../common/AbnormalAssertHelper';

export default function ChipGroupAbnormalSystemMaterialTest(): void {
  describe('ChipGroupAbnormalSystemMaterialTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.advance.chip.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroup/abnormal/ChipGroupAbnormalSystemMaterial',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('ChipGroupAbnormalSystemMaterial' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ChipGroupAbnormalSystemMaterial error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
    });

    it('SUB_ARKUI_CHIPGROUP_ABN_BGSYSMAT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_bgSysMat_u', 'abn_bgSysMat_d');
    });

    it('SUB_ARKUI_CHIPGROUP_ABN_SELBGMAT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_selBgMat_u', 'abn_selBgMat_d');
    });

    it('SUB_ARKUI_CHIPGROUP_ABN_SFXBGMAT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_sfxBgMat_u', 'abn_sfxBgMat_d');
    });
  });
}
