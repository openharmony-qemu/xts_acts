/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function arcListScrollToIndexTest() {

  describe('ArcListScrollToIndexTest', () => {

    /**
     * @tc.name   testArcListScrollToIndex001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_TO_INDEX_0001
     * @tc.desc   testing scroll to index for arcList with index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollToIndex001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollToIndex001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollToIndex002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_TO_INDEX_0002
     * @tc.desc   testing scroll to index for arcList with index 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollToIndex002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollToIndex002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollToIndex003
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_TO_INDEX_0003
     * @tc.desc   testing scroll to index for arcList with invalid index -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListScrollToIndex003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListScrollToIndex003()).assertEqual(0)
      done()
    })
  })
}