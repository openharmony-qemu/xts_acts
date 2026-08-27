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

export default function ChipV2AbnormalComboTest(): void {
  describe('ChipV2AbnormalComboTest', () => {

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

    it('SUB_ARKUI_CHIPV2_ABN_CMBC1_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_cmbC1_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertPropSame('abn_cmbC1_u', 'abn_cmbC1_d', 'backgroundColor', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CMBC2_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_cmbC2_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSmoke('abn_cmbC2_u', 'abn_cmbC2_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CMBC3_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_cmbC3_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_cmbC3_u', 'abn_cmbC3_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CMBC4_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_cmbC4_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertPropSame('abn_cmbC4_u', 'abn_cmbC4_d', 'size', 'root');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CMBC5_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_cmbC5_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSystemMaterialSame('abn_cmbC5_u', 'abn_cmbC5_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CMBC6_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_cmbC6_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertPropSame('abn_cmbC6_u', 'abn_cmbC6_d', 'padding', 'inner');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CMBC7_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_cmbC7_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertChildrenSame('abn_cmbC7_u', 'abn_cmbC7_d');
    });
    it('SUB_ARKUI_CHIPV2_ABN_CMBC8_UNDEFINED_0100', Level.LEVEL0, async () => {
      try {
        await ensureAbnormalPage('abn_cmbC8_u');
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      assertSmoke('abn_cmbC8_u', 'abn_cmbC8_d');
    });
  });
}
