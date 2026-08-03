/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { pushPage, assertTitleVisible } from '../common/PagePushHelper';

export default function provideConsumeNullUndefinedTest() {
  describe('ProvideConsumeNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[ProvideConsumeNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[ProvideConsumeNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number Provide_Consume_page_load_001
     * @tc.name Provide_Consume_page_load_001
     * @tc.desc Cover @Provide/@Consume page load; null args compile-fail archived
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Provide_Consume_page_load_001', Level.LEVEL2, async () => {
      console.info('[Provide_Consume_page_load_001] START');
      try {
        await pushPage('MainAbility/pages/decorators/ProvideConsumeNullArgsCover',
          'ProvideConsumeNullArgsCover');
        await assertTitleVisible('provide_null_title');
      } catch (err) {
        console.error('[Provide_Consume_page_load_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[Provide_Consume_page_load_001] END');
    });
  });
}
