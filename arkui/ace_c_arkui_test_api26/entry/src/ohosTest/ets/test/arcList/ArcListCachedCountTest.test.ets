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

export default function arcListCachedCountTest() {

  describe('ArcListCachedCountTest', () => {

    /**
     * @tc.name   testArcListCachedCountSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_CACHED_COUNT_SET_0001
     * @tc.desc   testing cachedCount set for arcList with value 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListCachedCountSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListCachedCountSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListCachedCountSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_CACHED_COUNT_SET_0002
     * @tc.desc   testing cachedCount set for arcList with value 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListCachedCountSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListCachedCountSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListCachedCountSet003
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_CACHED_COUNT_SET_0003
     * @tc.desc   testing cachedCount set for arcList with invalid value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListCachedCountSet003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListCachedCountSet003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListCachedCountGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_CACHED_COUNT_GET_0001
     * @tc.desc   testing cachedCount get for arcList with value 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListCachedCountGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListCachedCountGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListCachedCountGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_CACHED_COUNT_GET_0002
     * @tc.desc   testing cachedCount get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListCachedCountGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListCachedCountGet002()).assertEqual(0)
      done()
    })
  })
}