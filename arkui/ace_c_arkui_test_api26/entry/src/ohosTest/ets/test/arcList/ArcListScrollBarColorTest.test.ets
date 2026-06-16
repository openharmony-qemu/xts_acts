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

export default function arcListScrollBarColorTest() {

  describe('ArcListScrollBarColorTest', () => {

    /**
     * @tc.name   testArcListScrollBarColorSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_COLOR_SET_0001
     * @tc.desc   testing scroll bar color set for arcList with red color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarColorSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarColorSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarColorSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_COLOR_SET_0002
     * @tc.desc   testing scroll bar color set for arcList with blue color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarColorSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarColorSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarColorGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_COLOR_GET_0001
     * @tc.desc   testing scroll bar color get for arcList with green color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarColorGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarColorGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarColorGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_COLOR_GET_0002
     * @tc.desc   testing scroll bar color get for arcList with white color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarColorGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarColorGet002()).assertEqual(0)
      done()
    })
  })
}