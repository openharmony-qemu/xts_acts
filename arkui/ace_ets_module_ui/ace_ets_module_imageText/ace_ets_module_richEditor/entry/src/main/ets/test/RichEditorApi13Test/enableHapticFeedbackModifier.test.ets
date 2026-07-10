/**
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function EnableHapticFeedbackModifierTest() {
  describe('EnableHapticFeedbackModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("EnableHapticFeedbackModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi13/enableHapticFeedbackModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EnableHapticFeedbackModifierTest state pages: " + JSON.stringify(pages));
        if (!("enableHapticFeedbackModifier" == pages.name)) {
          console.info("get EnableHapticFeedbackModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push EnableHapticFeedbackModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnableHapticFeedbackModifierTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   EnableHapticFeedbackModifierTest_0010
     * @tc.number SUB_ACE_EnableHapticFeedbackModifierTest_0010
     * @tc.desc   get RichEditorModifier enableHapticFeedback: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnableHapticFeedbackModifierTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[EnableHapticFeedbackModifierTest_0010] START');
      let strJson = getInspectorByKey('RichEditorModifier_enableHapticFeedback_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackModifierTest_0010] enableHapticFeedback: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackModifierTest_0010] END');
      done();
    });

    /**
     * @tc.name   EnableHapticFeedbackModifierTest_0020
     * @tc.number SUB_ACE_EnableHapticFeedbackModifierTest_0020
     * @tc.desc   set RichEditorModifier enableHapticFeedback: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnableHapticFeedbackModifierTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[EnableHapticFeedbackModifierTest_0020] START');
      let strJson = getInspectorByKey('RichEditorModifier_enableHapticFeedback_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackModifierTest_0020] enableHapticFeedback: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[EnableHapticFeedbackModifierTest_0020] END');
      done();
    });
  })
}
