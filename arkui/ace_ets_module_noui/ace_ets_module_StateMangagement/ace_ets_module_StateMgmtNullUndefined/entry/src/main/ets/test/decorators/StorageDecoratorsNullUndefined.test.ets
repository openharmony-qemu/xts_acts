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

export default function storageDecoratorsNullUndefinedTest() {
  describe('StorageDecoratorsNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[StorageDecoratorsNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[StorageDecoratorsNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number StorageProp_StorageLink_Watch_null_undefined_001
     * @tc.name StorageProp_StorageLink_Watch_null_undefined_001
     * @tc.desc Cover @StorageProp/@StorageLink/@Watch/@LocalStorage* null/undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('StorageProp_StorageLink_Watch_null_undefined_001', Level.LEVEL2, async () => {
      console.info('[StorageProp_StorageLink_Watch_null_undefined_001] START');
      try {
        await pushPage('MainAbility/pages/appStorage/StorageWatchNullArgsCover',
          'StorageWatchNullArgsCover');
        await assertTitleVisible('storage_watch_null_title');
      } catch (err) {
        console.error('[StorageProp_StorageLink_Watch_null_undefined_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[StorageProp_StorageLink_Watch_null_undefined_001] END');
    });

    /**
     * @tc.number StorageDecorators_page_load_001
     * @tc.name StorageDecorators_page_load_001
     * @tc.desc Cover @StorageProp/@StorageLink/@Watch normal page load
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('StorageDecorators_page_load_001', Level.LEVEL2, async () => {
      console.info('[StorageDecorators_page_load_001] START');
      try {
        await pushPage('MainAbility/pages/appStorage/StorageDecoratorsCover',
          'StorageDecoratorsCover');
        await assertTitleVisible('storage_deco_cover_title');
      } catch (err) {
        console.error('[StorageDecorators_page_load_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[StorageDecorators_page_load_001] END');
    });
  });
}
