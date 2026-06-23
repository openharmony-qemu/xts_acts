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

export default function ArcListEnableScrollInteractionTest() {

  describe('ArcListEnableScrollInteractionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcListEnableScrollInteractionTest_001
     * @tc.number SUB_ARKUI_ARCLISTENABLESCROLLINTERACTION_TEST_0100
     * @tc.desc   Test NODE_ARC_LIST_ENABLE_SCROLL_INTERACTION with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListEnableScrollInteraction001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListEnableScrollInteraction001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListEnableScrollInteractionTest_002
     * @tc.number SUB_ARKUI_ARCLISTENABLESCROLLINTERACTION_TEST_0200
     * @tc.desc   Test NODE_ARC_LIST_ENABLE_SCROLL_INTERACTION with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListEnableScrollInteraction002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListEnableScrollInteraction002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListEnableScrollInteractionTest_003
     * @tc.number SUB_ARKUI_ARCLISTENABLESCROLLINTERACTION_TEST_0300
     * @tc.desc   Test NODE_ARC_LIST_ENABLE_SCROLL_INTERACTION reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListEnableScrollInteraction003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListEnableScrollInteraction003()).assertEqual(0)
      done()
    })
  })
}