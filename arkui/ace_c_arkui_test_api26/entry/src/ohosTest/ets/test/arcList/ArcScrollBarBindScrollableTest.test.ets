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

export default function arcScrollBarBindScrollableTest() {

  describe('ArcScrollBarBindScrollableTest', () => {

    /**
     * @tc.name   testArcScrollBarBindScrollableSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_BIND_SCROLLABLE_SET_0001
     * @tc.desc   testing bind scrollable set for scrollBar with arcList node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarBindScrollableSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarBindScrollableSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcScrollBarBindScrollableSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_BIND_SCROLLABLE_SET_0002
     * @tc.desc   testing bind scrollable set for scrollBar with scroll node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarBindScrollableSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarBindScrollableSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcScrollBarBindScrollableGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_BIND_SCROLLABLE_GET_0001
     * @tc.desc   testing bind scrollable get for scrollBar with arcList node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarBindScrollableGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarBindScrollableGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcScrollBarBindScrollableGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_BIND_SCROLLABLE_GET_0002
     * @tc.desc   testing bind scrollable get for scrollBar default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarBindScrollableGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarBindScrollableGet002()).assertEqual(0)
      done()
    })
  })
}