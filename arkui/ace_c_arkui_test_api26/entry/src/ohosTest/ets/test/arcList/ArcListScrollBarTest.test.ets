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

export default function arcListScrollBarTest() {

  describe('ArcListScrollBarTest', () => {

    /**
     * @tc.name   testArcListScrollBarSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_SET_0001
     * @tc.desc   testing scroll bar set for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_SET_0002
     * @tc.desc   testing scroll bar set for arcList with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_GET_0001
     * @tc.desc   testing scroll bar get for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_GET_0002
     * @tc.desc   testing scroll bar get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarGet002()).assertEqual(0)
      done()
    })
  })
}