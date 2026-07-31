'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

export default function SelectionContainerNormalMenuTest(): void {
  describe('SelectionContainerNormalMenuTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] SelectionContainerNormalMenuTest beforeAll');
      await UtilsTest.startAbility('com.arkui.ace.selectionContainer.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectioncontainer/SelectionContainerNormalMenu'
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages.name !== 'SelectionContainerNormalMenu') {
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] SelectionContainerNormalMenuTest route error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500);
    });

    afterAll(async (): Promise<void> => {
      const routerInstance: Router = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_BIND_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_BIND_0100
     * @tc.desc   bindSelectionMenu + SelectionContainerMenuOptions host exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_BIND_0100', Level.LEVEL1, async (): Promise<void> => {
      let strJson: string = inspector.getInspectorByKey('sc_static_menu_bind');
      expect(strJson).not().assertUndefined();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_EDIT_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_EDIT_0200
     * @tc.desc   editMenuOptions with OnMenuItemClickWithTextCallback host exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_EDIT_0200', Level.LEVEL1, async (): Promise<void> => {
      let strJson: string = inspector.getInspectorByKey('sc_static_menu_edit');
      expect(strJson).not().assertUndefined();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_IDLE_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_IDLE_0300
     * @tc.desc   MenuOptions/EditMenuOptions callback texts idle before interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_MENU_IDLE_0300', Level.LEVEL1, async (): Promise<void> => {
      assertIdleContent('sc_static_menu_onAppear');
      assertIdleContent('sc_static_menu_onDisappear');
      assertIdleContent('sc_static_menu_onMenuShow');
      assertIdleContent('sc_static_menu_onMenuHide');
      assertIdleContent('sc_static_menu_onCreateMenu');
      assertIdleContent('sc_static_menu_onMenuItemClick');
      assertIdleContent('sc_static_menu_onPrepareMenu');
    });
  });
}

function assertIdleContent(key: string): void {
  let strJson: string = inspector.getInspectorByKey(key);
  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('idle');
}
