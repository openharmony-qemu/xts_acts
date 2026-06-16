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

export default function arcListScrollBarWidthTest() {

  describe('ArcListScrollBarWidthTest', () => {

    /**
     * @tc.name   testArcListScrollBarWidthSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_WIDTH_SET_0001
     * @tc.desc   testing scroll bar width set for arcList with value 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarWidthSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarWidthSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarWidthSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_WIDTH_SET_0002
     * @tc.desc   testing scroll bar width set for arcList with value 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarWidthSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarWidthSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarWidthSet003
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_WIDTH_SET_0003
     * @tc.desc   testing scroll bar width set for arcList with invalid value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListScrollBarWidthSet003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarWidthSet003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarWidthGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_WIDTH_GET_0001
     * @tc.desc   testing scroll bar width get for arcList with value 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarWidthGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarWidthGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListScrollBarWidthGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SCROLL_BAR_WIDTH_GET_0002
     * @tc.desc   testing scroll bar width get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListScrollBarWidthGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListScrollBarWidthGet002()).assertEqual(0)
      done()
    })
  })
}