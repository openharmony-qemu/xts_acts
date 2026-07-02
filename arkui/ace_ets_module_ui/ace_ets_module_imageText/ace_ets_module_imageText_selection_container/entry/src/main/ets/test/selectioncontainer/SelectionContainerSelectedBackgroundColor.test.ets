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

export default function SelectionContainerSelectedBackgroundColorTest() {
  describe('SelectionContainerSelectedBackgroundColorTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerSelectedBackgroundColorTest] beforeAll called');
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerSelectedBackgroundColorTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerSelectedBackgroundColor'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerSelectedBackgroundColor" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerSelectedBackgroundColorTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerSelectedBackgroundColorTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerSelectedBackgroundColorTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerSelectedBgColorDefault_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_SELECTEDBGCOLOR_PARAM_0100
     * @tc.desc   Test SelectionContainer selectedBackgroundColor default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerSelectedBgColorDefault_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerSelectedBgColorDefault_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_selectedbgcolor_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerSelectedBgColorDefault_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      console.info('[selectionContainerSelectedBgColorDefault_0100] END');
    });

    /**
     * @tc.name   selectionContainerSelectedBgColorString_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_SELECTEDBGCOLOR_PARAM_0200
     * @tc.desc   Test SelectionContainer selectedBackgroundColor with string type '#33007DFF'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerSelectedBgColorString_0200', Level.LEVEL0, async () => {
      console.info('[selectionContainerSelectedBgColorString_0200] START');
      let strJson: string = getInspectorByKey('selectioncontainer_selectedbgcolor_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerSelectedBgColorString_0200] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      let bgColor: string = obj.$attrs.selectedBackgroundColor as string;
      let isExpected: boolean = bgColor === '#33007DFF' || bgColor.toLowerCase() === '#33007dff';
      expect(isExpected).assertTrue();
      console.info('[selectionContainerSelectedBgColorString_0200] END');
    });

    /**
     * @tc.name   selectionContainerSelectedBgColorEnum_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_SELECTEDBGCOLOR_PARAM_0300
     * @tc.desc   Test SelectionContainer selectedBackgroundColor with Color.Blue enum type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerSelectedBgColorEnum_0300', Level.LEVEL0, async () => {
      console.info('[selectionContainerSelectedBgColorEnum_0300] START');
      let strJson: string = getInspectorByKey('selectioncontainer_selectedbgcolor_color_blue');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerSelectedBgColorEnum_0300] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      let bgColor: string = obj.$attrs.selectedBackgroundColor as string;
      let isBlueColor: boolean = bgColor === '#330000FF' || bgColor.toLowerCase() === '#330000ff';
      expect(isBlueColor).assertTrue();
      console.info('[selectionContainerSelectedBgColorEnum_0300] END');
    });

    /**
     * @tc.name   selectionContainerSelectedBgColorNumber_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_SELECTEDBGCOLOR_PARAM_0400
     * @tc.desc   Test SelectionContainer selectedBackgroundColor with number type 0x33007DFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerSelectedBgColorNumber_0400', Level.LEVEL0, async () => {
      console.info('[selectionContainerSelectedBgColorNumber_0400] START');
      let strJson: string = getInspectorByKey('selectioncontainer_selectedbgcolor_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerSelectedBgColorNumber_0400] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      let bgColor: string = obj.$attrs.selectedBackgroundColor as string;
      let isExpected: boolean = bgColor === '#33007DFF' || bgColor.toLowerCase() === '#33007dff';
      expect(isExpected).assertTrue();
      console.info('[selectionContainerSelectedBgColorNumber_0400] END');
    });

    /**
     * @tc.name   selectionContainerSelectedBgColorNull_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_SELECTEDBGCOLOR_PARAM_0500
     * @tc.desc   Test SelectionContainer selectedBackgroundColor with null restores default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerSelectedBgColorNull_0500', Level.LEVEL0, async () => {
      console.info('[selectionContainerSelectedBgColorNull_0500] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_selectedbgcolor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_selectedbgcolor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerSelectedBgColorNull_0500] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objCompare.$attrs.selectedBackgroundColor);
      console.info('[selectionContainerSelectedBgColorNull_0500] END');
    });

    /**
     * @tc.name   selectionContainerSelectedBgColorUndefined_0600
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_SELECTEDBGCOLOR_PARAM_0600
     * @tc.desc   Test SelectionContainer selectedBackgroundColor with undefined restores default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerSelectedBgColorUndefined_0600', Level.LEVEL0, async () => {
      console.info('[selectionContainerSelectedBgColorUndefined_0600] START');
      let strJsonCompare: string = getInspectorByKey('selectioncontainer_selectedbgcolor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('selectioncontainer_selectedbgcolor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerSelectedBgColorUndefined_0600] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objCompare.$attrs.selectedBackgroundColor);
      console.info('[selectionContainerSelectedBgColorUndefined_0600] END');
    });
  });
}
