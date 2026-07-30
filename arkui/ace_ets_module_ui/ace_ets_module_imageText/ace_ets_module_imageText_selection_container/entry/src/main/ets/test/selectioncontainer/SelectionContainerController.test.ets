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
import { Driver, ON } from '@ohos.UiTest';

interface OptionsObj {
  uri: string
}

let driver: Driver;

export default function SelectionContainerControllerTest() {
  describe('SelectionContainerControllerTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerControllerTest] beforeAll called');
      
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerControllerTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerController'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerController" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerControllerTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   selectionContainerCloseSelectionMenu_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CLOSESELECTIONMENU_0100
     * @tc.desc   Test closeSelectionMenu when no menu is shown, verify no crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerCloseSelectionMenu_0100', Level.LEVEL2, async () => {
      console.info('[selectionContainerCloseSelectionMenu_0100] START');
      driver = Driver.create();
      await Utils.sleep(300);
      let closeButton = await driver.findComponent(ON.id('button_close_selection_menu'));
      await closeButton.click();
      await Utils.sleep(500);
      let menuHideStrJson: string = getInspectorByKey('text_menuhide_flag');
      let menuHideObj: Record<string, ESObject> = JSON.parse(menuHideStrJson);
      expect(menuHideObj.$attrs.content).assertEqual('menuHide: false');
      console.info('[selectionContainerCloseSelectionMenu_0100] END');
    });

    /**
     * @tc.name   selectionContainerCloseSelectionMenu_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CLOSESELECTIONMENU_0200
     * @tc.desc   Test closeSelectionMenu closes custom menu after long click
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('selectionContainerCloseSelectionMenu_0200', Level.LEVEL1, async () => {
      console.info('[selectionContainerCloseSelectionMenu_0200] START');
      driver = Driver.create();
      await Utils.sleep(300);
      let component = await driver.findComponent(ON.id('selectioncontainer_closemenu'));
      expect(component).not().assertUndefined();
      await component.longClick();
      await Utils.sleep(600);
      try {
        let menuText = await driver.findComponent(ON.text('CustomMenuClose'));
        expect(menuText).not().assertUndefined();
        console.info('[selectionContainerCloseSelectionMenu_0200] menu appeared');
      } catch (e) {
        console.error('[selectionContainerCloseSelectionMenu_0200] menu not found: ' + JSON.stringify(e));
      }
      let closeButton = await driver.findComponent(ON.id('button_close_selection_menu'));
      await closeButton.click();
      await Utils.sleep(500);
      let menuHideStrJson: string = getInspectorByKey('text_menuhide_flag');
      let menuHideObj: Record<string, ESObject> = JSON.parse(menuHideStrJson);
      console.info('[selectionContainerCloseSelectionMenu_0200] menuHide content: ' + JSON.stringify(menuHideObj.$attrs.content));
      expect(menuHideObj.$attrs.content).assertEqual('menuHide: true');
      console.info('[selectionContainerCloseSelectionMenu_0200] END');
    });

    /**
     * @tc.name   selectionContainerClearTextSelection_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CLEARTEXTSELECTION_0300
     * @tc.desc   Test clearTextSelection when no text is selected, verify no crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerClearTextSelection_0300', Level.LEVEL2, async () => {
      console.info('[selectionContainerClearTextSelection_0300] START');
      driver = Driver.create();
      await Utils.sleep(300);
      let clearButton = await driver.findComponent(ON.id('button_clear_text_selection'));
      await clearButton.click();
      await Utils.sleep(500);
      let selectionStrJson: string = getInspectorByKey('text_selection_cleared_flag');
      let selectionObj: Record<string, ESObject> = JSON.parse(selectionStrJson);
      expect(selectionObj.$attrs.content).assertEqual('selectionCleared: false');
      console.info('[selectionContainerClearTextSelection_0300] END');
    });

    /**
     * @tc.name   selectionContainerClearTextSelection_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CLEARTEXTSELECTION_0400
     * @tc.desc   Test clearTextSelection clears text selection and closes menu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('selectionContainerClearTextSelection_0400', Level.LEVEL1, async () => {
      console.info('[selectionContainerClearTextSelection_0400] START');
      driver = Driver.create();
      await Utils.sleep(300);
      let component = await driver.findComponent(ON.id('selectioncontainer_clearselection'));
      expect(component).not().assertUndefined();
      await component.longClick();
      await Utils.sleep(600);
      let clearButton = await driver.findComponent(ON.id('button_clear_text_selection'));
      await clearButton.click();
      await Utils.sleep(500);
      let selectionStrJson: string = getInspectorByKey('text_selection_cleared_flag');
      let selectionObj: Record<string, ESObject> = JSON.parse(selectionStrJson);
      console.info('[selectionContainerClearTextSelection_0400] selectionCleared content: ' + JSON.stringify(selectionObj.$attrs.content));
      expect(selectionObj.$attrs.content).assertEqual('selectionCleared: true');
      let clearMenuHideStrJson: string = getInspectorByKey('text_clear_menuhide_flag');
      let clearMenuHideObj: Record<string, ESObject> = JSON.parse(clearMenuHideStrJson);
      console.info('[selectionContainerClearTextSelection_0400] clearMenuHide content: ' + JSON.stringify(clearMenuHideObj.$attrs.content));
      expect(clearMenuHideObj.$attrs.content).assertEqual('clearMenuHide: true');
      console.info('[selectionContainerClearTextSelection_0400] END');
    });

    /**
     * @tc.name   selectionContainerNullOptions_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CONTROLLER_PARAM_0500
     * @tc.desc   Test SelectionContainer with null options, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerNullOptions_0500', Level.LEVEL2, async () => {
      console.info('[selectionContainerNullOptions_0500] START');
      driver = Driver.create();
      await Utils.sleep(300);
      let strJson: string = getInspectorByKey('selectioncontainer_null_options');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerNullOptions_0500] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerNullOptions_0500] END');
    });

    /**
     * @tc.name   selectionContainerUndefinedOptions_0600
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_CONTROLLER_PARAM_0600
     * @tc.desc   Test SelectionContainer with undefined options, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerUndefinedOptions_0600', Level.LEVEL2, async () => {
      console.info('[selectionContainerUndefinedOptions_0600] START');
      driver = Driver.create();
      await Utils.sleep(300);
      let strJson: string = getInspectorByKey('selectioncontainer_undefined_options');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerUndefinedOptions_0600] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerUndefinedOptions_0600] END');
    });
  });
}
