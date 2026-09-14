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
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME: int = 1000;

export default function TextInputEnableSelectedDataDetectorTest() {
  describe('TextInputEnableSelectedDataDetectorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextInputEnableSelectedDataDetectorTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.textInput.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextInputEnableSelectedDataDetectorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi26/TextInputEnableSelectedDataDetector',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextInputEnableSelectedDataDetectorTest state pages: ' + JSON.stringify(pages));
        if (!('TextInputEnableSelectedDataDetector' == pages.name)) {
          console.info('get TextInputEnableSelectedDataDetectorTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push TextInputEnableSelectedDataDetectorTest success');
        }
      } catch (err) {
        console.error('push TextInputEnableSelectedDataDetectorTest page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(() => {
      console.info('TextInputEnableSelectedDataDetectorTest afterEach case');
    });

    afterAll(async () => {
      console.info('TextInputEnableSelectedDataDetectorTest afterAll case');
    });

    /**
     * @tc.name   textInputEnableSelectedDataDetector_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLESELECTEDDATADETECTOR_PARAM_0100
     * @tc.desc   Test TextInput enableSelectedDataDetector property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableSelectedDataDetector_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputEnableSelectedDataDetector_true_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('textinput_enableSelectedDataDetector_true');
        let val = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[textInputEnableSelectedDataDetector_true_0100] enableSelectedDataDetector is: ' + val);
        expect(val).assertEqual('true');
        console.info('[textInputEnableSelectedDataDetector_true_0100] END');
        done();
      } catch (error) {
        console.error('[textInputEnableSelectedDataDetector_true_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputEnableSelectedDataDetector_false_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLESELECTEDDATADETECTOR_PARAM_0200
     * @tc.desc   Test TextInput enableSelectedDataDetector property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableSelectedDataDetector_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputEnableSelectedDataDetector_false_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('textinput_enableSelectedDataDetector_false');
        let val = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[textInputEnableSelectedDataDetector_false_0100] enableSelectedDataDetector is: ' + val);
        expect(val).assertEqual('false');
        console.info('[textInputEnableSelectedDataDetector_false_0100] END');
        done();
      } catch (error) {
        console.error('[textInputEnableSelectedDataDetector_false_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputEnableSelectedDataDetector_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLESELECTEDDATADETECTOR_PARAM_0300
     * @tc.desc   Test TextInput enableSelectedDataDetector property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableSelectedDataDetector_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputEnableSelectedDataDetector_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJsonCompare = inspector.getInspectorByKey('textinput_enableSelectedDataDetector_default');
        let strJson = inspector.getInspectorByKey('textinput_enableSelectedDataDetector_undefined');
        let defaultVal = JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector');
        let undefinedVal = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[textInputEnableSelectedDataDetector_undefined_0100] default enableSelectedDataDetector is: ' + defaultVal);
        console.info('[textInputEnableSelectedDataDetector_undefined_0100] undefined enableSelectedDataDetector is: ' + undefinedVal);
        expect(undefinedVal).assertEqual(defaultVal);
        console.info('[textInputEnableSelectedDataDetector_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[textInputEnableSelectedDataDetector_undefined_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputEnableSelectedDataDetector_modifier_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLESELECTEDDATADETECTOR_MODIFIER_0100
     * @tc.desc   Test TextInput enableSelectedDataDetector property set via AttributeModifier with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableSelectedDataDetector_modifier_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputEnableSelectedDataDetector_modifier_true_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('textinput_enableSelectedDataDetector_modifier_true');
        let val = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[textInputEnableSelectedDataDetector_modifier_true_0100] enableSelectedDataDetector is: ' + val);
        expect(val).assertEqual('true');
        console.info('[textInputEnableSelectedDataDetector_modifier_true_0100] END');
        done();
      } catch (error) {
        console.error('[textInputEnableSelectedDataDetector_modifier_true_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   textInputEnableSelectedDataDetector_modifier_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLESELECTEDDATADETECTOR_MODIFIER_0200
     * @tc.desc   Test TextInput enableSelectedDataDetector property set via AttributeModifier with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableSelectedDataDetector_modifier_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputEnableSelectedDataDetector_modifier_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJsonCompare = inspector.getInspectorByKey('textinput_enableSelectedDataDetector_default');
        let strJson = inspector.getInspectorByKey('textinput_enableSelectedDataDetector_modifier_undefined');
        let defaultVal = JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('enableSelectedDataDetector');
        let modifierVal = JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSelectedDataDetector');
        console.info('[textInputEnableSelectedDataDetector_modifier_undefined_0100] default enableSelectedDataDetector is: ' + defaultVal);
        console.info('[textInputEnableSelectedDataDetector_modifier_undefined_0100] modifier enableSelectedDataDetector is: ' + modifierVal);
        expect(modifierVal).assertEqual(defaultVal);
        console.info('[textInputEnableSelectedDataDetector_modifier_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[textInputEnableSelectedDataDetector_modifier_undefined_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
