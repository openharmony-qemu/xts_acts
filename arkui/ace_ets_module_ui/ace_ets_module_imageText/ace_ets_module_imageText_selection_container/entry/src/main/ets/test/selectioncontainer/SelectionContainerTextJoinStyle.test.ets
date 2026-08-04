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

export default function SelectionContainerTextJoinStyleTest() {
  describe('SelectionContainerTextJoinStyleTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerTextJoinStyleTest] beforeAll called');
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerTextJoinStyleTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerTextJoinStyle'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerTextJoinStyle" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerTextJoinStyleTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerTextJoinStyleTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerTextJoinStyleTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerTextJoinStyleDefault_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_TEXTJOINSTYLE_PARAM_0100
     * @tc.desc   Test SelectionContainer textJoinStyle default value is NEWLINE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerTextJoinStyleDefault_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerTextJoinStyleDefault_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_joinstyle_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerTextJoinStyleDefault_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textJoinStyle).not().assertUndefined();
      expect(obj.$attrs.textJoinStyle).assertEqual('NEWLINE');
      console.info('[selectionContainerTextJoinStyleDefault_0100] END');
    });

    /**
     * @tc.name   selectionContainerTextJoinStyleNewline_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_TEXTJOINSTYLE_PARAM_0200
     * @tc.desc   Test SelectionContainer textJoinStyle with NEWLINE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerTextJoinStyleNewline_0200', Level.LEVEL0, async () => {
      console.info('[selectionContainerTextJoinStyleNewline_0200] START');
      let strJson: string = getInspectorByKey('selectioncontainer_joinstyle_newline');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerTextJoinStyleNewline_0200] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textJoinStyle).not().assertUndefined();
      expect(obj.$attrs.textJoinStyle).assertEqual('NEWLINE');
      console.info('[selectionContainerTextJoinStyleNewline_0200] END');
    });

    /**
     * @tc.name   selectionContainerTextJoinStyleDirect_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_TEXTJOINSTYLE_PARAM_0300
     * @tc.desc   Test SelectionContainer textJoinStyle with DIRECT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerTextJoinStyleDirect_0300', Level.LEVEL0, async () => {
      console.info('[selectionContainerTextJoinStyleDirect_0300] START');
      let strJson: string = getInspectorByKey('selectioncontainer_joinstyle_direct');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerTextJoinStyleDirect_0300] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textJoinStyle).not().assertUndefined();
      expect(obj.$attrs.textJoinStyle).assertEqual('DIRECT');
      console.info('[selectionContainerTextJoinStyleDirect_0300] END');
    });

    /**
     * @tc.name   selectionContainerTextJoinStyleNull_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_TEXTJOINSTYLE_PARAM_0400
     * @tc.desc   Test SelectionContainer textJoinStyle with null restores default value NEWLINE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerTextJoinStyleNull_0400', Level.LEVEL0, async () => {
      console.info('[selectionContainerTextJoinStyleNull_0400] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_joinstyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_joinstyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerTextJoinStyleNull_0400] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textJoinStyle).not().assertUndefined();
      expect(obj.$attrs.textJoinStyle).assertEqual(objCompare.$attrs.textJoinStyle);
      console.info('[selectionContainerTextJoinStyleNull_0400] END');
    });

    /**
     * @tc.name   selectionContainerTextJoinStyleUndefined_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_TEXTJOINSTYLE_PARAM_0500
     * @tc.desc   Test SelectionContainer textJoinStyle with undefined restores default value NEWLINE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerTextJoinStyleUndefined_0500', Level.LEVEL0, async () => {
      console.info('[selectionContainerTextJoinStyleUndefined_0500] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_joinstyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_joinstyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerTextJoinStyleUndefined_0500] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textJoinStyle).not().assertUndefined();
      expect(obj.$attrs.textJoinStyle).assertEqual(objCompare.$attrs.textJoinStyle);
      console.info('[selectionContainerTextJoinStyleUndefined_0500] END');
    });
  });
}
