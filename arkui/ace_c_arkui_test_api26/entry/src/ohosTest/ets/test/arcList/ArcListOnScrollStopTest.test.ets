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

export default function arcListOnScrollStopTest() {

  describe('ArcListOnScrollStopTest', () => {

    /**
     * @tc.name   testArcListOnScrollStop001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_STOP_0001
     * @tc.desc   testing on scroll stop event registration for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnScrollStop001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnScrollStop001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListOnScrollStop002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_STOP_0002
     * @tc.desc   testing on scroll stop event registration return value for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnScrollStop002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnScrollStop002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   getOnScrollStopResult
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_STOP_RESULT_0001
     * @tc.desc   testing get on scroll stop event result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getOnScrollStopResult', Level.LEVEL1, async (done: Function) => {
      let result = nativeFunc.getOnScrollStopResult()
      expect(result.called).assertEqual(false)
      done()
    })

    /**
     * @tc.name   resetOnScrollStopFlag
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_STOP_RESET_0001
     * @tc.desc   testing reset on scroll stop event flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resetOnScrollStopFlag', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.resetOnScrollStopFlag()).assertEqual(0)
      done()
    })
  })
}