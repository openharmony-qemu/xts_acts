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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils';

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

async function assertTextId(textId: string, expected: string): Promise<void> {
  let driver = Driver.create();
  let textComp = await driver.findComponent(ON.id(textId));
  expect(!!textComp).assertTrue();
  if (textComp) {
    let actual = await textComp.getText();
    expect(actual).assertEqual(expected);
  }
}

async function assertTextIdContains(textId: string, fragment: string): Promise<void> {
  let driver = Driver.create();
  let textComp = await driver.findComponent(ON.id(textId));
  expect(!!textComp).assertTrue();
  if (textComp) {
    let actual = await textComp.getText();
    expect(actual.indexOf(fragment)).assertLarger(-1);
  }
}


async function pushPage(): Promise<void> {
  let options: router.RouterOptions = { url: PAGE_URL };
  router.clear();
  let pages = router.getState();
  if (pages.name !== PAGE_NAME) {
    await router.pushUrl(options);
  }
  await Utils.sleep(SLEEP_MS);
}

export default function BindContextMenuByIsShowNullUndefinedTest(): void {
  describe('BindContextMenuByIsShowNullUndefinedTest', () => {
    beforeEach(async (): Promise<void> => {
      await pushPage();
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
    it('SUB_ARKUI_MENU_BCMByIsShow_content_null_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('BindContextMenuByIsShowNullUndefined_btnContentNull_01'));
      expect(!!button).assertTrue();
      if (button) {
        await button.click();
      }
      await Utils.sleep(SLEEP_MS);
      await assertTextIdContains('BindContextMenuByIsShowNullUndefined_txtContentNull_01', 'SUCCESS');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_content_undefined_0200
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_content_undefined_0200
     * @tc.desc   bindContextMenuByIsShow content parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_content_undefined_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('BindContextMenuByIsShowNullUndefined_btnContentUndefined_01'));
      expect(!!button).assertTrue();
      if (button) {
        await button.click();
      }
      await Utils.sleep(SLEEP_MS);
      await assertTextIdContains('BindContextMenuByIsShowNullUndefined_txtContentUndefined_01', 'SUCCESS');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_options_null_0300
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_options_null_0300
     * @tc.desc   bindContextMenuByIsShow options parameter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_options_null_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      await clickShowAndDismissMenu('BindContextMenuByIsShowNullUndefined_btnOptionsNull_01');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_options_undefined_0400
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_options_undefined_0400
     * @tc.desc   bindContextMenuByIsShow options parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_options_undefined_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      await clickShowAndDismissMenu('BindContextMenuByIsShowNullUndefined_btnOptionsUndefined_01');
      done();
    });
  });
}
