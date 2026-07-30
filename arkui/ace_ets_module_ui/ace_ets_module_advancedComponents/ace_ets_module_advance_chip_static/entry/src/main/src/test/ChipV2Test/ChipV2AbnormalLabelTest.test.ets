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


import { describe, beforeAll, beforeEach, afterEach, it, Level } from '../../../../hypium';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';
import { ensureAbnormalPage } from '../common/AbnormalPageRouter';

export default function ChipV2AbnormalLabelTest(): void {
  describe('ChipV2AbnormalLabelTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      await CommonFunc.sleep(300);
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    it('SUB_ARKUI_CHIPV2_ABN_LBLFONTSIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblFontSize_u');
      assertChildrenSame('abn_lblFontSize_u', 'abn_lblFontSize_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLFONTCOLOR_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblFontColor_u');
      assertChildrenSame('abn_lblFontColor_u', 'abn_lblFontColor_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLACTFONTCOLOR_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblActFontColor_u');
      assertChildrenSame('abn_lblActFontColor_u', 'abn_lblActFontColor_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLFONTFAMILY_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblFontFamily_u');
      assertChildrenSame('abn_lblFontFamily_u', 'abn_lblFontFamily_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLMARGIN_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblMargin_u');
      assertSmoke('abn_lblMargin_u', 'abn_lblMargin_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLMARGINLEFT_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblMarginLeft_u');
      assertSmoke('abn_lblMarginLeft_u', 'abn_lblMarginLeft_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLMARGINRIGHT_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblMarginRight_u');
      assertSmoke('abn_lblMarginRight_u', 'abn_lblMarginRight_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLLOCMARGIN_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblLocMargin_u');
      assertSmoke('abn_lblLocMargin_u', 'abn_lblLocMargin_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLLOCSTART_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblLocStart_u');
      assertSmoke('abn_lblLocStart_u', 'abn_lblLocStart_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLLOCEND_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblLocEnd_u');
      assertSmoke('abn_lblLocEnd_u', 'abn_lblLocEnd_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_LBLMODIFIER_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_lblModifier_u');
      assertSmoke('abn_lblModifier_u', 'abn_lblModifier_d');
    });
  });
}
