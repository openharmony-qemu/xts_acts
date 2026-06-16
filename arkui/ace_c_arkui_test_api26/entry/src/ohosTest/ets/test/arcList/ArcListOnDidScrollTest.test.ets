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

export default function arcListOnDidScrollTest() {

  describe('ArcListOnDidScrollTest', () => {

    /**
     * @tc.name   testArcListOnDidScroll001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_DID_SCROLL_0001
     * @tc.desc   testing on did scroll event registration for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnDidScroll001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnDidScroll001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListOnDidScroll002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_DID_SCROLL_0002
     * @tc.desc   testing on did scroll event registration return value for arcList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListOnDidScroll002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListOnDidScroll002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   getOnDidScrollResult
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_DID_SCROLL_RESULT_0001
     * @tc.desc   testing get on did scroll event result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getOnDidScrollResult', Level.LEVEL1, async (done: Function) => {
      let result = nativeFunc.getOnDidScrollResult()
      expect(result.called).assertEqual(false)
      done()
    })

    /**
     * @tc.name   resetOnDidScrollFlag
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ON_DID_SCROLL_RESET_0001
     * @tc.desc   testing reset on did scroll event flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('resetOnDidScrollFlag', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.resetOnDidScrollFlag()).assertEqual(0)
      done()
    })
  })
}