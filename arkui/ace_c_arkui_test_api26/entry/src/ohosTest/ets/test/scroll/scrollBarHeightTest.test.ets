/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function ScrollBarHeightTest() {
  describe('ScrollBarHeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ScrollBarHeightTest_001
     * @tc.number SUB_ARKUI_SCROLLBARHEIGHT_TEST_0100
     * @tc.desc   ScrollBarHeightTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollBarHeightTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ScrollBarHeightTest_001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ScrollBarHeightTest_002
     * @tc.number SUB_ARKUI_SCROLLBARHEIGHT_TEST_0200
     * @tc.desc   Test the NODE_SCROLL_BAR_HEIGHT with normal values(10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollBarHeightTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ScrollBarHeightTest_002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ScrollBarHeightTest_003
     * @tc.number SUB_ARKUI_SCROLLBARHEIGHT_TEST_0300
     * @tc.desc   Test the NODE_SCROLL_BAR_HEIGHT with normal values(20)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollBarHeightTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ScrollBarHeightTest_003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ScrollBarHeightTest_004
     * @tc.number SUB_ARKUI_SCROLLBARHEIGHT_TEST_0400
     * @tc.desc   Test the NODE_SCROLL_BAR_HEIGHT with values(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollBarHeightTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ScrollBarHeightTest_004()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ScrollAlignmentStartTest_001
     * @tc.number SUB_ARKUI_SCROLL_ALIGNMENT_START_TEST_0100
     * @tc.desc   Test the ARKUI_SCROLL_ALIGNMENT_START with values(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScrollAlignmentStartTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ScrollAlignmentStartTest_001()).assertEqual(0);
      done();
    });
  })
}