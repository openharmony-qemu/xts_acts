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

export default function arcListOnScrollStartTest() {

  describe('ArcListOnScrollStartTest', () => {

    /**
     * @tc.name   testArcListOnScrollStart001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_START_0001
     * @tc.desc   testing on scroll start event registration for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnScrollStart001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnScrollStart001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListOnScrollStart002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_START_0002
     * @tc.desc   testing on scroll start event registration return value for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnScrollStart002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnScrollStart002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   getOnScrollStartResult
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_START_RESULT_0001
     * @tc.desc   testing get on scroll start event result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getOnScrollStartResult', Level.LEVEL1, async (done: Function) => {
      let result = nativeFunc.getOnScrollStartResult()
      expect(result.called).assertEqual(false)
      done()
    })

    /**
     * @tc.name   resetOnScrollStartFlag
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_START_RESET_0001
     * @tc.desc   testing reset on scroll start event flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resetOnScrollStartFlag', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.resetOnScrollStartFlag()).assertEqual(0)
      done()
    })
  })
}