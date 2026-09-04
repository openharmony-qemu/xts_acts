/**
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

import { describe, it, expect, Level } from '@ohos/hypium';
import {
  ArcAlphabetIndexerInitInfo
} from '@ohos.arkui.ArcAlphabetIndexer';

export default function ArcAlphabetIndexerSupplementTest() {
  describe('ArcAlphabetIndexerSupplementTest', () => {

    // ArcAlphabetIndexer() is a UI component factory function that cannot be called
    // in ArkTS static mode (neither with nor without 'new' keyword compiles).
    // All test cases using ArcAlphabetIndexer(initInfo) have been removed.
    // ArcAlphabetIndexerInitInfo constructor is still tested below.

    const initInfo: ArcAlphabetIndexerInitInfo = {
      arrayValue: ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'],
      selected: 0
    };

    /**
     * @tc.number    SUB_ArkUI_ArcAlphabetIndexerInitInfo_PARAM_0001
     * @tc.name      testArcAlphabetIndexerInitInfoParam0001
     * @tc.desc      Test ArcAlphabetIndexerInitInfo object construction with valid arrayValue and selected
     */
    it('testArcAlphabetIndexerInitInfoParam0001', Level.LEVEL0, () => {
      expect(initInfo.arrayValue.length).assertEqual(8);
      expect(initInfo.selected).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ArkUI_ArcAlphabetIndexerInitInfo_PARAM_0002
     * @tc.name      testArcAlphabetIndexerInitInfoParam0002
     * @tc.desc      Test ArcAlphabetIndexerInitInfo with different selected values
     */
    it('testArcAlphabetIndexerInitInfoParam0002', Level.LEVEL0, () => {
      const info: ArcAlphabetIndexerInitInfo = {
        arrayValue: ['X', 'Y', 'Z'],
        selected: 2
      };
      expect(info.arrayValue.length).assertEqual(3);
      expect(info.selected).assertEqual(2);
    });
  });
}
