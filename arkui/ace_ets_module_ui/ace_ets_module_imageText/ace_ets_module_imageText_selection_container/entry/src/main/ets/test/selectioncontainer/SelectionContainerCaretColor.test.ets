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

export default function SelectionContainerCaretColorTest() {
  describe('SelectionContainerCaretColorTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerCaretColorTest] beforeAll called');
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerCaretColorTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerCaretColor'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerCaretColor" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerCaretColorTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerCaretColorTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerCaretColorTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerCaretColorDefault_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CARETCOLOR_PARAM_0100
     * @tc.desc   Test SelectionContainer caretColor default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCaretColorDefault_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerCaretColorDefault_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_caretcolor_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCaretColorDefault_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).not().assertUndefined();
      console.info('[selectionContainerCaretColorDefault_0100] END');
    });

    /**
     * @tc.name   selectionContainerCaretColorEnum_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CARETCOLOR_PARAM_0200
     * @tc.desc   Test SelectionContainer caretColor with Color.Red enum type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCaretColorEnum_0200', Level.LEVEL0, async () => {
      console.info('[selectionContainerCaretColorEnum_0200] START');
      let strJson: string = getInspectorByKey('selectioncontainer_caretcolor_color_red');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCaretColorEnum_0200] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).not().assertUndefined();
      let caretColor: string = obj.$attrs.caretColor as string;
      let isRedColor: boolean = caretColor === '#FFFF0000' || caretColor.toLowerCase() === '#ffff0000';
      expect(isRedColor).assertTrue();
      console.info('[selectionContainerCaretColorEnum_0200] END');
    });

    /**
     * @tc.name   selectionContainerCaretColorString_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CARETCOLOR_PARAM_0300
     * @tc.desc   Test SelectionContainer caretColor with string type '#FF0000'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCaretColorString_0300', Level.LEVEL0, async () => {
      console.info('[selectionContainerCaretColorString_0300] START');
      let strJson: string = getInspectorByKey('selectioncontainer_caretcolor_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCaretColorString_0300] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).not().assertUndefined();
      let caretColor: string = obj.$attrs.caretColor as string;
      let isRedColor: boolean = caretColor === '#FFFF0000' || caretColor.toLowerCase() === '#ffff0000';
      expect(isRedColor).assertTrue();
      console.info('[selectionContainerCaretColorString_0300] END');
    });

    /**
     * @tc.name   selectionContainerCaretColorNumber_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CARETCOLOR_PARAM_0400
     * @tc.desc   Test SelectionContainer caretColor with number type 0xFFFF0000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCaretColorNumber_0400', Level.LEVEL0, async () => {
      console.info('[selectionContainerCaretColorNumber_0400] START');
      let strJson: string = getInspectorByKey('selectioncontainer_caretcolor_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCaretColorNumber_0400] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).not().assertUndefined();
      let caretColor: string = obj.$attrs.caretColor as string;
      let isRedColor: boolean = caretColor === '#FFFF0000' || caretColor.toLowerCase() === '#ffff0000';
      expect(isRedColor).assertTrue();
      console.info('[selectionContainerCaretColorNumber_0400] END');
    });

    /**
     * @tc.name   selectionContainerCaretColorNull_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CARETCOLOR_PARAM_0500
     * @tc.desc   Test SelectionContainer caretColor with null restores default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCaretColorNull_0500', Level.LEVEL0, async () => {
      console.info('[selectionContainerCaretColorNull_0500] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_caretcolor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_caretcolor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCaretColorNull_0500] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).not().assertUndefined();
      expect(obj.$attrs.caretColor).assertEqual(objCompare.$attrs.caretColor);
      console.info('[selectionContainerCaretColorNull_0500] END');
    });

    /**
     * @tc.name   selectionContainerCaretColorUndefined_0600
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CARETCOLOR_PARAM_0600
     * @tc.desc   Test SelectionContainer caretColor with undefined restores default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerCaretColorUndefined_0600', Level.LEVEL0, async () => {
      console.info('[selectionContainerCaretColorUndefined_0600] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_caretcolor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_caretcolor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerCaretColorUndefined_0600] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.caretColor).not().assertUndefined();
      expect(obj.$attrs.caretColor).assertEqual(objCompare.$attrs.caretColor);
      console.info('[selectionContainerCaretColorUndefined_0600] END');
    });
  });
}
