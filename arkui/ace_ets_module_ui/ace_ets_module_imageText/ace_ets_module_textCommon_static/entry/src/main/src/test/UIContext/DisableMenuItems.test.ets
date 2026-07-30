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
import { TextMenuController } from '@ohos.arkui.UIContext';

export default function DisableMenuItemsTest() {
  describe('DisableMenuItemsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DisableMenuItemsTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.textCommon.static', 'EntryAbility');
      await UtilsTest.msSleep(2000);
      console.info('DisableMenuItemsTest beforeAll end');
    });

    beforeEach(async (): Promise<void> => {
      console.info('DisableMenuItemsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/DisableMenuItems',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('DisableMenuItemsTest state pages: ' + JSON.stringify(pages));
        if (!('DisableMenuItems' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('push DisableMenuItemsTest page error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('DisableMenuItemsTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      TextMenuController.disableMenuItems([]);
      await CommonFunc.sleep(1000);
      console.info('DisableMenuItemsTest afterEach called, environment restored');
    });

    /**
     * @tc.name   disableMenuItems_0100
     * @tc.number SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_PARAM_0100
     * @tc.desc   Test disableMenuItems with single item SEARCH, SEARCH menu option should not exist in popup
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('disableMenuItems_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[disableMenuItems_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        done();
        return;
      }

      let btnDisableSearch = await driver.findComponent(ON.id('btn_disable_search'));
      if (btnDisableSearch === null) {
        expect().assertFail();
        console.error('[disableMenuItems_0100] btn_disable_search not found');
        done();
        return;
      }
      await (btnDisableSearch?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let textInput = await driver.findComponent(ON.id('text_input_select'));
      if (textInput === null) {
        expect().assertFail();
        console.error('[disableMenuItems_0100] text_input_select not found');
        done();
        return;
      }
      await (textInput?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);

      let searchMenu = await driver.waitForComponent(ON.text('search_menu_test'), 2000);
      expect(searchMenu === null).assertTrue();
      console.info('[disableMenuItems_0100] search_menu_test not found after disable: PASS');

      let translateMenu = await driver.waitForComponent(ON.text('translate_menu_test'), 2000);
      if (translateMenu !== null) {
        console.info('[disableMenuItems_0100] translate_menu_test found, TRANSLATE not disabled: expected');
      }

      await (textInput?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let externalArea = await driver.findComponent(ON.id('external_touch_area'));
      if (externalArea !== null) {
        await (externalArea?.click() as Promise<void>);
        await CommonFunc.sleep(500);
      }

      console.info('[disableMenuItems_0100] END');
      done();
    });

    /**
     * @tc.name   disableMenuItems_0200
     * @tc.number SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_PARAM_0200
     * @tc.desc   Test disableMenuItems with multiple items SEARCH and TRANSLATE, both should not exist in popup
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('disableMenuItems_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[disableMenuItems_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        done();
        return;
      }

      let btnDisableBoth = await driver.findComponent(ON.id('btn_disable_both'));
      if (btnDisableBoth === null) {
        expect().assertFail();
        console.error('[disableMenuItems_0200] btn_disable_both not found');
        done();
        return;
      }
      await (btnDisableBoth?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let textInput = await driver.findComponent(ON.id('text_input_select'));
      if (textInput === null) {
        expect().assertFail();
        console.error('[disableMenuItems_0200] text_input_select not found');
        done();
        return;
      }
      await (textInput?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);

      let searchMenu = await driver.waitForComponent(ON.text('search_menu_test'), 2000);
      expect(searchMenu === null).assertTrue();
      console.info('[disableMenuItems_0200] search_menu_test not found after disable: PASS');

      let translateMenu = await driver.waitForComponent(ON.text('translate_menu_test'), 2000);
      expect(translateMenu === null).assertTrue();
      console.info('[disableMenuItems_0200] translate_menu_test not found after disable: PASS');

      let externalArea = await driver.findComponent(ON.id('external_touch_area'));
      if (externalArea !== null) {
        await (externalArea?.click() as Promise<void>);
        await CommonFunc.sleep(500);
      }

      console.info('[disableMenuItems_0200] END');
      done();
    });
  });
}
