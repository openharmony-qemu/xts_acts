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

import { describe, it, expect, beforeAll, beforeEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const PAGE_URL = 'MainAbility/pages/OverlayManager/OverlayManagerIndex';
const WAIT_TIME = 1000;

async function clickById(driver: Driver, id: string): Promise<void> {
  const button = await driver.findComponent(ON.id(id));
  expect(button !== null).assertTrue();
  if (button !== null) {
    await (button.click() as Promise<void>);
    await CommonFunc.sleep(500);
  }
}

async function enterOverlayManagerPage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  const options: router.RouterOptions = { url: PAGE_URL };
  await routerInstance.replaceUrl(options);
  await CommonFunc.sleep(WAIT_TIME);
}

export default function OnOverlayBackPressTest(): void {
  describe('OnOverlayBackPressTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
      await CommonFunc.sleep(WAIT_TIME);
    });

    beforeEach(async (): Promise<void> => {
      await enterOverlayManagerPage();
    });

    /**
     * @tc.number SUB_arkui_uicontext_overlay_manager_on_back_press_true_0100
     * @tc.name onBackPressReturnTrueInterceptsBack
     * @tc.desc Verify OnOverlayBackPressCallback returns true
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('onBackPressReturnTrueInterceptsBack', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'setBackPressTrue');
        const overlay = await driver.findComponent(ON.text('overlay_content_backpress'));
        expect(overlay !== null).assertTrue();
        const countBefore = AppStorage.get<number>('backPressCount') as number;
        await clickById(driver, 'invokeBackPressCallback');
        const countAfter = AppStorage.get<number>('backPressCount') as number;
        expect(countAfter > countBefore).assertTrue();
        expect(AppStorage.get<boolean>('backPressLastResult') as boolean).assertTrue();
        const overlayAfterBack = await driver.findComponent(ON.text('overlay_content_backpress'));
        expect(overlayAfterBack !== null).assertTrue();
        await clickById(driver, 'closeBackPressOverlay');
      } catch (error) {
        console.error('onBackPressReturnTrueInterceptsBack error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_arkui_uicontext_overlay_manager_on_back_press_false_0200
     * @tc.name onBackPressReturnFalseAllowsBack
     * @tc.desc Verify OverlayManagerOptions.onBackPress returns false
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('onBackPressReturnFalseAllowsBack', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'setBackPressFalse');
        const overlay = await driver.findComponent(ON.text('overlay_content_backpress'));
        expect(overlay !== null).assertTrue();
        const countBefore = AppStorage.get<number>('backPressCount') as number;
        await clickById(driver, 'invokeBackPressCallback');
        const countAfter = AppStorage.get<number>('backPressCount') as number;
        expect(countAfter > countBefore).assertTrue();
        expect(AppStorage.get<boolean>('backPressLastResult') as boolean).assertFalse();
        await clickById(driver, 'closeBackPressOverlay');
      } catch (error) {
        console.error('onBackPressReturnFalseAllowsBack error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
