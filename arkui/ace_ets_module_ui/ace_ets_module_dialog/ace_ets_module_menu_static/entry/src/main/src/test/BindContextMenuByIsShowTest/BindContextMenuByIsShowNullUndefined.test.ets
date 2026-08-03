'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const PAGE_URL = 'MainAbility/pages/bindContextMenuByIsShow/BindContextMenuByIsShowNullUndefined';
const PAGE_NAME = 'BindContextMenuByIsShowNullUndefinedIndex';

const SLEEP_MS = 1500;
const DISMISS_SLEEP_MS = 2000;
const MENU_ITEM_TEXT = '菜单选项1';

async function clickShowAndDismiss(btnId: string): Promise<void> {
  let driver = Driver.create();
  let btn = await driver.findComponent(ON.id(btnId));
  expect(!!btn).assertTrue();
  if (btn) {
    await btn.click();
  }
  await Utils.sleep(DISMISS_SLEEP_MS);
  let menuItem = await driver.findComponent(ON.text(MENU_ITEM_TEXT));
  expect(menuItem !== undefined).assertTrue();
  if (menuItem) {
    await menuItem.click();
  }
  await Utils.sleep(DISMISS_SLEEP_MS);
}

async function clickShowAndDismissMenu(btnId: string): Promise<void> {
  await clickShowAndDismiss(btnId);
}

function assertTextKey(key: string, expected: string): void {
  let node = JSON.parseJsonElement(inspector.getInspectorByKey(key));
  expect(node.getElement('$attrs').getString('content')).assertEqual(expected);
}

function assertTextContains(key: string, fragment: string): void {
  let node = JSON.parseJsonElement(inspector.getInspectorByKey(key));
  expect(node.getElement('$attrs').getString('content').indexOf(fragment)).assertLarger(-1);
}

async function navigatePage(): Promise<void> {
  let options: router.RouterOptions = { url: PAGE_URL };
  try {
    const routerInstance = AppStorage.get<Router>('router') as Router;
    let pages = routerInstance.getState();
    if (pages.name !== PAGE_NAME) {
      routerInstance.replaceUrl(options);
    }
    await Utils.sleep(SLEEP_MS);
  } catch (err) {
    expect().assertFail();
  }
}

export default function BindContextMenuByIsShowNullUndefinedTest(): void {
  describe('BindContextMenuByIsShowNullUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.menu.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      await navigatePage();
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(2000);
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_content_null_0100
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_content_null_0100
     * @tc.desc   bindContextMenuByIsShow content parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_content_null_0100', Level.LEVEL1, async () => {
      await navigatePage();
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('BindContextMenuByIsShowNullUndefined_btnContentNull_01'));
      expect(!!button).assertTrue();
      if (button) {
        await button.click();
      }
      await Utils.sleep(SLEEP_MS);
      let node = JSON.parseJsonElement(inspector.getInspectorByKey('BindContextMenuByIsShowNullUndefined_txtContentNull_01'));
      expect(node.getElement('$attrs').getString('content')).assertContain('SUCCESS');
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_content_undefined_0200
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_content_undefined_0200
     * @tc.desc   bindContextMenuByIsShow content parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_content_undefined_0200', Level.LEVEL1, async () => {
      await navigatePage();
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('BindContextMenuByIsShowNullUndefined_btnContentUndefined_01'));
      expect(!!button).assertTrue();
      if (button) {
        await button.click();
      }
      await Utils.sleep(SLEEP_MS);
      let node = JSON.parseJsonElement(inspector.getInspectorByKey('BindContextMenuByIsShowNullUndefined_txtContentUndefined_01'));
      expect(node.getElement('$attrs').getString('content')).assertContain('SUCCESS');
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_options_null_0300
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_options_null_0300
     * @tc.desc   bindContextMenuByIsShow options parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_options_null_0300', Level.LEVEL1, async () => {
      await navigatePage();
      await clickShowAndDismissMenu('BindContextMenuByIsShowNullUndefined_btnOptionsNull_01');
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_options_undefined_0400
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_options_undefined_0400
     * @tc.desc   bindContextMenuByIsShow options parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_options_undefined_0400', Level.LEVEL1, async () => {
      await navigatePage();
      await clickShowAndDismissMenu('BindContextMenuByIsShowNullUndefined_btnOptionsUndefined_01');
    });
  });
}
