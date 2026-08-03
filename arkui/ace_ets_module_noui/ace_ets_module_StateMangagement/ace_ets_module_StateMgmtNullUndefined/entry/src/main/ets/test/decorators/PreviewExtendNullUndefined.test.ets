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

export default function previewExtendNullUndefinedTest() {
  describe('PreviewExtendNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[PreviewExtendNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[PreviewExtendNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number Preview_Extend_Component_ReusableV2_page_load_001
     * @tc.name Preview_Extend_Component_ReusableV2_page_load_001
     * @tc.desc Cover @Preview/@Extend/@Component/@ComponentV2/@ReusableV2 page load
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('Preview_Extend_Component_ReusableV2_page_load_001', Level.LEVEL2, async () => {
      console.info('[Preview_Extend_Component_ReusableV2_page_load_001] START');
      try {
        await pushPage('MainAbility/pages/decorators/PreviewExtendCover', 'PreviewExtendCover');
        await assertTitleVisible('preview_extend_title');
      } catch (err) {
        console.error('[Preview_Extend_Component_ReusableV2_page_load_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[Preview_Extend_Component_ReusableV2_page_load_001] END');
    });
  });
}
