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

export default function SelectionContainerBindSelectionMenuTest() {
  describe('SelectionContainerBindSelectionMenuTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerBindSelectionMenuTest] beforeAll called');
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerBindSelectionMenuTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerBindSelectionMenu'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerBindSelectionMenu" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerBindSelectionMenuTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   selectionContainerBindSelectionMenu_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_BINDSELECTIONMENU_0100
     * @tc.desc   Test SelectionContainer bindSelectionMenu selectionContainerMenuOptions, null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerBindSelectionMenu_0100', Level.LEVEL2, async () => {
      console.info('[selectionContainerBindSelectionMenu_0100] START');
      let driver = Driver.create();
      await Utils.sleep(300);
      let component = await driver.findComponent(ON.id('selectioncontainer_selectionContainerMenuOptions_null'));
      expect(component).not().assertUndefined();
      await component.longClick();
      let onAppearstrJson: string = getInspectorByKey('selectioncontainer_onAppearText');
      let onDisappearstrJson: string = getInspectorByKey('selectioncontainer_onDisappearText');
      let onMenuShowstrJson: string = getInspectorByKey('selectioncontainer_onMenuShowText');
      let onMenuHidestrJson: string = getInspectorByKey('selectioncontainer_onMenuHideText');
      let onAppearobj: Record<string, ESObject> = JSON.parse(onAppearstrJson);
      let onDisappearobj: Record<string, ESObject> = JSON.parse(onDisappearstrJson);
      let onMenuShowobj: Record<string, ESObject> = JSON.parse(onMenuShowstrJson);
      let onMenuHideobj: Record<string, ESObject> = JSON.parse(onMenuHidestrJson);
      console.info('[selectionContainerBindSelectionMenu_0100] obj is: ' + JSON.stringify(onAppearobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0100] obj is: ' + JSON.stringify(onDisappearobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0100] obj is: ' + JSON.stringify(onMenuShowobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0100] obj is: ' + JSON.stringify(onMenuHideobj.$attrs.content));
      expect(onAppearobj.$attrs.content).assertEqual('');
      expect(onDisappearobj.$attrs.content).assertEqual('');
      expect(onMenuShowobj.$attrs.content).assertEqual('');
      expect(onMenuHideobj.$attrs.content).assertEqual('');
      console.info('[selectionContainerBindSelectionMenu_0100] END');
    });

    /**
     * @tc.name   selectionContainerBindSelectionMenu_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_BINDSELECTIONMENU_0200
     * @tc.desc   Test SelectionContainer bindSelectionMenu selectionContainerMenuOptions, undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerBindSelectionMenu_0200', Level.LEVEL2, async () => {
      console.info('[selectionContainerBindSelectionMenu_0200] START');
      let driver = Driver.create();
      await Utils.sleep(300);
      let component = await driver.findComponent(ON.id('selectioncontainer_selectionContainerMenuOptions_undefined'));
      expect(component).not().assertUndefined();
      await component.longClick();
      let onAppearstrJson: string = getInspectorByKey('selectioncontainer_onAppearText');
      let onDisappearstrJson: string = getInspectorByKey('selectioncontainer_onDisappearText');
      let onMenuShowstrJson: string = getInspectorByKey('selectioncontainer_onMenuShowText');
      let onMenuHidestrJson: string = getInspectorByKey('selectioncontainer_onMenuHideText');
      let onAppearobj: Record<string, ESObject> = JSON.parse(onAppearstrJson);
      let onDisappearobj: Record<string, ESObject> = JSON.parse(onDisappearstrJson);
      let onMenuShowobj: Record<string, ESObject> = JSON.parse(onMenuShowstrJson);
      let onMenuHideobj: Record<string, ESObject> = JSON.parse(onMenuHidestrJson);
      console.info('[selectionContainerBindSelectionMenu_0200] obj is: ' + JSON.stringify(onAppearobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0200] obj is: ' + JSON.stringify(onDisappearobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0200] obj is: ' + JSON.stringify(onMenuShowobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0200] obj is: ' + JSON.stringify(onMenuHideobj.$attrs.content));
      expect(onAppearobj.$attrs.content).assertEqual('');
      expect(onDisappearobj.$attrs.content).assertEqual('');
      expect(onMenuShowobj.$attrs.content).assertEqual('');
      expect(onMenuHideobj.$attrs.content).assertEqual('');
      console.info('[selectionContainerBindSelectionMenu_0200] END');
    });

    /**
     * @tc.name   selectionContainerBindSelectionMenu_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_BINDSELECTIONMENU_0300
     * @tc.desc   Test SelectionContainer bindSelectionMenu selectionContainerMenuOptions, callback true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerBindSelectionMenu_0300', Level.LEVEL2, async () => {
      console.info('[selectionContainerBindSelectionMenu_0300] START');
      let driver = Driver.create();
      await Utils.sleep(300);
      let component = await driver.findComponent(ON.id('selectioncontainer_bindselectionmenu'));
      expect(component).not().assertUndefined();
      await component.longClick();
      try {
        let menuText = await driver.findComponent(ON.text('Custom Selection Menu'));
        expect(menuText).not().assertUndefined();
        console.info('[selectionContainerBindSelectionMenuLongPress_0200] menu found');
      } catch (e) {
        console.error('[selectionContainerBindSelectionMenuLongPress_0200] menu not found: ' + JSON.stringify(e));
        expect(true).assertFalse();
      }
      await Utils.sleep(300);
      let outSideText = await driver.findComponent(ON.id('selectioncontainer_outside_area'));
      await outSideText.longClick();
      await Utils.sleep(300);
      let onAppearstrJson: string = getInspectorByKey('selectioncontainer_onAppearText');
      let onDisappearstrJson: string = getInspectorByKey('selectioncontainer_onDisappearText');
      let onMenuShowstrJson: string = getInspectorByKey('selectioncontainer_onMenuShowText');
      let onMenuHidestrJson: string = getInspectorByKey('selectioncontainer_onMenuHideText');
      let onAppearobj: Record<string, ESObject> = JSON.parse(onAppearstrJson);
      let onDisappearobj: Record<string, ESObject> = JSON.parse(onDisappearstrJson);
      let onMenuShowobj: Record<string, ESObject> = JSON.parse(onMenuShowstrJson);
      let onMenuHideobj: Record<string, ESObject> = JSON.parse(onMenuHidestrJson);
      console.info('[selectionContainerBindSelectionMenu_0300] obj is: ' + JSON.stringify(onAppearobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0300] obj is: ' + JSON.stringify(onDisappearobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0300] obj is: ' + JSON.stringify(onMenuShowobj.$attrs.content));
      console.info('[selectionContainerBindSelectionMenu_0300] obj is: ' + JSON.stringify(onMenuHideobj.$attrs.content));
      expect(onAppearobj.$attrs.content).assertEqual('true');
      expect(onDisappearobj.$attrs.content).assertEqual('true');
      expect(onMenuShowobj.$attrs.content).assertEqual('true');
      expect(onMenuHideobj.$attrs.content).assertEqual('true');
      console.info('[selectionContainerBindSelectionMenu_0300] END');
    });

    /**
     * @tc.name   selectionContainerBindSelectionMenu_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_BINDSELECTIONMENU_0400
     * @tc.desc   Test SelectionContainer bindSelectionMenu, all null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerBindSelectionMenu_0400', Level.LEVEL2, async () => {
      console.info('[selectionContainerBindSelectionMenu_0400] START');
      let strJson: string = getInspectorByKey('selectioncontainer_bindselectionmenu_null');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
 	    console.info('[selectionContainerBindSelectionMenu_0100] obj is: ' + JSON.stringify(obj.$attrs));
 	    expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerBindSelectionMenu_0400] END');
    });

    /**
     * @tc.name   selectionContainerBindSelectionMenu_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_BINDSELECTIONMENU_0500
     * @tc.desc   Test SelectionContainer bindSelectionMenu, all undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionContainerBindSelectionMenu_0500', Level.LEVEL2, async () => {
      console.info('[selectionContainerBindSelectionMenu_0500] START');
      let strJson: string = getInspectorByKey('selectioncontainer_bindselectionmenu_undefined');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
 	    console.info('[selectionContainerBindSelectionMenu_0500] obj is: ' + JSON.stringify(obj.$attrs));
 	    expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerBindSelectionMenu_0500] END');
    });
  });
}
