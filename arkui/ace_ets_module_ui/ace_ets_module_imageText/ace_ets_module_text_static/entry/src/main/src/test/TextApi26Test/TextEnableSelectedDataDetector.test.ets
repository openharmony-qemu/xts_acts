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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function TextEnableSelectedDataDetectorTest() {
  describe('TextEnableSelectedDataDetectorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextEnableSelectedDataDetectorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextEnableSelectedDataDetectorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextEnableSelectedDataDetector',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextEnableSelectedDataDetectorTest state pages:" + JSON.stringify(pages));
        if (!("TextEnableSelectedDataDetector" == pages.name)) {
          console.info("get TextEnableSelectedDataDetectorTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextEnableSelectedDataDetectorTest success ");
        }
      } catch (err) {
        console.error("push TextEnableSelectedDataDetectorTest page error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   textEnableSelectedDataDetector_true_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLESELECTEDDATADETECTOR_PARAM_0100
     * @tc.desc   Test Text enableSelectedDataDetector property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEnableSelectedDataDetector_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textEnableSelectedDataDetector_true_0100] START');

      let strJson = inspector.getInspectorByKey('text_enableSelectedDataDetector_true');
      console.info("[textEnableSelectedDataDetector_true_0100] enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual('true');
      console.info('[textEnableSelectedDataDetector_true_0100] END');
      done();
    })

    /**
     * @tc.name   textEnableSelectedDataDetector_false_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLESELECTEDDATADETECTOR_PARAM_0200
     * @tc.desc   Test Text enableSelectedDataDetector property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEnableSelectedDataDetector_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textEnableSelectedDataDetector_false_0100] START');

      let strJson = inspector.getInspectorByKey('text_enableSelectedDataDetector_false');
      console.info("[textEnableSelectedDataDetector_false_0100] enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual('false');
      console.info('[textEnableSelectedDataDetector_false_0100] END');
      done();
    })

    /**
     * @tc.name   textEnableSelectedDataDetector_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLESELECTEDDATADETECTOR_PARAM_0300
     * @tc.desc   Test Text enableSelectedDataDetector property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEnableSelectedDataDetector_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textEnableSelectedDataDetector_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('text_enableSelectedDataDetector_default');
      let strJson = inspector.getInspectorByKey('text_enableSelectedDataDetector_undefined');

      console.info("[textEnableSelectedDataDetector_undefined_0100] default enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info("[textEnableSelectedDataDetector_undefined_0100] undefined enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info('[textEnableSelectedDataDetector_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textEnableSelectedDataDetector_modifier_true_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLESELECTEDDATADETECTOR_MODIFIER_0100
     * @tc.desc   Test Text enableSelectedDataDetector property set via AttributeModifier with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEnableSelectedDataDetector_modifier_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textEnableSelectedDataDetector_modifier_true_0100] START');

      let strJson = inspector.getInspectorByKey('text_enableSelectedDataDetector_modifier_true');
      console.info("[textEnableSelectedDataDetector_modifier_true_0100] enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual('true');
      console.info('[textEnableSelectedDataDetector_modifier_true_0100] END');
      done();
    })

    /**
     * @tc.name   textEnableSelectedDataDetector_modifier_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLESELECTEDDATADETECTOR_MODIFIER_0200
     * @tc.desc   Test Text enableSelectedDataDetector property set via AttributeModifier with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEnableSelectedDataDetector_modifier_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textEnableSelectedDataDetector_modifier_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('text_enableSelectedDataDetector_default');
      let strJson = inspector.getInspectorByKey('text_enableSelectedDataDetector_modifier_undefined');

      console.info("[textEnableSelectedDataDetector_modifier_undefined_0100] default enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info("[textEnableSelectedDataDetector_modifier_undefined_0100] modifier enableSelectedDataDetector is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector'));
      console.info('[textEnableSelectedDataDetector_modifier_undefined_0100] END');
      done();
    })
  })
}
