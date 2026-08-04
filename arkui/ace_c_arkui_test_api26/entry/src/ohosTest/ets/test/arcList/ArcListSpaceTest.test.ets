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

export default function ArcListSpaceTest() {

  describe('ArcListSpaceTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcListSpaceTest_001
     * @tc.number SUB_ARKUI_ARCLISTSPACE_TEST_0100
     * @tc.desc   Test NODE_ARC_LIST_SPACE with normal value 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpace001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpace001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListSpaceTest_002
     * @tc.number SUB_ARKUI_ARCLISTSPACE_TEST_0200
     * @tc.desc   Test NODE_ARC_LIST_SPACE with normal value 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpace002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpace002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListSpaceTest_003
     * @tc.number SUB_ARKUI_ARCLISTSPACE_TEST_0300
     * @tc.desc   Test NODE_ARC_LIST_SPACE with invalid negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListSpace003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListSpace003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListSpaceTest_004
     * @tc.number SUB_ARKUI_ARCLISTSPACE_TEST_0400
     * @tc.desc   Test NODE_ARC_LIST_SPACE with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpace004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpace004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListSpaceTest_005
     * @tc.number SUB_ARKUI_ARCLISTSPACE_TEST_0500
     * @tc.desc   Test NODE_ARC_LIST_SPACE reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpace005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpace005()).assertEqual(0)
      done()
    })
  })
}