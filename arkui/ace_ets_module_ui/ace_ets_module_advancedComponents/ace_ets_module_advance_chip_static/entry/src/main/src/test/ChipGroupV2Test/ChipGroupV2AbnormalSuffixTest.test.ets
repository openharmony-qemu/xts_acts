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


import { describe, beforeAll, beforeEach, afterEach, it, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function ChipGroupV2AbnormalSuffixTest(): void {
  describe('ChipGroupV2AbnormalSuffixTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/ChipGroupV2AbnormalSuffix',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("ChipGroupV2AbnormalSuffix" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] push ChipGroupV2AbnormalSuffix error:' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    it('SUB_ARKUI_CHIPGROUPV2_ABN_SFXBGMAT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_sfxBgMat_u', 'abn_sfxBgMat_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SFXA11YTX_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sfxA11yTx_u', 'abn_sfxA11yTx_d', 'accessibilityText', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SFXA11YDS_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sfxA11yDs_u', 'abn_sfxA11yDs_d', 'accessibilityDescription', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SFXA11YLV_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sfxA11yLv_u', 'abn_sfxA11yLv_d', 'accessibilityLevel', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SFXSYMA11YTX_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sfxSymA11yTx_u', 'abn_sfxSymA11yTx_d', 'accessibilityText', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SFXSYMA11YDS_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sfxSymA11yDs_u', 'abn_sfxSymA11yDs_d', 'accessibilityDescription', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SFXSYMA11YLV_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_sfxSymA11yLv_u', 'abn_sfxSymA11yLv_d', 'accessibilityLevel', 'root');
    });
  });
}
