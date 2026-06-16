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

export default function arcListSpaceTest() {

  describe('ArcListSpaceTest', () => {

    /**
     * @tc.name   testArcListSpaceSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SPACE_SET_0001
     * @tc.desc   testing space set for arcList with value 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpaceSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpaceSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListSpaceSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SPACE_SET_0002
     * @tc.desc   testing space set for arcList with value 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpaceSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpaceSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListSpaceSet003
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SPACE_SET_0003
     * @tc.desc   testing space set for arcList with invalid value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListSpaceSet003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListSpaceSet003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListSpaceSet004
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SPACE_SET_0004
     * @tc.desc   testing space set for arcList with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpaceSet004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpaceSet004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListSpaceGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SPACE_GET_0001
     * @tc.desc   testing space get for arcList with value 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpaceGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpaceGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListSpaceGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SPACE_GET_0002
     * @tc.desc   testing space get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSpaceGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSpaceGet002()).assertEqual(0)
      done()
    })
  })
}