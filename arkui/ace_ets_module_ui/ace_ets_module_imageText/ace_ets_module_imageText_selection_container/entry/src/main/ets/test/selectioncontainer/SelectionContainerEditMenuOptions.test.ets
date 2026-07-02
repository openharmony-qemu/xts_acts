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

export default function SelectionContainerEditMenuOptionsTest() {
  describe('SelectionContainerEditMenuOptionsTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerEditMenuOptionsTest] beforeAll called');
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerEditMenuOptionsTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerEditMenuOptions'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerEditMenuOptions" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerEditMenuOptionsTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerEditMenuOptionsTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerEditMenuOptionsTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerEditMenuOptions_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_EDITMENUOPTIONS_PARAM_0100
     * @tc.desc   Test SelectionContainer editMenuOptions with valid configuration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEditMenuOptions_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerEditMenuOptions_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_editmenuoptions');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEditMenuOptions_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      expect(obj.$attrs.copyOption).assertEqual('InApp');
      console.info('[selectionContainerEditMenuOptions_0100] END');
    });

    /**
     * @tc.name   selectionContainerEditMenuOptionsNull_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_EDITMENUOPTIONS_PARAM_0200
     * @tc.desc   Test SelectionContainer editMenuOptions with null, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEditMenuOptionsNull_0200', Level.LEVEL0, async () => {
      console.info('[selectionContainerEditMenuOptionsNull_0200] START');
      let strJson: string = getInspectorByKey('selectioncontainer_editmenuoptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEditMenuOptionsNull_0200] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerEditMenuOptionsNull_0200] END');
    });

    /**
     * @tc.name   selectionContainerEditMenuOptionsUndefined_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_EDITMENUOPTIONS_PARAM_0300
     * @tc.desc   Test SelectionContainer editMenuOptions with undefined, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEditMenuOptionsUndefined_0300', Level.LEVEL0, async () => {
      console.info('[selectionContainerEditMenuOptionsUndefined_0300] START');
      let strJson: string = getInspectorByKey('selectioncontainer_editmenuoptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEditMenuOptionsUndefined_0300] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerEditMenuOptionsUndefined_0300] END');
    });
  });
}
