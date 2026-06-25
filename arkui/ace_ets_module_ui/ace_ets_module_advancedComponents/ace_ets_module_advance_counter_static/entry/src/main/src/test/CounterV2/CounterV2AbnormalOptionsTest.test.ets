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

'use static';
import { describe, beforeAll, beforeEach, afterEach, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalOptionsTest(): void {
  describe('CounterV2AbnormalOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.counter.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("CounterV2AbnormalOptions" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] push CounterV2AbnormalOptions error:' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });



    it('SUB_ARKUI_COUNTERV2_ABN_DIRECTION_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertPropSame('abn_direction_u', 'abn_direction_d', 'direction', 'inner');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_NUMBEROPTS_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_numberOpts_u', 'abn_numberOpts_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_INLINEOPTS_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_inlineOpts_u', 'abn_inlineOpts_d');
    });

    it('SUB_ARKUI_COUNTERV2_ABN_DATEOPTS_UNDEFINED_0100', Level.LEVEL0, async () => {
      assertChildrenSame('abn_dateOpts_u', 'abn_dateOpts_d');
    });

  });
}
