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

export default function arcListEnableScrollInteractionTest() {

  describe('ArcListEnableScrollInteractionTest', () => {

    /**
     * @tc.name   testArcListEnableScrollInteractionSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ENABLE_SCROLL_INTERACTION_SET_0001
     * @tc.desc   testing enable scroll interaction set for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListEnableScrollInteractionSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListEnableScrollInteractionSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListEnableScrollInteractionSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ENABLE_SCROLL_INTERACTION_SET_0002
     * @tc.desc   testing enable scroll interaction set for arcList with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListEnableScrollInteractionSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListEnableScrollInteractionSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListEnableScrollInteractionGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ENABLE_SCROLL_INTERACTION_GET_0001
     * @tc.desc   testing enable scroll interaction get for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListEnableScrollInteractionGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListEnableScrollInteractionGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListEnableScrollInteractionGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ENABLE_SCROLL_INTERACTION_GET_0002
     * @tc.desc   testing enable scroll interaction get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListEnableScrollInteractionGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListEnableScrollInteractionGet002()).assertEqual(0)
      done()
    })
  })
}