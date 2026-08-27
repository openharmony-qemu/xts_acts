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

export default function ChipV2AbnormalSuffixIconTest(): void {
  describe('ChipV2AbnormalSuffixIconTest', () => {

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

    it('SUB_ARKUI_CHIPV2_ABN_SUFSIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufSize_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertPropSame('abn_sufSize_u', 'abn_sufSize_d', 'size', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFFILL_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufFill_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_sufFill_u', 'abn_sufFill_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFACTFILL_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufActFill_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_sufActFill_u', 'abn_sufActFill_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFMODIFIER_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufModifier_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSmoke('abn_sufModifier_u', 'abn_sufModifier_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFA11YLV_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufA11yLv_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertPropSame('abn_sufA11yLv_u', 'abn_sufA11yLv_d', 'accessibilityLevel', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFA11YTX_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufA11yTx_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertPropSame('abn_sufA11yTx_u', 'abn_sufA11yTx_d', 'accessibilityText', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFA11YDS_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufA11yDs_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertPropSame('abn_sufA11yDs_u', 'abn_sufA11yDs_d', 'accessibilityDescription', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFACTION_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufAction_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSmoke('abn_sufAction_u', 'abn_sufAction_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMNORMAL_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufSymNormal_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_sufSymNormal_u', 'abn_sufSymNormal_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMACT_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufSymAct_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_sufSymAct_u', 'abn_sufSymAct_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMNORMA11Y_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufSymNormA11y_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSmoke('abn_sufSymNormA11y_u', 'abn_sufSymNormA11y_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMACTA11Y_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufSymActA11y_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSmoke('abn_sufSymActA11y_u', 'abn_sufSymActA11y_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_SUFSYMACTION_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_sufSymAction_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSmoke('abn_sufSymAction_u', 'abn_sufSymAction_d');
    });
  });
}
