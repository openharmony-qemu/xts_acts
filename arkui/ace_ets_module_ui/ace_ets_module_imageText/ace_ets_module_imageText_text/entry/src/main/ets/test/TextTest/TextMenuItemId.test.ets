/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextMenuItemIdTest() {
  describe('TextMenuItemIdTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMenuItemIdTest beforeEach start");
      try {
        router.clear();
        console.info("TextMenuItemIdTest router clear success");
      } catch (err) {
        console.error("TextMenuItemIdTest router clear error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextMenuItemIdTest after each called");
    });

    /**
     * @tc.name   TextMenuItemIdTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0010
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_CUT = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0010] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_CUT).assertEqual(0);
      console.info("[TextMenuItemIdTest_0010] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0020
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_COPY = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0020] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_COPY).assertEqual(1);
      console.info("[TextMenuItemIdTest_0020] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0030
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0030
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_PASTE = 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0030] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_PASTE).assertEqual(2);
      console.info("[TextMenuItemIdTest_0030] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0040
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0040
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_SELECT_ALL = 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0040] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_SELECT_ALL).assertEqual(3);
      console.info("[TextMenuItemIdTest_0040] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0050
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0050
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_COLLABORATION_SERVICE = 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0050] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_COLLABORATION_SERVICE).assertEqual(4);
      console.info("[TextMenuItemIdTest_0050] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0060
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0060
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_CAMERA_INPUT = 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0060] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_CAMERA_INPUT).assertEqual(5);
      console.info("[TextMenuItemIdTest_0060] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0070
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0070
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_AI_WRITER = 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0070] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_AI_WRITER).assertEqual(6);
      console.info("[TextMenuItemIdTest_0070] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0080
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0080
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_TRANSLATE = 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0080', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0080] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_TRANSLATE).assertEqual(7);
      console.info("[TextMenuItemIdTest_0080] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0090
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0090
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_SEARCH = 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0090', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0090] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_SEARCH).assertEqual(8);
      console.info("[TextMenuItemIdTest_0090] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0100
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0100
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_SHARE = 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0100] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_SHARE).assertEqual(9);
      console.info("[TextMenuItemIdTest_0100] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0110
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0110
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_URL = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0110', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0110] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_URL).assertEqual(10);
      console.info("[TextMenuItemIdTest_0110] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0120
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0120
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_EMAIL = 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0120', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0120] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_EMAIL).assertEqual(11);
      console.info("[TextMenuItemIdTest_0120] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0130
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0130
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_PHONE_NUMBER = 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0130', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0130] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_PHONE_NUMBER).assertEqual(12);
      console.info("[TextMenuItemIdTest_0130] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0140
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0140
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_ADDRESS = 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0140', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0140] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_ADDRESS).assertEqual(13);
      console.info("[TextMenuItemIdTest_0140] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0150
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0150
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_DATA_TIME = 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0120', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0120] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_DATA_TIME).assertEqual(14);
      console.info("[TextMenuItemIdTest_0120] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0160
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0160
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_ASK_AI = 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0160', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0160] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_ASK_AI).assertEqual(15);
      console.info("[TextMenuItemIdTest_0160] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0170
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0170
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_APP_RESERVED_BEGIN = 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0170', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0170] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_APP_RESERVED_BEGIN).assertEqual(10000);
      console.info("[TextMenuItemIdTest_0170] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0180
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0180
     * @tc.desc   test Text: ARKUI_TEXT_MENU_ITEM_ID_APP_RESERVED_END = 20000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0180', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0180] START');
      expect(ARKUI_TEXT_MENU_ITEM_ID_APP_RESERVED_END).assertEqual(20000);
      console.info("[TextMenuItemIdTest_0180] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0190
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0190
     * @tc.desc   test Text: ARKUI_TEXT_SPAN_TYPE_TEXT = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0190', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0190] START');
      expect(ARKUI_TEXT_SPAN_TYPE_TEXT).assertEqual(0);
      console.info("[TextMenuItemIdTest_0190] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0200
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0200
     * @tc.desc   test Text: ARKUI_TEXT_SPAN_TYPE_IMAGE = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0200] START');
      expect(ARKUI_TEXT_SPAN_TYPE_IMAGE).assertEqual(1);
      console.info("[TextMenuItemIdTest_0200] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0210
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0210
     * @tc.desc   test Text: ARKUI_TEXT_SPAN_TYPE_MIXED = 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0210', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0210] START');
      expect(ARKUI_TEXT_SPAN_TYPE_MIXED).assertEqual(2);
      console.info("[TextMenuItemIdTest_0210] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0220
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0220
     * @tc.desc   test Text: ARKUI_TEXT_SPAN_TYPE_DEFAULT = 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0220', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0220] START');
      expect(ARKUI_TEXT_SPAN_TYPE_DEFAULT).assertEqual(3);
      console.info("[TextMenuItemIdTest_0220] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0230
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0230
     * @tc.desc   test Text: ARKUI_TEXT_RESPONSE_TYPE_RIGHT_CLICK = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0230', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0230] START');
      expect(ARKUI_TEXT_RESPONSE_TYPE_RIGHT_CLICK).assertEqual(0);
      console.info("[TextMenuItemIdTest_0230] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0240
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0240
     * @tc.desc   test Text: ARKUI_TEXT_RESPONSE_TYPE_LONG_PRESS = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0240', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0240] START');
      expect(ARKUI_TEXT_RESPONSE_TYPE_LONG_PRESS).assertEqual(1);
      console.info("[TextMenuItemIdTest_0240] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0250
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0250
     * @tc.desc   test Text: ARKUI_TEXT_RESPONSE_TYPE_SELECT = 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0250', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0250] START');
      expect(ARKUI_TEXT_RESPONSE_TYPE_SELECT).assertEqual(2);
      console.info("[TextMenuItemIdTest_0250] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0260
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0260
     * @tc.desc   test Text: ARKUI_TEXT_RESPONSE_TYPE_DEFAULT = 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0260', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0260] START');
      expect(ARKUI_TEXT_RESPONSE_TYPE_DEFAULT).assertEqual(3);
      console.info("[TextMenuItemIdTest_0260] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0270
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0270
     * @tc.desc   test RichEditor: Edge.Center = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0270', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0270] START');
      expect(Edge.Center).assertEqual(1);
      console.info("[TextMenuItemIdTest_0270] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0280
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0280
     * @tc.desc   test RichEditor: Edge.Baseline = 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0280', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0280] START');
      expect(Edge.Baseline).assertEqual(3);
      console.info("[TextMenuItemIdTest_0280] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0290
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0290
     * @tc.desc   test RichEditor: Edge.Middle = 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0290', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0290] START');
      expect(Edge.Middle).assertEqual(5);
      console.info("[TextMenuItemIdTest_0290] END");
      done();
    });
  })
}