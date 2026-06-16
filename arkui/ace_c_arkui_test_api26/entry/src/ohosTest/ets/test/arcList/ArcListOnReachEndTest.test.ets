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

export default function arcListOnReachEndTest() {

  describe('ArcListOnReachEndTest', () => {

    /**
     * @tc.name   testArcListOnReachEnd001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_REACH_END_0001
     * @tc.desc   testing on reach end event registration for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnReachEnd001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnReachEnd001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListOnReachEnd002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_REACH_END_0002
     * @tc.desc   testing on reach end event registration return value for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnReachEnd002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnReachEnd002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   getOnReachEndResult
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_REACH_END_RESULT_0001
     * @tc.desc   testing get on reach end event result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getOnReachEndResult', Level.LEVEL1, async (done: Function) => {
      let result = nativeFunc.getOnReachEndResult()
      expect(result.called).assertEqual(false)
      done()
    })

    /**
     * @tc.name   resetOnReachEndFlag
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_REACH_END_RESET_0001
     * @tc.desc   testing reset on reach end event flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resetOnReachEndFlag', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.resetOnReachEndFlag()).assertEqual(0)
      done()
    })
  })
}