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
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { DialogDisplayMode } from '@ohos.arkui.component';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/dialogSystemMaterial/BaseDialogOptionsDisplayModeInSubWindow';
const PAGE_NAME = 'BaseDialogOptionsDisplayModeInSubWindow';

async function clickById(driver: Driver, id: string): Promise<void> {
  let button: Component = (await driver.findComponent(ON.id(id))) as Component;
  await (button?.click() as Promise<void>);
}

async function clickByText(driver: Driver, text: string): Promise<void> {
  let target: Component = (await driver.findComponent(ON.text(text))) as Component;
  await (target?.click() as Promise<void>);
}

async function navigatePage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== PAGE_NAME) {
    routerInstance.replaceUrl({ url: PAGE_URL });
    await CommonFunc.sleep(SLEEP_TIME);
  }
}

export default function BaseDialogOptionsDisplayModeInSubWindowTest(): void {
  describe('BaseDialogOptionsDisplayModeInSubWindowTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.popup.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      await navigatePage();
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    /**
     * @tc.name   BaseDialogOptionsDisplayModeInSubWindow_DialogDisplayMode_0100
     * @tc.number SUB_ARKUI_API_DisplayModeInSubWindow_DialogDisplayMode_0100
     * @tc.desc   Test DialogDisplayMode.SCREEN_BASED enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BaseDialogOptionsDisplayModeInSubWindow_DialogDisplayMode_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('BaseDialogOptionsDisplayModeInSubWindow_DialogDisplayMode_0100 START');
        expect(DialogDisplayMode.SCREEN_BASED).assertEqual(0);
        done();
      });

    /**
     * @tc.name   BaseDialogOptionsDisplayModeInSubWindow_DialogDisplayMode_0200
     * @tc.number SUB_ARKUI_API_DisplayModeInSubWindow_DialogDisplayMode_0200
     * @tc.desc   Test DialogDisplayMode.WINDOW_BASED enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BaseDialogOptionsDisplayModeInSubWindow_DialogDisplayMode_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('BaseDialogOptionsDisplayModeInSubWindow_DialogDisplayMode_0200 START');
        expect(DialogDisplayMode.WINDOW_BASED).assertEqual(1);
        done();
      });

    /**
     * @tc.name   BaseDialogOptionsDisplayModeInSubWindow_Menu_0300
     * @tc.number SUB_ARKUI_API_DisplayModeInSubWindow_Menu_0300
     * @tc.desc   Test openCustomDialog with showInSubWindow=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BaseDialogOptionsDisplayModeInSubWindow_Menu_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('BaseDialogOptionsDisplayModeInSubWindow_Menu_0300 START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'trueBtn');
        await CommonFunc.sleep(SLEEP_TIME);
        await clickByText(driver, '弹窗SCREEN_BASED');
        await CommonFunc.sleep(SLEEP_TIME);
        let confirmBtn = await driver.findComponent(ON.text('确认'));
        expect(!!confirmBtn).assertEqual(true);
        await clickByText(driver, '确认');
        await CommonFunc.sleep(SLEEP_TIME);
        await clickByText(driver, '弹窗WINDOW_BASED');
        await CommonFunc.sleep(SLEEP_TIME);
        confirmBtn = await driver.findComponent(ON.text('确认'));
        expect(!!confirmBtn).assertEqual(true);
        await clickByText(driver, '确认');
        done();
      });

    /**
     * @tc.name   BaseDialogOptionsDisplayModeInSubWindow_Menu_0400
     * @tc.number SUB_ARKUI_API_DisplayModeInSubWindow_Menu_0400
     * @tc.desc   Test openCustomDialog with showInSubWindow=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BaseDialogOptionsDisplayModeInSubWindow_Menu_0400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('BaseDialogOptionsDisplayModeInSubWindow_Menu_0400 START');
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'falseBtn');
        await CommonFunc.sleep(SLEEP_TIME);
        await clickByText(driver, '弹窗SCREEN_BASED');
        await CommonFunc.sleep(SLEEP_TIME);
        let confirmBtn = await driver.findComponent(ON.text('确认'));
        expect(!!confirmBtn).assertEqual(true);
        await clickByText(driver, '确认');
        await CommonFunc.sleep(SLEEP_TIME);
        await clickByText(driver, '弹窗WINDOW_BASED');
        await CommonFunc.sleep(SLEEP_TIME);
        confirmBtn = await driver.findComponent(ON.text('确认'));
        expect(!!confirmBtn).assertEqual(true);
        await clickByText(driver, '确认');
        done();
      });
  });
}
