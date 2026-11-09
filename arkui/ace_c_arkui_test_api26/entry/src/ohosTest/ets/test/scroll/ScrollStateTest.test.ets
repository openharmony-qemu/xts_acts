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

export default function ScrollStateTest() {
  describe('ScrollStateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ScrollStateTest_001
     * @tc.number SUB_ARKUI_SCROLLSTATE_TEST_0100
     * @tc.desc   ScrollStateTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollStateTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ScrollStateTest_001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ScrollStateTest_002
     * @tc.number SUB_ARKUI_SCROLLSTATE_TEST_0200
     * @tc.desc   Test the NODE_SCROLL_STATE with initial state idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollStateTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ScrollStateTest_002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ScrollStateTest_003
     * @tc.number SUB_ARKUI_SCROLLSTATE_TEST_0300
     * @tc.desc   Test the ArkUI_ScrollState enum values(idle, scroll, fling)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollStateTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ScrollStateTest_003()).assertEqual(0);
      done();
    });
  })
}
