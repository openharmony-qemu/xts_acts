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

import { describe, beforeEach, afterEach, it, Level } from '../../../../hypium/index';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';
import { ensureAbnormalPage } from '../common/AbnormalPageRouter';

export default function ChipV2AbnormalPrefixIconTest(): void {
  describe('ChipV2AbnormalPrefixIconTest', () => {

    beforeEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(300);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(300);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
    });

    it('SUB_ARKUI_CHIPV2_ABN_PRESIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_preSize_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertPropSame('abn_preSize_u', 'abn_preSize_d', 'size', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PREFILL_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_preFill_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_preFill_u', 'abn_preFill_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PREACTFILL_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_preActFill_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_preActFill_u', 'abn_preActFill_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PREMODIFIER_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_preModifier_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSmoke('abn_preModifier_u', 'abn_preModifier_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PRESYMNORMAL_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_preSymNormal_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_preSymNormal_u', 'abn_preSymNormal_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_PRESYMACT_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_preSymAct_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_preSymAct_u', 'abn_preSymAct_d');
    });
  });
}
