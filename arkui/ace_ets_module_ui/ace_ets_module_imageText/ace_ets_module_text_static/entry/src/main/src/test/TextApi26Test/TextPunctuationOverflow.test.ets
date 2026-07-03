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

export default function TextPunctuationOverflowTest() {
  describe('TextPunctuationOverflowTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextPunctuationOverflowTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextPunctuationOverflowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextPunctuationOverflow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPunctuationOverflowTest state pages:" + JSON.stringify(pages));
        if (!("TextPunctuationOverflow" == pages.name)) {
          console.info("get TextPunctuationOverflowTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextPunctuationOverflowTest success ");
        }
      } catch (err) {
        console.error("push TextPunctuationOverflowTest page error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   textPunctuationOverflow_true_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_TRUE_0100
     * @tc.desc   Test Text punctuationOverflow property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textPunctuationOverflow_true_0100] START');

      let strJson = inspector.getInspectorByKey('text_punctuationOverflow_true');
      console.info("[textPunctuationOverflow_true_0100] punctuationOverflow is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'))
        .assertEqual('true');
      console.info('[textPunctuationOverflow_true_0100] END');
      done();
    })

    /**
     * @tc.name   textPunctuationOverflow_false_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_FALSE_0100
     * @tc.desc   Test Text punctuationOverflow property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textPunctuationOverflow_false_0100] START');

      let strJson = inspector.getInspectorByKey('text_punctuationOverflow_false');

      console.info("[textPunctuationOverflow_false_0100] punctuationOverflow is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'))
        .assertEqual('false');
      console.info('[textPunctuationOverflow_false_0100] END');
      done();
    })


    /**
     * @tc.name   textPunctuationOverflow_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_UNDEFINED_0100
     * @tc.desc   Test Text punctuationOverflow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textPunctuationOverflow_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('text_punctuationOverflow_default');
      let strJson = inspector.getInspectorByKey('text_punctuationOverflow_undefined');


      console.info("[textPunctuationOverflow_undefined_0100] default punctuationOverflow is: " 
        + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('punctuationOverflow'));
      console.info("[textPunctuationOverflow_undefined_0100] undefined punctuationOverflow is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('punctuationOverflow'));
      console.info('[textPunctuationOverflow_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textPunctuationOverflow_modifier_true_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_MODIFIER_0100
     * @tc.desc   Test Text punctuationOverflow property set via AttributeModifier with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_modifier_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textPunctuationOverflow_modifier_true_0100] START');

      let strJson = inspector.getInspectorByKey('text_punctuationOverflow_modifier_true');
      console.info("[textPunctuationOverflow_modifier_true_0100] punctuationOverflow is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('punctuationOverflow'))
        .assertEqual('true');
      console.info('[textPunctuationOverflow_modifier_true_0100] END');
      done();
    })

  })
}
