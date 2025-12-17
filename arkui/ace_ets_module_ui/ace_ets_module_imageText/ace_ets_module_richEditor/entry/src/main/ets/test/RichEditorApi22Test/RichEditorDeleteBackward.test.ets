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

export default function RichEditorDeleteBackwardTest() {
  describe('RichEditorDeleteBackwardTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorDeleteBackwardTest beforeEach start");
     
      try {
        router.clear();
        console.info("get RichEditorDeleteBackwardTest state success " + JSON.stringify(pages));
      } catch (err) {
        console.error("push RichEditorDeleteBackwardTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorDeleteBackwardTest after each called");
    });

    /**
     * @tc.name   RichEditorDeleteBackwardTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_RichEditorDeleteBackwardTest_0010
     * @tc.desc   test RichEditor: ARKUI_MENU_POLICY_DEFAULT = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorDeleteBackwardTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorDeleteBackwardTest_0010] START');
      expect(ARKUI_MENU_POLICY_DEFAULT).assertEqual(0);
      console.info("[RichEditorDeleteBackwardTest_0010] END");
      done();
    });

    /**
     * @tc.name   RichEditorDeleteBackwardTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_RichEditorDeleteBackwardTest_0020
     * @tc.desc   test RichEditor: ARKUI_MENU_POLICY_HIDE = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorDeleteBackwardTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorDeleteBackwardTest_0020] START');
      expect(ARKUI_MENU_POLICY_HIDE).assertEqual(1);
      console.info("[RichEditorDeleteBackwardTest_0020] END");
      done();
    });

    /**
     * @tc.name   RichEditorDeleteBackwardTest_0030
     * @tc.number SUB_ACE_BASIC_ETS_API_RichEditorDeleteBackwardTest_0030
     * @tc.desc   test RichEditor: ARKUI_MENU_POLICY_SHOW = 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorDeleteBackwardTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorDeleteBackwardTest_0030] START');
      expect(ARKUI_MENU_POLICY_SHOW).assertEqual(2);
      console.info("[RichEditorDeleteBackwardTest_0030] END");
      done();
    });

    /**
     * @tc.name   RichEditorDeleteBackwardTest_0040
     * @tc.number SUB_ACE_BASIC_ETS_API_RichEditorDeleteBackwardTest_0040
     * @tc.desc   test RichEditor: Edge.Center = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorDeleteBackwardTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorDeleteBackwardTest_0040] START');
      expect(Edge.Center).assertEqual(1);
      console.info("[RichEditorDeleteBackwardTest_0040] END");
      done();
    });

        /**
     * @tc.name   RichEditorDeleteBackwardTest_0050
     * @tc.number SUB_ACE_BASIC_ETS_API_RichEditorDeleteBackwardTest_0050
     * @tc.desc   test RichEditor: Edge.Baseline = 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorDeleteBackwardTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorDeleteBackwardTest_0050] START');
      expect(Edge.Baseline).assertEqual(3);
      console.info("[RichEditorDeleteBackwardTest_0050] END");
      done();
    });

        /**
     * @tc.name   RichEditorDeleteBackwardTest_0060
     * @tc.number SUB_ACE_BASIC_ETS_API_RichEditorDeleteBackwardTest_0060
     * @tc.desc   test RichEditor: Edge.Middle = 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorDeleteBackwardTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorDeleteBackwardTest_0060] START');
      expect(Edge.Middle).assertEqual(5);
      console.info("[RichEditorDeleteBackwardTest_0060] END");
      done();
    });
  })
}