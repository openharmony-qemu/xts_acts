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

export default function arcListFlingSpeedLimitTest() {

  describe('ArcListFlingSpeedLimitTest', () => {

    /**
     * @tc.name   testArcListFlingSpeedLimitSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FLING_SPEED_LIMIT_SET_0001
     * @tc.desc   testing fling speed limit set for arcList with value 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFlingSpeedLimitSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimitSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListFlingSpeedLimitSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FLING_SPEED_LIMIT_SET_0002
     * @tc.desc   testing fling speed limit set for arcList with value 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFlingSpeedLimitSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimitSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListFlingSpeedLimitSet003
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FLING_SPEED_LIMIT_SET_0003
     * @tc.desc   testing fling speed limit set for arcList with invalid value -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListFlingSpeedLimitSet003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimitSet003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListFlingSpeedLimitGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FLING_SPEED_LIMIT_GET_0001
     * @tc.desc   testing fling speed limit get for arcList with value 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFlingSpeedLimitGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimitGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListFlingSpeedLimitGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FLING_SPEED_LIMIT_GET_0002
     * @tc.desc   testing fling speed limit get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFlingSpeedLimitGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimitGet002()).assertEqual(0)
      done()
    })
  })
}