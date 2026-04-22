/**
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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function TextEnumTest() {
  describe('TextEnumTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextEnumTest beforeEach start");
      done();
    })

    // ==================== TextEnumTest 枚举值测试 ====================

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100
     * @tc.desc   Test NODE_TEXT_ON_TEXT_SELECTION_CHANGE == 1002
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100 START');
      expect(nativeFunc.TextEnumTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_ON_COPY_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_ON_COPY_0200
     * @tc.desc   Test ARKUI_COMPETITION_STRATEGY_COMPETITION == 1003
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_ON_COPY_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_ON_COPY_0200 START');
      expect(nativeFunc.TextEnumTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_ON_COPY_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300
     * @tc.number SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300
     * @tc.desc   Test NODE_TEXT_ON_WILL_COPY == 1004
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300 START');
      expect(nativeFunc.TextEnumTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400
     * @tc.number SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400
     * @tc.desc   Test NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION == 1047
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400 START');
      expect(nativeFunc.TextEnumTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_CONTROLLER_0500
     * @tc.number SUB_ARKUI_NODE_TEXT_CONTROLLER_0500
     * @tc.desc   Test NODE_TEXT_CONTROLLER == 1054
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_CONTROLLER_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_CONTROLLER_0500 START');
      expect(nativeFunc.TextEnumTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_CONTROLLER_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600
     * @tc.desc   Test NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION == 22028
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600 START');
      expect(nativeFunc.TextEnumTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700
     * @tc.desc   Test NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING == 22029
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700 START');
      expect(nativeFunc.TextEnumTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800
     * @tc.number SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800
     * @tc.desc   Test OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING == 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800 START');
      expect(nativeFunc.TextEnumTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800 END');
    });
  });
}