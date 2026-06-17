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

export default function RichEditorScrollToVisibleTest() {
  describe('RichEditorScrollToVisibleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorScrollToVisibleTest beforeEach start");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0100
     * @tc.number SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0100
     * @tc.desc   Test OH_ArkUI_TextEditorStyledStringController_ScrollToVisible with valid controller and valid range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0100 START');
      expect(nativeFunc.RichEditorScrollToVisibleTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0200
     * @tc.number SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0200
     * @tc.desc   Test OH_ArkUI_TextEditorStyledStringController_ScrollToVisible with nullptr controller
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0200', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0200 START');
      expect(nativeFunc.RichEditorScrollToVisibleTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0300
     * @tc.number SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0300
     * @tc.desc   Test OH_ArkUI_TextEditorStyledStringController_ScrollToVisible with start greater than end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0300', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0300 START');
      expect(nativeFunc.RichEditorScrollToVisibleTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_EDITOR_STYRED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0400
     * @tc.number SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0400
     * @tc.desc   Test OH_ArkUI_TextEditorStyledStringController_ScrollToVisible with same start and end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0400', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0400 START');
      expect(nativeFunc.RichEditorScrollToVisibleTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0500
     * @tc.number SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0500
     * @tc.desc   Test OH_ArkUI_TextEditorStyledStringController_ScrollToVisible with negative start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0500', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0500 START');
      expect(nativeFunc.RichEditorScrollToVisibleTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_TEXT_EDITOR_STYLED_STRING_CONTROLLER_SCROLL_TO_VISIBLE_0500 END');
    });
  });
}