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

export default function ParagraphStyleTailIndentsTest() {
  describe('ParagraphStyleTailIndentsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ParagraphStyleTailIndentsTest beforeEach start");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0100
     * @tc.number SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0100
     * @tc.desc   Test OH_ArkUI_ParagraphStyle_SetTailIndents with single indent value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0100 START');
      expect(nativeFunc.ParagraphStyleTailIndentsTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0200
     * @tc.number SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0200
     * @tc.desc   Test OH_ArkUI_ParagraphStyle_SetTailIndents with multiple indent values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0200', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0200 START');
      expect(nativeFunc.ParagraphStyleTailIndentsTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0300
     * @tc.number SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0300
     * @tc.desc   Test OH_ArkUI_ParagraphStyle_SetTailIndents then GetTailIndents with single value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0300', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0300 START');
      expect(nativeFunc.ParagraphStyleTailIndentsTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0400
     * @tc.number SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0400
     * @tc.desc   Test OH_ArkUI_ParagraphStyle_SetTailIndents then GetTailIndents with multiple values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0400', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0400 START');
      expect(nativeFunc.ParagraphStyleTailIndentsTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0500
     * @tc.number SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0500
     * @tc.desc   Test OH_ArkUI_ParagraphStyle_SetTailIndents with nullptr paragraphStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0500', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0500 START');
      expect(nativeFunc.ParagraphStyleTailIndentsTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0600
     * @tc.number SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0600
     * @tc.desc   Test OH_ArkUI_ParagraphStyle_SetTailIndents with nullptr tailIndents
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0600', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0600 START');
      expect(nativeFunc.ParagraphStyleTailIndentsTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0700
     * @tc.number SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0700
     * @tc.desc   Test OH_ArkUI_ParagraphStyle_GetTailIndents with nullptr paragraphStyle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0700', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0700 START');
      expect(nativeFunc.ParagraphStyleTailIndentsTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_CAPI_PARAGRAPH_STYLE_TAIL_INDENTS_0700 END');
    });
  });
}
