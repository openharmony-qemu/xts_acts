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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ArcListScrollToIndexTest() {

  describe('ArcListScrollToIndexTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcListScrollToIndexTest_001
     * @tc.number SUB_ARKUI_ARCLISTSCROLLTOINDEX_TEST_0100
     * @tc.desc   Test NODE_ARC_LIST_SCROLL_TO_INDEX with index value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollToIndex001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollToIndex001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListScrollToIndexTest_002
     * @tc.number SUB_ARKUI_ARCLISTSCROLLTOINDEX_TEST_0200
     * @tc.desc   Test NODE_ARC_LIST_SCROLL_TO_INDEX with index value 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollToIndex002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollToIndex002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListScrollToIndexTest_003
     * @tc.number SUB_ARKUI_ARCLISTSCROLLTOINDEX_TEST_0300
     * @tc.desc   Test NODE_ARC_LIST_SCROLL_TO_INDEX attribute value verification
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