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

import { describe, beforeAll, beforeEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 500;

export default function AddFormMenuItemTest(): void {
  describe('AddFormMenuItemTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('AddFormMenuItemTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('AddFormMenuItemTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Coverage/AddFormMenuItemPage',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages.name !== 'AddFormMenuItemPage') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('AddFormMenuItemTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterAll(() => {
      AppStorage.delete('formMenu_page_ready');
      AppStorage.delete('formMenu_built');
      AppStorage.delete('formMenu_callback_code');
      AppStorage.delete('formMenu_callback_id');
    });

    /**
     * @tc.name   SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0100
     * @tc.number SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0100
     * @tc.desc   Test AddFormMenuItem page loads and marks ready
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[addFormMenuItem_page_ready_0100] START');
      await CommonFunc.sleep(SLEEP_TIME);
      let ready: string | undefined = AppStorage.get<string>('formMenu_page_ready');
      expect(ready).assertEqual('ready');
      let strJson = inspector.getInspectorByKey('formMenu_title');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('AddFormMenuItem');
      console.info('[addFormMenuItem_page_ready_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0200
     * @tc.number SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0200
     * @tc.desc   Test AddFormMenuItem bindMenu with AddFormOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[addFormMenuItem_with_options_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_formMenu_with_options'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = inspector.getInspectorByKey('btn_formMenu_with_options');
      expect(strJson.length > 0).assertTrue();
      console.info('[addFormMenuItem_with_options_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0300
     * @tc.number SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0300
     * @tc.desc   Test AddFormMenuItem with undefined AddFormOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_FORMMENU_ADDFORMMENUITEM_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[addFormMenuItem_undefined_options_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_formMenu_undefined_options'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let markBtn = await driver.findComponent(ON.id('btn_formMenu_mark_built'));
      await (markBtn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(AppStorage.get<string>('formMenu_built')).assertEqual('ok');
      console.info('[addFormMenuItem_undefined_options_0100] END');
      done();
    });
  });
}
