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

export default function TextTailIndentsTest() {
  describe('TextTailIndentsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextTailIndentsTest beforeEach start");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0100
     * @tc.desc   Test NODE_TEXT_TAIL_INDENTS setAttribute with single indent value and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0100 START');
      expect(nativeFunc.TextTailIndentsTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0200
     * @tc.desc   Test NODE_TEXT_TAIL_INDENTS setAttribute with multiple indent values and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0200', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0200 START');
      expect(nativeFunc.TextTailIndentsTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0300
     * @tc.number SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0300
     * @tc.desc   Test NODE_TEXT_TAIL_INDENTS resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0300', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0300 START');
      expect(nativeFunc.TextTailIndentsTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0400
     * @tc.number SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0400
     * @tc.desc   Test NODE_TEXT_TAIL_INDENTS setAttribute then resetAttribute and getAttribute default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0400', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0400 START');
      expect(nativeFunc.TextTailIndentsTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0500
     * @tc.number SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0500
     * @tc.desc   Test NODE_TEXT_TAIL_INDENTS getAttribute default value without setting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0500', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0500 START');
      expect(nativeFunc.TextTailIndentsTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_TAIL_INDENTS_0500 END');
    });
  });
}
