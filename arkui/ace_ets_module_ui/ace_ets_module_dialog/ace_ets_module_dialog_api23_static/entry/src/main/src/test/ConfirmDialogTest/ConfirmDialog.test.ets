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

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { ThemeColorMode } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

const LOG_CHUNK_SIZE = 500;
const SLEEP_TIME = 1000;

export default function ConfirmDialogTest() {
  describe('ConfirmDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ConfirmDialogTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.select.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ConfirmDialogTest beforeEach start");
      
      // Ensure any open dialogs are closed before starting new test
      try {
        const driver = Driver.create();
        const confirmButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (confirmButton) {
          await (confirmButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
      } catch (err) {
        // Dialog may not be open, ignore error
      }
      
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/confirmDialog/confirmDialog',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] ConfirmDialogTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] ConfirmDialogTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // Clean up AppStorage data
      if (AppStorage.get<string>('confirmDialogTitle') != undefined) {
        AppStorage.delete('confirmDialogTitle');
      }
      if (AppStorage.get<string>('confirmDialogContent') != undefined) {
        AppStorage.delete('confirmDialogContent');
      }
      if (AppStorage.get<string>('confirmDialogCheckTips') != undefined) {
        AppStorage.delete('confirmDialogCheckTips');
      }
      if (AppStorage.get<boolean>('confirmDialogInitialIsChecked') != undefined) {
        AppStorage.delete('confirmDialogInitialIsChecked');
      }
      if (AppStorage.get<string>('confirmDialogPrimaryButtonValue') != undefined) {
        AppStorage.delete('confirmDialogPrimaryButtonValue');
      }
      if (AppStorage.get<boolean>('confirmDialogPrimaryButtonActionCalled') != undefined) {
        AppStorage.delete('confirmDialogPrimaryButtonActionCalled');
      }
      if (AppStorage.get<string>('confirmDialogSecondaryButtonValue') != undefined) {
        AppStorage.delete('confirmDialogSecondaryButtonValue');
      }
      if (AppStorage.get<boolean>('confirmDialogSecondaryButtonActionCalled') != undefined) {
        AppStorage.delete('confirmDialogSecondaryButtonActionCalled');
      }
      if (AppStorage.get<boolean>('confirmDialogThemeSet') != undefined) {
        AppStorage.delete('confirmDialogThemeSet');
      }
      if (AppStorage.get<number>('confirmDialogThemeColorMode') != undefined) {
        AppStorage.delete('confirmDialogThemeColorMode');
      }
      if (AppStorage.get<boolean>('confirmDialogOnCheckedChangeCalled') != undefined) {
        AppStorage.delete('confirmDialogOnCheckedChangeCalled');
      }
      if (AppStorage.get<boolean>('confirmDialogOnCheckedChangeValue') != undefined) {
        AppStorage.delete('confirmDialogOnCheckedChangeValue');
      }
      
      // Ensure any open dialogs are closed after test
      try {
        const driver = Driver.create();
        const confirmButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (confirmButton) {
          await (confirmButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
        const cancelButton = await driver.findComponent(ON.text('Cancel', MatchPattern.EQUALS));
        if (cancelButton) {
          await (cancelButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
      } catch (err) {
        // Dialog may not be open, ignore error
      }
      
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] ConfirmDialogTest after each called");
    });

    /**
     * @tc.number ConfirmDialogTest_001
     * @tc.name confirmDialogTitle
     * @tc.desc Test ConfirmDialog property: title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('confirmDialogTitle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogTitle START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnConfirmDialog1'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('confirmDialogTitle')).assertEqual('Test Title');

        console.info('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogTitle END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogTitle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ConfirmDialogTest_002
     * @tc.name confirmDialogContent
     * @tc.desc Test ConfirmDialog property: content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('confirmDialogContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogContent START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnConfirmDialog2'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('confirmDialogContent')).assertEqual('Test Content');

        console.info('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogContent END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogContent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ConfirmDialogTest_003
     * @tc.name confirmDialogCheckTips
     * @tc.desc Test ConfirmDialog property: checkTips
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('confirmDialogCheckTips', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogCheckTips START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnConfirmDialog3'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<string>('confirmDialogCheckTips')).assertEqual('Do not show again');

        console.info('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogCheckTips END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogCheckTips error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ConfirmDialogTest_004
     * @tc.name confirmDialogIsCheckedTrue
     * @tc.desc Test ConfirmDialog property: isChecked(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('confirmDialogIsCheckedTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogIsCheckedTrue START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnConfirmDialog4'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        expect(AppStorage.get<boolean>('confirmDialogInitialIsChecked')).assertTrue();

        console.info('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogIsCheckedTrue END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ConfirmDialogTest execute: confirmDialogIsCheckedTrue error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
