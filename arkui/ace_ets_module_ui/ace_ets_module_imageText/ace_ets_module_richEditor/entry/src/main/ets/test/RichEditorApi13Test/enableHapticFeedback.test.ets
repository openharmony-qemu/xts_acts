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

export default function EnableHapticFeedbackTest() {
  describe('EnableHapticFeedbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("EnableHapticFeedbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi13/enableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EnableHapticFeedbackTest state pages: " + JSON.stringify(pages));
        if (!("enableHapticFeedback" == pages.name)) {
          console.info("get EnableHapticFeedbackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push EnableHapticFeedbackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnableHapticFeedbackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   EnableHapticFeedbackTest_0010
     * @tc.number SUB_ACE_EnableHapticFeedbackTest_0010
     * @tc.desc   get RichEditor enableHapticFeedback: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnableHapticFeedbackTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0010] START');
      let strJson = getInspectorByKey('RichEditor_enableHapticFeedback_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0010] enableHapticFeedback: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0010] END');
      done();
    });

    /**
     * @tc.name   EnableHapticFeedbackTest_0020
     * @tc.number SUB_ACE_EnableHapticFeedbackTest_0020
     * @tc.desc   set RichEditor enableHapticFeedback: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('EnableHapticFeedbackTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0020] START');
      let strJson = getInspectorByKey('RichEditor_enableHapticFeedback_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0020] enableHapticFeedback: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_0020] END');
      done();
    });
  })
}
