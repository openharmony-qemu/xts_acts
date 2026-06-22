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

export default function ArcListFadingEdgeTest() {

  describe('ArcListFadingEdgeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcListFadingEdgeTest_001
     * @tc.number SUB_ARKUI_ARCLISTFADINGEDGE_TEST_0100
     * @tc.desc   Test NODE_ARC_LIST_FADING_EDGE with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFadingEdge001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFadingEdge001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListFadingEdgeTest_002
     * @tc.number SUB_ARKUI_ARCLISTFADINGEDGE_TEST_0200
     * @tc.desc   Test NODE_ARC_LIST_FADING_EDGE with different parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFadingEdge002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFadingEdge002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListFadingEdgeTest_003
     * @tc.number SUB_ARKUI_ARCLISTFADINGEDGE_TEST_0300
     * @tc.desc   Test NODE_ARC_LIST_FADING_EDGE reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFadingEdge003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFadingEdge003()).assertEqual(0)
      done()
    })
  })
}