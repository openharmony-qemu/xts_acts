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
import { describe, beforeEach, afterEach, it, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSmoke,
} from '../common/AbnormalAssertHelper';

export default function CounterV2AbnormalOptionsTest() {
  describe('CounterV2AbnormalOptionsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = { url: 'MainAbility/pages/CounterV2/abnormal/CounterV2AbnormalOptions' };
      try {
        router.clear();
        if (router.getState().name !== 'CounterV2AbnormalOptions') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push CounterV2AbnormalOptions error:' + err);
      }
      done();
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
