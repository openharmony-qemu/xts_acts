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

export default function TextInputPunctuationOverflowTest() {
  describe('TextInputPunctuationOverflowTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextInputPunctuationOverflowTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.textInput.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextInputPunctuationOverflowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi26/TextInputPunctuationOverflow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("TextInputPunctuationOverflowTest state pages: " + JSON.stringify(pages));
        if (!("TextInputPunctuationOverflow" == pages.name)) {
          console.info("TextInputPunctuationOverflowTest push page");
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("TextInputPunctuationOverflowTest replaceUrl error: " + err);
        expect().assertFail();
      }
    })
    
    /**
     * @tc.name   textInputPunctuationOverflow_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PUNCTUATIONOVERFLOW_TRUE_0100
     * @tc.desc   Test TextInput punctuationOverflow property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPunctuationOverflow_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputPunctuationOverflow_true_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_punctuationOverflow_true');

      console.info("[textInputPunctuationOverflow_true_0100] punctuationOverflow is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow')).assertEqual('1');
      console.info('[textInputPunctuationOverflow_true_0100] END');
      done();
    })

    /**
     * @tc.name   textInputPunctuationOverflow_false_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PUNCTUATIONOVERFLOW_FALSE_0100
     * @tc.desc   Test TextInput punctuationOverflow property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPunctuationOverflow_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputPunctuationOverflow_false_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_punctuationOverflow_false');

      console.info("[textInputPunctuationOverflow_false_0100] punctuationOverflow is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow')).assertEqual('0');
      console.info('[textInputPunctuationOverflow_false_0100] END');
      done();
    })

    /**
     * @tc.name   textInputPunctuationOverflow_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PUNCTUATIONOVERFLOW_UNDEFINED_0100
     * @tc.desc   Test TextInput punctuationOverflow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPunctuationOverflow_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputPunctuationOverflow_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('textinput_punctuationOverflow_default');

      let strJson = inspector.getInspectorByKey('textinput_punctuationOverflow_undefined');

      console.info("[textInputPunctuationOverflow_undefined_0100] default punctuationOverflow is: " 
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('punctuationOverflow'));
      console.info("[textInputPunctuationOverflow_undefined_0100] undefined punctuationOverflow is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('punctuationOverflow'));
      console.info('[textInputPunctuationOverflow_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textInputPunctuationOverflow_modifier_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PUNCTUATIONOVERFLOW_MODIFIER_0100
     * @tc.desc   Test TextInput punctuationOverflow property set via AttributeModifier with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPunctuationOverflow_modifier_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputPunctuationOverflow_modifier_true_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_punctuationOverflow_modifier_true');

      console.info("[textInputPunctuationOverflow_modifier_true_0100] punctuationOverflow is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow')).assertEqual('1');
      console.info('[textInputPunctuationOverflow_modifier_true_0100] END');
      done();
    })

  })
}
