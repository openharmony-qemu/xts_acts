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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { ThemeColorMode } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

const LOG_CHUNK_SIZE = 500;

function logLongString(tag: string, longStr: string): void {
  let len = longStr.length;
  let part = 1;
  for (let i = 0; i < len; i += LOG_CHUNK_SIZE) {
    let end = i + LOG_CHUNK_SIZE;
    if (end > len) {
      end = len;
    }
    console.info(`${tag} [${part}] ${longStr.substring(i, end)}`);
    part++;
  }
}

const SLEEP_TIME = 1000;

export default function TipsDialogTest() {
  describe('TipsDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] TipsDialogTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] TipsDialogTest beforeEach start");
      
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
        url: 'MainAbility/pages/tipsDialog/tipsDialog',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] TipsDialogTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "tipsDialog") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] TipsDialogTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // Clean up AppStorage data
      if (AppStorage.get<string>('tipsDialogImageRes') != undefined) {
        AppStorage.delete('tipsDialogImageRes');
      }
      if (AppStorage.get<number>('tipsDialogImageSizeWidth') != undefined) {
        AppStorage.delete('tipsDialogImageSizeWidth');
      }
      if (AppStorage.get<number>('tipsDialogImageSizeHeight') != undefined) {
        AppStorage.delete('tipsDialogImageSizeHeight');
      }
      if (AppStorage.get<string>('tipsDialogTitle') != undefined) {
        AppStorage.delete('tipsDialogTitle');
      }
      if (AppStorage.get<string>('tipsDialogContent') != undefined) {
        AppStorage.delete('tipsDialogContent');
      }
      if (AppStorage.get<string>('tipsDialogCheckTips') != undefined) {
        AppStorage.delete('tipsDialogCheckTips');
      }
      if (AppStorage.get<boolean>('tipsDialogIsChecked') != undefined) {
        AppStorage.delete('tipsDialogIsChecked');
      }
      if (AppStorage.get<boolean>('tipsDialogCheckActionCalled') != undefined) {
        AppStorage.delete('tipsDialogCheckActionCalled');
      }
      if (AppStorage.get<boolean>('tipsDialogOnCheckedChangeCalled') != undefined) {
        AppStorage.delete('tipsDialogOnCheckedChangeCalled');
      }
      if (AppStorage.get<boolean>('tipsDialogOnCheckedChangeValue') != undefined) {
        AppStorage.delete('tipsDialogOnCheckedChangeValue');
      }
      if (AppStorage.get<boolean>('tipsDialogInitialIsChecked') != undefined) {
        AppStorage.delete('tipsDialogInitialIsChecked');
      }
      if (AppStorage.get<number>('tipsDialogThemeColorMode') != undefined) {
        AppStorage.delete('tipsDialogThemeColorMode');
      }
      if (AppStorage.get<boolean>('tipsDialogThemeSet') != undefined) {
        AppStorage.delete('tipsDialogThemeSet');
      }
      if (AppStorage.get<string>('tipsDialogPrimaryButtonValue') != undefined) {
        AppStorage.delete('tipsDialogPrimaryButtonValue');
      }
      if (AppStorage.get<boolean>('tipsDialogPrimaryButtonActionCalled') != undefined) {
        AppStorage.delete('tipsDialogPrimaryButtonActionCalled');
      }
      if (AppStorage.get<string>('tipsDialogSecondaryButtonValue') != undefined) {
        AppStorage.delete('tipsDialogSecondaryButtonValue');
      }
      if (AppStorage.get<boolean>('tipsDialogSecondaryButtonActionCalled') != undefined) {
        AppStorage.delete('tipsDialogSecondaryButtonActionCalled');
      }
      
      // Ensure any open dialogs are closed after test
      try {
        const driver = Driver.create();
        const confirmButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        if (confirmButton) {
          await (confirmButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
        // Also try to close with cancel button if exists
        const cancelButton = await driver.findComponent(ON.text('Cancel', MatchPattern.EQUALS));
        if (cancelButton) {
          await (cancelButton?.click() as Promise<void>);
          await Utils.sleep(300);
        }
      } catch (err) {
        // Dialog may not be open, ignore error
      }
      
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] TipsDialogTest after each called");
    });


    /**
     * @tc.number TipsDialogTest_002
     * @tc.name tipsDialogThemeColorModeSystem
     * @tc.desc Test TipsDialog property: themeColorMode(SYSTEM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogThemeColorModeSystem', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeSystem START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog4'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('tipsDialogThemeColorMode');
        console.info('[ARKUI_NEW] TipsDialogTest: tipsDialogThemeColorModeSystem - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.SYSTEM);

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeSystem END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeSystem error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_003
     * @tc.name tipsDialogThemeColorModeLight
     * @tc.desc Test TipsDialog property: themeColorMode(LIGHT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogThemeColorModeLight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeLight START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog5'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('tipsDialogThemeColorMode');
        console.info('[ARKUI_NEW] TipsDialogTest: tipsDialogThemeColorModeLight - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.LIGHT);

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeLight END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeLight error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsDialogTest_004
     * @tc.name tipsDialogThemeColorModeDark
     * @tc.desc Test TipsDialog property: themeColorMode(DARK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsDialogThemeColorModeDark', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeDark START');
      try {
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnTipsDialog6'));
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        await Utils.sleep(1000);

        const dialogButton = await driver.findComponent(ON.text('Confirm', MatchPattern.EQUALS));
        expect(!!dialogButton).assertTrue();
        await (dialogButton?.click() as Promise<void>);
        await Utils.sleep(500);

        const themeColorMode = AppStorage.get<number>('tipsDialogThemeColorMode');
        console.info('[ARKUI_NEW] TipsDialogTest: tipsDialogThemeColorModeDark - themeColorMode from AppStorage: ' + themeColorMode);
        expect(themeColorMode).assertEqual(ThemeColorMode.DARK);

        console.info('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeDark END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TipsDialogTest execute: tipsDialogThemeColorModeDark error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
