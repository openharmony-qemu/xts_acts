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

export default function arcScrollBarDisplayModeTest() {

  describe('ArcScrollBarDisplayModeTest', () => {

    /**
     * @tc.name   testArcScrollBarDisplayModeSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_DISPLAY_MODE_SET_0001
     * @tc.desc   testing display mode set for scrollBar with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarDisplayModeSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayModeSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcScrollBarDisplayModeSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_DISPLAY_MODE_SET_0002
     * @tc.desc   testing display mode set for scrollBar with value 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarDisplayModeSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayModeSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcScrollBarDisplayModeSet003
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_DISPLAY_MODE_SET_0003
     * @tc.desc   testing display mode set for scrollBar with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarDisplayModeSet003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayModeSet003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcScrollBarDisplayModeGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_DISPLAY_MODE_GET_0001
     * @tc.desc   testing display mode get for scrollBar with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarDisplayModeGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayModeGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcScrollBarDisplayModeGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_SCROLL_BAR_DISPLAY_MODE_GET_0002
     * @tc.desc   testing display mode get for scrollBar default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcScrollBarDisplayModeGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayModeGet002()).assertEqual(0)
      done()
    })
  })
}