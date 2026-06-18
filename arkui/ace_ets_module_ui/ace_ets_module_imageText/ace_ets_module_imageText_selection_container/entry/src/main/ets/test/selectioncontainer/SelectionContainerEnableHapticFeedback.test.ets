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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@system.router';
import Utils from '../../MainAbility/common/Utils';

interface OptionsObj {
  uri: string
}

export default function SelectionContainerEnableHapticFeedbackTest() {
  describe('SelectionContainerEnableHapticFeedbackTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerEnableHapticFeedbackTest] beforeAll called');
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerEnableHapticFeedbackTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerEnableHapticFeedback'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerEnableHapticFeedback" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerEnableHapticFeedbackTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerEnableHapticFeedbackTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerEnableHapticFeedbackTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerEnableHapticFeedbackDefault_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ENABLEHAPTICFEEDBACK_PARAM_0100
     * @tc.desc   Test SelectionContainer enableHapticFeedback default value is true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEnableHapticFeedbackDefault_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerEnableHapticFeedbackDefault_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_haptic_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEnableHapticFeedbackDefault_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableHapticFeedback).not().assertUndefined();
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[selectionContainerEnableHapticFeedbackDefault_0100] END');
    });

    /**
     * @tc.name   selectionContainerEnableHapticFeedbackTrue_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ENABLEHAPTICFEEDBACK_PARAM_0200
     * @tc.desc   Test SelectionContainer enableHapticFeedback with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEnableHapticFeedbackTrue_0200', Level.LEVEL0, async () => {
      console.info('[selectionContainerEnableHapticFeedbackTrue_0200] START');
      let strJson: string = getInspectorByKey('selectioncontainer_haptic_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEnableHapticFeedbackTrue_0200] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableHapticFeedback).not().assertUndefined();
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[selectionContainerEnableHapticFeedbackTrue_0200] END');
    });

    /**
     * @tc.name   selectionContainerEnableHapticFeedbackFalse_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ENABLEHAPTICFEEDBACK_PARAM_0300
     * @tc.desc   Test SelectionContainer enableHapticFeedback with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEnableHapticFeedbackFalse_0300', Level.LEVEL0, async () => {
      console.info('[selectionContainerEnableHapticFeedbackFalse_0300] START');
      let strJson: string = getInspectorByKey('selectioncontainer_haptic_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEnableHapticFeedbackFalse_0300] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableHapticFeedback).not().assertUndefined();
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[selectionContainerEnableHapticFeedbackFalse_0300] END');
    });

    /**
     * @tc.name   selectionContainerEnableHapticFeedbackNull_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ENABLEHAPTICFEEDBACK_PARAM_0400
     * @tc.desc   Test SelectionContainer enableHapticFeedback with null restores default value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEnableHapticFeedbackNull_0400', Level.LEVEL0, async () => {
      console.info('[selectionContainerEnableHapticFeedbackNull_0400] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_haptic_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_haptic_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEnableHapticFeedbackNull_0400] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableHapticFeedback).not().assertUndefined();
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[selectionContainerEnableHapticFeedbackNull_0400] END');
    });

    /**
     * @tc.name   selectionContainerEnableHapticFeedbackUndefined_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ENABLEHAPTICFEEDBACK_PARAM_0500
     * @tc.desc   Test SelectionContainer enableHapticFeedback with undefined restores default value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEnableHapticFeedbackUndefined_0500', Level.LEVEL0, async () => {
      console.info('[selectionContainerEnableHapticFeedbackUndefined_0500] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_haptic_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_haptic_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEnableHapticFeedbackUndefined_0500] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableHapticFeedback).not().assertUndefined();
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[selectionContainerEnableHapticFeedbackUndefined_0500] END');
    });
  });
}
