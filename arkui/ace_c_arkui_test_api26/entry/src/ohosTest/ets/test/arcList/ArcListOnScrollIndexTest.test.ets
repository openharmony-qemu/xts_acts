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

export default function arcListOnScrollIndexTest() {

  describe('ArcListOnScrollIndexTest', () => {

    /**
     * @tc.name   testArcListOnScrollIndex001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_INDEX_0001
     * @tc.desc   testing on scroll index event registration for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnScrollIndex001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnScrollIndex001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListOnScrollIndex002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_INDEX_0002
     * @tc.desc   testing on scroll index event registration return value for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnScrollIndex002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnScrollIndex002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   getOnScrollIndexResult
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_INDEX_RESULT_0001
     * @tc.desc   testing get on scroll index event result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getOnScrollIndexResult', Level.LEVEL1, async (done: Function) => {
      let result = nativeFunc.getOnScrollIndexResult()
      expect(result.called).assertEqual(false)
      expect(result.index).assertEqual(-1)
      done()
    })

    /**
     * @tc.name   resetOnScrollIndexFlag
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_SCROLL_INDEX_RESET_0001
     * @tc.desc   testing reset on scroll index event flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resetOnScrollIndexFlag', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.resetOnScrollIndexFlag()).assertEqual(0)
      done()
    })
  })
}