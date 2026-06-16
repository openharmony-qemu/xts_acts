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

export default function arcListFrictionTest() {

  describe('ArcListFrictionTest', () => {

    /**
     * @tc.name   testArcListFrictionSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FRICTION_SET_0001
     * @tc.desc   testing friction set for arcList with value 1.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFrictionSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFrictionSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListFrictionSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FRICTION_SET_0002
     * @tc.desc   testing friction set for arcList with value 0.8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFrictionSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFrictionSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListFrictionSet003
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FRICTION_SET_0003
     * @tc.desc   testing friction set for arcList with invalid value -0.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListFrictionSet003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListFrictionSet003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListFrictionGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FRICTION_GET_0001
     * @tc.desc   testing friction get for arcList with value 1.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFrictionGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFrictionGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListFrictionGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_FRICTION_GET_0002
     * @tc.desc   testing friction get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListFrictionGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFrictionGet002()).assertEqual(0)
      done()
    })
  })
}