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

export default function entryOptionsNullUndefinedTest() {
  describe('EntryOptionsNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[EntryOptionsNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[EntryOptionsNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number EntryOptions_storage_undefined_001
     * @tc.name EntryOptions_storage_undefined_001
     * @tc.desc Test EntryOptions.storage with undefined; null compile-fail archived
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('EntryOptions_storage_undefined_001', Level.LEVEL2, () => {
      console.info('[EntryOptions_storage_undefined_001] START');
      try {
        const options: EntryOptions = { storage: undefined };
        expect(options.storage).assertUndefined();
        assertCallCompleted();
      } catch (err) {
        console.error('[EntryOptions_storage_undefined_001] Error: ' + JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[EntryOptions_storage_undefined_001] END');
    });

    /**
     * @tc.number Entry_EntryOptions_page_load_001
     * @tc.name Entry_EntryOptions_page_load_001
     * @tc.desc Cover @Entry / EntryOptions.storage by loading page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Entry_EntryOptions_page_load_001', Level.LEVEL2, async () => {
      console.info('[Entry_EntryOptions_page_load_001] START');
      try {
        await pushPage('MainAbility/pages/entry/EntryOptionsCover', 'EntryOptionsCover');
        await assertTitleVisible('entry_options_cover_title');
      } catch (err) {
        console.error('[Entry_EntryOptions_page_load_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[Entry_EntryOptions_page_load_001] END');
    });
  });
}
