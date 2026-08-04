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


import { describe, beforeAll, beforeEach, afterEach, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function ChipGroupV2AbnormalRootTest(): void {
  describe('ChipGroupV2AbnormalRootTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/ChipGroupV2AbnormalRoot',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("ChipGroupV2AbnormalRoot" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] push ChipGroupV2AbnormalRoot error:' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITEMSTYLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_itemStyle_u', 'abn_itemStyle_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SELECTEDINDEXES_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_selectedIndexes_u', 'abn_selectedIndexes_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_MULTIPLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_multiple_u', 'abn_multiple_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CHIPGROUPSPACE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_chipGroupSpace_u', 'abn_chipGroupSpace_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_CHIPGROUPPADDING_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_chipGroupPadding_u', 'abn_chipGroupPadding_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ONCHANGE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_onChange_u', 'abn_onChange_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_SUFFIX_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_suffix_u', 'abn_suffix_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITEMSEMPTY_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertSmoke('abn_itemsEmpty_u', 'abn_itemsEmpty_d');
    });
  });
}
