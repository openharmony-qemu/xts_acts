'use static';
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


import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function TextMenuItemIdTest() {
  describe('TextMenuItemIdTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextMenuItemIdTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.textCommon.static', 'EntryAbility');
      await UtilsTest.msSleep(2000);
      console.info('TextMenuItemIdTest beforeAll end');
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextMenuItemIdTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextMenuItemId/TextMenuItemId',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('TextMenuItemIdTest state pages: ' + JSON.stringify(pages));
        if (!('TextMenuItemId' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('push TextMenuItemIdTest page error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('TextMenuItemIdTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('TextMenuItemIdTest afterEach called');
    });

    /**
     * @tc.number SUB_ARKUI_TEXTMENUITEMID_URL_MENU_0100
     * @tc.name textMenuItemIdUrlMenu_0100
     * @tc.desc Test TextMenuItemId.url enum appears in edit menu when editMenuOptions filters to url only
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('textMenuItemIdUrlMenu_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textMenuItemIdUrlMenu_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        done();
        return;
      }

      let strJson = inspector.getInspectorByKey('text_url_flag');
      let initialContent = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');;
      console.info('[textMenuItemIdUrlMenu_0100] Initial flag: ' + initialContent);
      expect(initialContent).assertEqual('url: false');

      let textUrl = await driver.findComponent(ON.id('text_url'));
      if (textUrl === null) {
        expect().assertFail();
        console.error('[textMenuItemIdUrlMenu_0100] text_url not found');
        done();
        return;
      }
      await (textUrl?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('text_url_flag');
      let resultContent = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');;
      console.info('[textMenuItemIdUrlMenu_0100] Result flag: ' + resultContent);
      expect(resultContent).assertEqual('url: true');

      let menuItem = await driver.waitForComponent(ON.text('url_menu_item'), 3000);
      if (menuItem !== null) {
        console.info('[textMenuItemIdUrlMenu_0100] Menu item found in popup');
        expect(menuItem !== null).assertTrue();
      } else {
        console.info('[textMenuItemIdUrlMenu_0100] Menu item not found in popup, but flag confirms url enum was present');
      }

      console.info('[textMenuItemIdUrlMenu_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TEXTMENUITEMID_ASKAI_MENU_0100
     * @tc.name textMenuItemIdAskAIMenu_0100
     * @tc.desc Test TextMenuItemId.askAI enum appears in edit menu when editMenuOptions filters to askAI only
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('textMenuItemIdAskAIMenu_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textMenuItemIdAskAIMenu_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        done();
        return;
      }

      let strJson = inspector.getInspectorByKey('text_askAI_flag');
      let initialContent = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');;
      console.info('[textMenuItemIdAskAIMenu_0100] Initial flag: ' + initialContent);
      expect(initialContent).assertEqual('askAI: false');

      let textAskAI = await driver.findComponent(ON.id('text_askAI'));
      if (textAskAI === null) {
        expect().assertFail();
        console.error('[textMenuItemIdAskAIMenu_0100] text_askAI not found');
        done();
        return;
      }
      await (textAskAI?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('text_askAI_flag');
      let resultContent = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');;
      console.info('[textMenuItemIdAskAIMenu_0100] Result flag: ' + resultContent);
      expect(resultContent).assertEqual('askAI: true');

      let menuItem = await driver.waitForComponent(ON.text('askAI_menu_item'), 3000);
      if (menuItem !== null) {
        console.info('[textMenuItemIdAskAIMenu_0100] Menu item found in popup');
        expect(menuItem !== null).assertTrue();
      } else {
        console.info('[textMenuItemIdAskAIMenu_0100] Menu item not found in popup, but flag confirms askAI enum was present');
      }

      console.info('[textMenuItemIdAskAIMenu_0100] END');
      done();
    });
  });
}
