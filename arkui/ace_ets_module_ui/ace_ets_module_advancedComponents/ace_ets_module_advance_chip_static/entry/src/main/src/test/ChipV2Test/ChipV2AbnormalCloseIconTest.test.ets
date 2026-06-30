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
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame,
} from '../common/AbnormalAssertHelper';
import { ensureAbnormalPage } from '../common/AbnormalPageRouter';

export default function ChipV2AbnormalCloseIconTest(): void {
  describe('ChipV2AbnormalCloseIconTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.advance.chip.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      await CommonFunc.sleep(300);
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    it('SUB_ARKUI_CHIPV2_ABN_CLOSEICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_closeIcon_u');
      assertChildrenSame('abn_closeIcon_u', 'abn_closeIcon_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEFONTSIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_closeFontSize_u');
      assertChildrenSame('abn_closeFontSize_u', 'abn_closeFontSize_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEA11YLV_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_closeA11yLv_u');
      assertPropSame('abn_closeA11yLv_u', 'abn_closeA11yLv_d', 'accessibilityLevel', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEA11YTX_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_closeA11yTx_u');
      assertPropSame('abn_closeA11yTx_u', 'abn_closeA11yTx_d', 'accessibilityText', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEA11YDS_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_closeA11yDs_u');
      assertPropSame('abn_closeA11yDs_u', 'abn_closeA11yDs_d', 'accessibilityDescription', 'root');
    });
  });
}
