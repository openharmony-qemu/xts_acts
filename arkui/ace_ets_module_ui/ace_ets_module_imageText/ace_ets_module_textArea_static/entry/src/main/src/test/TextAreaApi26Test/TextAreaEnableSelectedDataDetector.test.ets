'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function TextAreaEnableSelectedDataDetectorTest() {
  describe('TextAreaEnableSelectedDataDetectorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextAreaEnableSelectedDataDetectorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.textArea.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextAreaEnableSelectedDataDetectorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi26/TextAreaEnableSelectedDataDetector',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("TextAreaEnableSelectedDataDetectorTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaEnableSelectedDataDetector" == pages.name)) {
          console.info("TextAreaEnableSelectedDataDetectorTest push page");
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("TextAreaEnableSelectedDataDetectorTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   textAreaEnableSelectedDataDetector_true_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLESELECTEDDATADETECTOR_PARAM_0100
     * @tc.desc   Test TextArea enableSelectedDataDetector property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableSelectedDataDetector_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaEnableSelectedDataDetector_true_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_enableSelectedDataDetector_true');
      console.info("[textAreaEnableSelectedDataDetector_true_0100] enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual('true');
      console.info('[textAreaEnableSelectedDataDetector_true_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaEnableSelectedDataDetector_false_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLESELECTEDDATADETECTOR_PARAM_0200
     * @tc.desc   Test TextArea enableSelectedDataDetector property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableSelectedDataDetector_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaEnableSelectedDataDetector_false_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_enableSelectedDataDetector_false');
      console.info("[textAreaEnableSelectedDataDetector_false_0100] enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual('false');
      console.info('[textAreaEnableSelectedDataDetector_false_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaEnableSelectedDataDetector_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLESELECTEDDATADETECTOR_PARAM_0300
     * @tc.desc   Test TextArea enableSelectedDataDetector property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableSelectedDataDetector_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaEnableSelectedDataDetector_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('textarea_enableSelectedDataDetector_default');
      let strJson = inspector.getInspectorByKey('textarea_enableSelectedDataDetector_undefined');

      console.info("[textAreaEnableSelectedDataDetector_undefined_0100] default enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info("[textAreaEnableSelectedDataDetector_undefined_0100] undefined enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info('[textAreaEnableSelectedDataDetector_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaEnableSelectedDataDetector_modifier_true_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLESELECTEDDATADETECTOR_MODIFIER_0100
     * @tc.desc   Test TextArea enableSelectedDataDetector property set via AttributeModifier with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableSelectedDataDetector_modifier_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaEnableSelectedDataDetector_modifier_true_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_enableSelectedDataDetector_modifier_true');
      console.info("[textAreaEnableSelectedDataDetector_modifier_true_0100] enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual('true');
      console.info('[textAreaEnableSelectedDataDetector_modifier_true_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaEnableSelectedDataDetector_modifier_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLESELECTEDDATADETECTOR_MODIFIER_0200
     * @tc.desc   Test TextArea enableSelectedDataDetector property set via AttributeModifier with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableSelectedDataDetector_modifier_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaEnableSelectedDataDetector_modifier_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('textarea_enableSelectedDataDetector_default');
      let strJson = inspector.getInspectorByKey('textarea_enableSelectedDataDetector_modifier_undefined');

      console.info("[textAreaEnableSelectedDataDetector_modifier_undefined_0100] default enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info("[textAreaEnableSelectedDataDetector_modifier_undefined_0100] modifier enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info('[textAreaEnableSelectedDataDetector_modifier_undefined_0100] END');
      done();
    })
  })
}
