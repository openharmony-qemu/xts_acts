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
import { assertCallCompleted, assertUnexpectedError } from '../common/NullUndefinedAssertHelper';

export default function reuseOptionsNullUndefinedTest() {
  describe('ReuseOptionsNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[ReuseOptionsNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[ReuseOptionsNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number ReuseOptions_reuseId_undefined_001
     * @tc.name ReuseOptions_reuseId_undefined_001
     * @tc.desc Test ReuseOptions.reuseId with undefined; null compile-fail archived
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('ReuseOptions_reuseId_undefined_001', Level.LEVEL2, () => {
      console.info('[ReuseOptions_reuseId_undefined_001] START');
      try {
        const options: ReuseOptions = { reuseId: undefined };
        expect(options.reuseId).assertUndefined();
        assertCallCompleted();
      } catch (err) {
        console.error('[ReuseOptions_reuseId_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[ReuseOptions_reuseId_undefined_001] END');
    });

    /**
     * @tc.number ReuseOptions_ReusableV2_page_load_001
     * @tc.name ReuseOptions_ReusableV2_page_load_001
     * @tc.desc Cover ReuseOptions/.reuse and @ReusableV2 by loading page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('ReuseOptions_ReusableV2_page_load_001', Level.LEVEL2, async () => {
      console.info('[ReuseOptions_ReusableV2_page_load_001] START');
      try {
        await pushPage('MainAbility/pages/reuse/ReuseOptionsCover', 'ReuseOptionsCover');
        await assertTitleVisible('reuse_options_cover_title');
      } catch (err) {
        console.error('[ReuseOptions_ReusableV2_page_load_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[ReuseOptions_ReusableV2_page_load_001] END');
    });
  });
}
