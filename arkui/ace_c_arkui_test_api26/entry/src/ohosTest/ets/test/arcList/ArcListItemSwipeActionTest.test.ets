/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function ArcListItemSwipeActionTest() {

  describe('ArcListItemSwipeActionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcListItemSwipeActionTest_001
     * @tc.number SUB_ARKUI_ARCLISTITEMSWIPEACTION_TEST_0100
     * @tc.desc   Test NODE_ARC_LIST_ITEM_SWIPE_ACTION with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemSwipeAction001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemSwipeAction001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListItemSwipeActionTest_002
     * @tc.number SUB_ARKUI_ARCLISTITEMSWIPEACTION_TEST_0200
     * @tc.desc   Test NODE_ARC_LIST_ITEM_SWIPE_ACTION with different parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemSwipeAction002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemSwipeAction002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListItemSwipeActionTest_003
     * @tc.number SUB_ARKUI_ARCLISTITEMSWIPEACTION_TEST_0300
     * @tc.desc   Test NODE_ARC_LIST_ITEM_SWIPE_ACTION with edge effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemSwipeAction003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemSwipeAction003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListItemSwipeActionTest_004
     * @tc.number SUB_ARKUI_ARCLISTITEMSWIPEACTION_TEST_0400
     * @tc.desc   Test NODE_ARC_LIST_ITEM_SWIPE_ACTION reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemSwipeAction004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemSwipeAction004()).assertEqual(0)
      done()
    })
  })
}