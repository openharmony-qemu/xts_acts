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

export default function arcListItemSwipeActionTest() {

  describe('ArcListItemSwipeActionTest', () => {

    /**
     * @tc.name   testArcListItemSwipeActionSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ITEM_SWIPE_ACTION_SET_0001
     * @tc.desc   testing item swipe action set for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemSwipeActionSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemSwipeActionSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListItemSwipeActionSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ITEM_SWIPE_ACTION_SET_0002
     * @tc.desc   testing item swipe action set for arcList with value 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemSwipeActionSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemSwipeActionSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListItemSwipeActionGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ITEM_SWIPE_ACTION_GET_0001
     * @tc.desc   testing item swipe action get for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemSwipeActionGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemSwipeActionGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListItemSwipeActionGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ITEM_SWIPE_ACTION_GET_0002
     * @tc.desc   testing item swipe action get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemSwipeActionGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemSwipeActionGet002()).assertEqual(0)
      done()
    })
  })
}