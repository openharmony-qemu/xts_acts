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

import { describe, beforeAll, beforeEach, afterEach, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { assertSystemMaterialSame, assertSmoke } from '../common/AbnormalAssertHelper';

export default function ChipOptionsBackgroundSystemMaterialTest(): void {
  describe('ChipOptionsBackgroundSystemMaterialTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.advance.chip.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Chip/ChipOptionsBackgroundSystemMaterialPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('ChipOptionsBackgroundSystemMaterialPage' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ChipOptionsBackgroundSystemMaterialPage error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
    });

    it('SUB_ARKUI_CHIP_BGSYSMAT_NORMAL_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('chip_bgSysMat_normal', 'chip_bgSysMat_normal');
    });

    it('SUB_ARKUI_CHIP_ACTBGSYSMAT_NORMAL_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('chip_actBgSysMat_normal', 'chip_actBgSysMat_normal');
    });
  });
}
