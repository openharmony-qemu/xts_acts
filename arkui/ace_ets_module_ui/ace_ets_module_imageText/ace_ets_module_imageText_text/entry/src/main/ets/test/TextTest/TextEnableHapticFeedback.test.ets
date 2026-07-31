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
import CommonFunc from '../../MainAbility/common/Common';


export default function TextEnableHapticFeedbackTest() {
  describe('TextEnableHapticFeedbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextEnableHapticFeedbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextEnableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextEnableHapticFeedbackTest state pages: " + JSON.stringify(pages));
        if (!("TextEnableHapticFeedback" == pages.name)) {
          console.info("get TextEnableHapticFeedbackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextEnableHapticFeedbackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextEnableHapticFeedbackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextEnableHapticFeedbackTest_0010
     * @tc.number SUB_ACE_TextEnableHapticFeedbackTest_0010
     * @tc.desc   test the attr of Text: enableHapticFeedback(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableHapticFeedbackTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableHapticFeedbackTest_0010] START');
      let strJson = getInspectorByKey('Text_enableHapticFeedback_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableHapticFeedbackTest_0010] value: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[TextEnableHapticFeedbackTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextEnableHapticFeedbackTest_0020
     * @tc.number SUB_ACE_TextEnableHapticFeedbackTest_0020
     * @tc.desc   test the attr of Text: enableHapticFeedback(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableHapticFeedbackTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableHapticFeedbackTest_0020] START');
      let strJson = getInspectorByKey('Text_enableHapticFeedback_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableHapticFeedbackTest_0020] value: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[TextEnableHapticFeedbackTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextEnableHapticFeedbackTest_0030
     * @tc.number SUB_ACE_TextEnableHapticFeedbackTest_0030
     * @tc.desc   test the attr of TextModifier: enableHapticFeedback(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableHapticFeedbackTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableHapticFeedbackTest_0030] START');
      let strJson = getInspectorByKey('TextModifier_enableHapticFeedback_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableHapticFeedbackTest_0030] value: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[TextEnableHapticFeedbackTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextEnableHapticFeedbackTest_0040
     * @tc.number SUB_ACE_TextEnableHapticFeedbackTest_0040
     * @tc.desc   test the attr of TextModifier: enableHapticFeedback(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableHapticFeedbackTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableHapticFeedbackTest_0040] START');
      let strJson = getInspectorByKey('TextModifier_enableHapticFeedback_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableHapticFeedbackTest_0040] value: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[TextEnableHapticFeedbackTest_0040] END');
      done();
    });
  })
}
