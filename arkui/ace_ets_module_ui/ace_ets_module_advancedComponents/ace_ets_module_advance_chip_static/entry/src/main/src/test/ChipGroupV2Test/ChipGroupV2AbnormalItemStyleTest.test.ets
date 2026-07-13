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

export default function ChipGroupV2AbnormalItemStyleTest(): void {
  describe('ChipGroupV2AbnormalItemStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/ChipGroupV2AbnormalItemStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("ChipGroupV2AbnormalItemStyle" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] push ChipGroupV2AbnormalItemStyle error:' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    it('SUB_ARKUI_CHIPGROUPV2_ABN_STYSIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_stySize_u', 'abn_stySize_d', 'size', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_STYBG_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_styBg_u', 'abn_styBg_d', 'backgroundColor', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_STYFONT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_styFont_u', 'abn_styFont_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_STYSELFONT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_stySelFont_u', 'abn_stySelFont_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_STYSELBG_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_stySelBg_u', 'abn_stySelBg_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_STYBGMAT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_styBgMat_u', 'abn_styBgMat_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_STYSELBGMAT_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSystemMaterialSame('abn_stySelBgMat_u', 'abn_stySelBgMat_d');
    });
  });
}
