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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextPunctuationOverflowTest() {
  describe('TextPunctuationOverflowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextPunctuationOverflowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextPunctuationOverflow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextPunctuationOverflowTest state pages: " + JSON.stringify(pages));
        if (!("TextPunctuationOverflow" == pages.name)) {
          console.info("get TextPunctuationOverflowTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextPunctuationOverflowTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextPunctuationOverflowTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   textPunctuationOverflow_true_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_TRUE_0100
     * @tc.desc   Test Text punctuationOverflow property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_true_0100', Level.LEVEL2, async () => {
      console.info('[textPunctuationOverflow_true_0100] START');

      let strJson: string = getInspectorByKey('text_punctuationOverflow_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPunctuationOverflow_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textPunctuationOverflow_true_0100] punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual('true');
      console.info('[textPunctuationOverflow_true_0100] END');
    })

    /**
     * @tc.name   textPunctuationOverflow_false_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_FALSE_0100
     * @tc.desc   Test Text punctuationOverflow property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_false_0100', Level.LEVEL2, async () => {
      console.info('[textPunctuationOverflow_false_0100] START');

      let strJson: string = getInspectorByKey('text_punctuationOverflow_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPunctuationOverflow_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textPunctuationOverflow_false_0100] punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual('false');
      console.info('[textPunctuationOverflow_false_0100] END');
    })

    /**
     * @tc.name   textPunctuationOverflow_null_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_NULL_0100
     * @tc.desc   Test Text punctuationOverflow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_null_0100', Level.LEVEL2, async () => {
      console.info('[textPunctuationOverflow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_punctuationOverflow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_punctuationOverflow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPunctuationOverflow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textPunctuationOverflow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textPunctuationOverflow_null_0100] default punctuationOverflow is: " + objCompare.$attrs.punctuationOverflow);
      console.info("[textPunctuationOverflow_null_0100] null punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual(objCompare.$attrs.punctuationOverflow);
      console.info('[textPunctuationOverflow_null_0100] END');
    })

    /**
     * @tc.name   textPunctuationOverflow_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_UNDEFINED_0100
     * @tc.desc   Test Text punctuationOverflow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textPunctuationOverflow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_punctuationOverflow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_punctuationOverflow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPunctuationOverflow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textPunctuationOverflow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textPunctuationOverflow_undefined_0100] default punctuationOverflow is: " + objCompare.$attrs.punctuationOverflow);
      console.info("[textPunctuationOverflow_undefined_0100] undefined punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual(objCompare.$attrs.punctuationOverflow);
      console.info('[textPunctuationOverflow_undefined_0100] END');
    })

    /**
     * @tc.name   textPunctuationOverflow_modifier_true_0100
     * @tc.number SUB_ARKUI_TEXT_PUNCTUATIONOVERFLOW_MODIFIER_0100
     * @tc.desc   Test Text punctuationOverflow property set via AttributeModifier with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPunctuationOverflow_modifier_true_0100', Level.LEVEL2, async () => {
      console.info('[textPunctuationOverflow_modifier_true_0100] START');

      let strJson: string = getInspectorByKey('text_punctuationOverflow_modifier_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPunctuationOverflow_modifier_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textPunctuationOverflow_modifier_true_0100] punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual('true');
      console.info('[textPunctuationOverflow_modifier_true_0100] END');
    })

  })
}
