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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { assertSystemMaterialSame, assertSmoke } from '../common/AbnormalAssertHelper';

export default function ChipGroupSystemMaterialTest(): void {
  describe('ChipGroupSystemMaterialTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.advance.chip.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroup/ChipGroupSystemMaterialPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('ChipGroupSystemMaterialPage' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ChipGroupSystemMaterialPage error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
    });

    it('SUB_ARKUI_CHIPGROUP_BGSYSMAT_NORMAL_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('cg_bgSysMat_normal', 'cg_bgSysMat_normal');
    });

    it('SUB_ARKUI_CHIPGROUP_SELBGMAT_NORMAL_0100', Level.LEVEL0, async () => {
      assertSmoke('cg_selBgMat_normal', 'cg_selBgMat_normal');
    });

    it('SUB_ARKUI_CHIPGROUP_SFXBGMAT_NORMAL_0100', Level.LEVEL0, async () => {
      assertSmoke('cg_sfxBgMat_normal', 'cg_sfxBgMat_normal');
    });
  });
}
