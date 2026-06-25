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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function RichEditorPunctuationOverflowTest() {
  describe('RichEditorPunctuationOverflowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorPunctuationOverflowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/RichEditorPunctuationOverflow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorPunctuationOverflow state pages: " + JSON.stringify(pages));
        if (!("RichEditorPunctuationOverflow" == pages.name)) {
          console.info("get RichEditorPunctuationOverflow state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorPunctuationOverflow success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorPunctuationOverflow page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   richEditorPunctuationOverflow_true_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_PUNCTUATIONOVERFLOW_TRUE_0100
     * @tc.desc   Test RichEditor punctuationOverflow property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorPunctuationOverflow_true_0100', Level.LEVEL0, async () => {
      console.info('[richEditorPunctuationOverflow_true_0100] START');

      let strJson: string = getInspectorByKey('richEditor_punctuationOverflow_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[richEditorPunctuationOverflow_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[richEditorPunctuationOverflow_true_0100] punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual('true');
      console.info('[richEditorPunctuationOverflow_true_0100] END');
    })

    /**
     * @tc.name   richEditorPunctuationOverflow_false_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_PUNCTUATIONOVERFLOW_FALSE_0100
     * @tc.desc   Test RichEditor punctuationOverflow property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorPunctuationOverflow_false_0100', Level.LEVEL0, async () => {
      console.info('[richEditorPunctuationOverflow_false_0100] START');

      let strJson: string = getInspectorByKey('richEditor_punctuationOverflow_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[richEditorPunctuationOverflow_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[richEditorPunctuationOverflow_false_0100] punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual('false');
      console.info('[richEditorPunctuationOverflow_false_0100] END');
    })

    /**
     * @tc.name   richEditorPunctuationOverflow_null_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_PUNCTUATIONOVERFLOW_NULL_0100
     * @tc.desc   Test RichEditor punctuationOverflow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorPunctuationOverflow_null_0100', Level.LEVEL0, async () => {
      console.info('[richEditorPunctuationOverflow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('richEditor_punctuationOverflow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('richEditor_punctuationOverflow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[richEditorPunctuationOverflow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[richEditorPunctuationOverflow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[richEditorPunctuationOverflow_null_0100] default punctuationOverflow is: " + objCompare.$attrs.punctuationOverflow);
      console.info("[richEditorPunctuationOverflow_null_0100] null punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual(objCompare.$attrs.punctuationOverflow);
      console.info('[richEditorPunctuationOverflow_null_0100] END');
    })

    /**
     * @tc.name   richEditorPunctuationOverflow_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_PUNCTUATIONOVERFLOW_UNDEFINED_0100
     * @tc.desc   Test RichEditor punctuationOverflow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorPunctuationOverflow_undefined_0100', Level.LEVEL0, async () => {
      console.info('[richEditorPunctuationOverflow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('richEditor_punctuationOverflow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('richEditor_punctuationOverflow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[richEditorPunctuationOverflow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[richEditorPunctuationOverflow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[richEditorPunctuationOverflow_undefined_0100] default punctuationOverflow is: " + objCompare.$attrs.punctuationOverflow);
      console.info("[richEditorPunctuationOverflow_undefined_0100] undefined punctuationOverflow is: " + obj.$attrs.punctuationOverflow);

      expect(obj.$attrs.punctuationOverflow).assertEqual(objCompare.$attrs.punctuationOverflow);
      console.info('[richEditorPunctuationOverflow_undefined_0100] END');
    })

  })
}