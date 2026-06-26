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


'use static';
import { describe, beforeAll, beforeEach, afterEach, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function ChipGroupV2AbnormalItemTest(): void {
  describe('ChipGroupV2AbnormalItemTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/ChipGroupV2AbnormalItem',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("ChipGroupV2AbnormalItem" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] push ChipGroupV2AbnormalItem error:' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITPREICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itPreIcon_u', 'abn_itPreIcon_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITPRESYM_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itPreSym_u', 'abn_itPreSym_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITSUFICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itSufIcon_u', 'abn_itSufIcon_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITSUFSYM_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itSufSym_u', 'abn_itSufSym_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITALLOWCLOSE_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itAllowClose_u', 'abn_itAllowClose_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITCLOSEICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_itCloseIcon_u', 'abn_itCloseIcon_d');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITA11YDESC_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_itA11yDesc_u', 'abn_itA11yDesc_d', 'accessibilityDescription', 'root');
    });
    it('SUB_ARKUI_CHIPGROUPV2_ABN_ITA11YLV_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_itA11yLv_u', 'abn_itA11yLv_d', 'accessibilityLevel', 'root');
    });
  });
}
