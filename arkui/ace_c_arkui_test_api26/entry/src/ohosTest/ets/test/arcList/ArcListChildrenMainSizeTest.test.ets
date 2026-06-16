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

export default function arcListChildrenMainSizeTest() {

  describe('ArcListChildrenMainSizeTest', () => {

    /**
     * @tc.name   testArcListChildrenMainSizeSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_CHILDREN_MAIN_SIZE_SET_0001
     * @tc.desc   testing children main size set for arcList with value 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSizeSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSizeSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListChildrenMainSizeSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_CHILDREN_MAIN_SIZE_SET_0002
     * @tc.desc   testing children main size set for arcList with value 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSizeSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSizeSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListChildrenMainSizeGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_CHILDREN_MAIN_SIZE_GET_0001
     * @tc.desc   testing children main size get for arcList with value 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSizeGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSizeGet001()).assertEqual(0)
      done()
    })
  })
}