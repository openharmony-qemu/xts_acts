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

export default function RichEditorEnumTest() {
  describe('RichEditorEnumTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorEnumTest beforeEach start");
      done();
    })

    // ==================== RichEditorEnumTest 枚举值测试 ====================

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_TYPE_0010
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_TYPE_0010
     * @tc.desc   Test NODE_TEXT_EDITOR_TYPE == 22031
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_TYPE_0010', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_TYPE_0010 START');
      expect(nativeFunc.RichEditorEnumTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_TYPE_0010 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON_0020
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON_0020
     * @tc.desc   Test NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON == 22032
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON_0020', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON_0020 START');
      expect(nativeFunc.RichEditorEnumTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_PASSWORD_ICON_0020 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_ICON_0030
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_ICON_0030
     * @tc.desc   Test NODE_TEXT_EDITOR_PASSWORD_ICON == 22033
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_ICON_0030', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_ICON_0030 START');
      expect(nativeFunc.RichEditorEnumTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_ICON_0030 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_AUTO_FILL_0040
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_AUTO_FILL_0040
     * @tc.desc   Test NODE_TEXT_EDITOR_ENABLE_AUTO_FILL == 22034
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_AUTO_FILL_0040', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_AUTO_FILL_0040 START');
      expect(nativeFunc.RichEditorEnumTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_AUTO_FILL_0040 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_TYPE_0050
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_TYPE_0050
     * @tc.desc   Test NODE_TEXT_EDITOR_CONTENT_TYPE == 22035
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_TYPE_0050', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_TYPE_0050 START');
      expect(nativeFunc.RichEditorEnumTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_TYPE_0050 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_RULES_0060
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_RULES_0060
     * @tc.desc   Test NODE_TEXT_EDITOR_PASSWORD_RULES == 22036
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_RULES_0060', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_RULES_0060 START');
      expect(nativeFunc.RichEditorEnumTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_PASSWORD_RULES_0060 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION_0070
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION_0070
     * @tc.desc   Test NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION == 22037
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION_0070', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION_0070 START');
      expect(nativeFunc.RichEditorEnumTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_FILL_ANIMATION_0070 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_UNDERLINE_0080
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_UNDERLINE_0080
     * @tc.desc   Test NODE_TEXT_EDITOR_SHOW_UNDERLINE == 22038
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_UNDERLINE_0080', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_UNDERLINE_0080 START');
      expect(nativeFunc.RichEditorEnumTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_UNDERLINE_0080 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_UNDERLINE_COLOR_0090
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_UNDERLINE_COLOR_0090
     * @tc.desc   Test NODE_TEXT_EDITOR_UNDERLINE_COLOR == 22039
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_UNDERLINE_COLOR_0090', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_UNDERLINE_COLOR_0090 START');
      expect(nativeFunc.RichEditorEnumTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_UNDERLINE_COLOR_0090 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_CARET_STYLE_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_CARET_STYLE_0100
     * @tc.desc   Test NODE_TEXT_EDITOR_CARET_STYLE == 22040
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_CARET_STYLE_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_CARET_STYLE_0100 START');
      expect(nativeFunc.RichEditorEnumTest_010()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_CARET_STYLE_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_SELECT_ALL_0110
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_SELECT_ALL_0110
     * @tc.desc   Test NODE_TEXT_EDITOR_SELECT_ALL == 22041
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_SELECT_ALL_0110', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SELECT_ALL_0110 START');
      expect(nativeFunc.RichEditorEnumTest_011()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SELECT_ALL_0110 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_BLUR_ON_SUBMIT_0120
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_BLUR_ON_SUBMIT_0120
     * @tc.desc   Test NODE_TEXT_EDITOR_BLUR_ON_SUBMIT == 22042
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_BLUR_ON_SUBMIT_0120', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_BLUR_ON_SUBMIT_0120 START');
      expect(nativeFunc.RichEditorEnumTest_012()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_BLUR_ON_SUBMIT_0120 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_RECT_0130
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_RECT_0130
     * @tc.desc   Test NODE_TEXT_EDITOR_CONTENT_RECT == 22043
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_RECT_0130', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_RECT_0130 START');
      expect(nativeFunc.RichEditorEnumTest_013()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_CONTENT_RECT_0130 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN_0140
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN_0140
     * @tc.desc   Test NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN == 22044
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN_0140', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN_0140 START');
      expect(nativeFunc.RichEditorEnumTest_014()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SELECTION_MENU_HIDDEN_0140 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS_0150
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS_0150
     * @tc.desc   Test NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS == 22045
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS_0150', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS_0150 START');
      expect(nativeFunc.RichEditorEnumTest_015()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ENABLE_SKIP_PREVIEW_LONG_PRESS_0150 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_CANCEL_BUTTON_0160
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_CANCEL_BUTTON_0160
     * @tc.desc   Test NODE_TEXT_EDITOR_CANCEL_BUTTON == 22046
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_CANCEL_BUTTON_0160', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_CANCEL_BUTTON_0160 START');
      expect(nativeFunc.RichEditorEnumTest_016()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_CANCEL_BUTTON_0160 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_COUNTER_0170
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_COUNTER_0170
     * @tc.desc   Test NODE_TEXT_EDITOR_SHOW_COUNTER == 22047
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_COUNTER_0170', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_COUNTER_0170 START');
      expect(nativeFunc.RichEditorEnumTest_017()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_SHOW_COUNTER_0170 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_INPUT_FILTER_0180
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_INPUT_FILTER_0180
     * @tc.desc   Test NODE_TEXT_EDITOR_INPUT_FILTER == 22048
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_INPUT_FILTER_0180', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_INPUT_FILTER_0180 START');
      expect(nativeFunc.RichEditorEnumTest_018()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_INPUT_FILTER_0180 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SCROLL_0190
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SCROLL_0190
     * @tc.desc   Test NODE_TEXT_EDITOR_ON_CONTENT_SCROLL == 22009
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SCROLL_0190', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SCROLL_0190 START');
      expect(nativeFunc.RichEditorEnumTest_019()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SCROLL_0190 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE_0200
     * @tc.desc   Test NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE == 22010
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE_0200 START');
      expect(nativeFunc.RichEditorEnumTest_020()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ON_CONTENT_SIZE_CHANGE_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR_0210
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR_0210
     * @tc.desc   Test NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR == 22011
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR_0210', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR_0210 START');
      expect(nativeFunc.RichEditorEnumTest_021()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ON_INPUT_FILTER_ERROR_0210 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL_0220
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL_0220
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL == 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL_0220', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL_0220 START');
      expect(nativeFunc.RichEditorEnumTest_022()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NORMAL_0220 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0230
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0230
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER == 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0230', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0230 START');
      expect(nativeFunc.RichEditorEnumTest_023()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0230 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER_0240
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER_0240
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER == 3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER_0240', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER_0240 START');
      expect(nativeFunc.RichEditorEnumTest_024()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PHONE_NUMBER_0240 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0250
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0250
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_EMAIL == 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0250', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0250 START');
      expect(nativeFunc.RichEditorEnumTest_025()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_0250 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD_0260
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD_0260
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD == 7
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD_0260', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD_0260 START');
      expect(nativeFunc.RichEditorEnumTest_026()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_PASSWORD_0260 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD_0270
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD_0270
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD == 8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD_0270', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD_0270 START');
      expect(nativeFunc.RichEditorEnumTest_027()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_PASSWORD_0270 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD_0280
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD_0280
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD == 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD_0280', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD_0280 START');
      expect(nativeFunc.RichEditorEnumTest_028()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_SCREEN_LOCK_PASSWORD_0280 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME_0290
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME_0290
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME == 10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME_0290', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME_0290 START');
      expect(nativeFunc.RichEditorEnumTest_029()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_USER_NAME_0290 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD_0300
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD_0300
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD == 11
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD_0300 START');
      expect(nativeFunc.RichEditorEnumTest_030()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NEW_PASSWORD_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL_0310
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL_0310
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL == 12
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL_0310', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL_0310 START');
      expect(nativeFunc.RichEditorEnumTest_031()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_NUMBER_DECIMAL_0310 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE_0320
     * @tc.number SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE_0320
     * @tc.desc   Test OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE == 14
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE_0320', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE_0320 START');
      expect(nativeFunc.RichEditorEnumTest_032()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_TEXT_EDITOR_TYPE_ONE_TIME_CODE_0320 END');
    });
  });
}