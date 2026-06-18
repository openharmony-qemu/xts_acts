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

export default function SelectionContainerBindSelectionMenuTest() {
  describe('SelectionContainerBindSelectionMenuTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerBindSelectionMenuTest] beforeAll called');
      driver = Driver.create();
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

    afterEach(async () => {
      console.info('[SelectionContainerBindSelectionMenuTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerBindSelectionMenuTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerBindSelectionMenu_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_BINDSELECTIONMENU_0100
     * @tc.desc   Test SelectionContainer bindSelectionMenu, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerBindSelectionMenu_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerBindSelectionMenu_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_bindselectionmenu');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerBindSelectionMenu_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerBindSelectionMenu_0100] END');
    });

    /**
     * @tc.name   selectionContainerBindSelectionMenuLongPress_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_BINDSELECTIONMENU_0200
     * @tc.desc   Test SelectionContainer bindSelectionMenu, long press to trigger custom menu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('selectionContainerBindSelectionMenuLongPress_0200', Level.LEVEL1, async () => {
      console.info('[selectionContainerBindSelectionMenuLongPress_0200] START');
      let component = await driver.findComponent(ON.id('selectioncontainer_bindselectionmenu'));
      expect(component).not().assertUndefined();
      await component.longClick();
      await Utils.sleep(600);
      try {
        let menuText = await driver.findComponent(ON.text('Custom Selection Menu'));
        expect(menuText).not().assertUndefined();
        console.info('[selectionContainerBindSelectionMenuLongPress_0200] menu found');
      } catch (e) {
        console.error('[selectionContainerBindSelectionMenuLongPress_0200] menu not found: ' + JSON.stringify(e));
        expect(true).assertFalse();
      }
      console.info('[selectionContainerBindSelectionMenuLongPress_0200] END');
    });
  });
}
