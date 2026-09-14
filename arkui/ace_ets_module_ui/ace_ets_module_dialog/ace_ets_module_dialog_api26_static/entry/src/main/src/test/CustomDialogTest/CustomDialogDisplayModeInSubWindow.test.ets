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

import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { DialogDisplayMode } from '@ohos.arkui.component';

async function navigatePage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== 'CustomDialogDisplayModeInSubWindow') {
    routerInstance.replaceUrl({ url: 'MainAbility/pages/CustomDialog/CustomDialogDisplayModeInSubWindow' });
    await CommonFunc.sleep(800);
  }
}

export default function CustomDialogDisplayModeInSubWindowTest(): void {
  describe('CustomDialogDisplayModeInSubWindowTest', () => {
    beforeEach(async (): Promise<void> => {
      try {
        await navigatePage();
      } catch (err) {
        console.info('CustomDialogDisplayModeInSubWindowTest beforeEach err: ' + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('CustomDialogDisplayModeInSubWindowTest afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogDisplayMode_0100
     * @tc.number SUB_ACE_API26_CustomDialogDisplayMode_0100
     * @tc.desc   DialogDisplayMode.SCREEN_BASED enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogDisplayMode_0100', Level.LEVEL0, async () => {
        expect(DialogDisplayMode.SCREEN_BASED).assertEqual(0);
      });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogDisplayMode_0200
     * @tc.number SUB_ACE_API26_CustomDialogDisplayMode_0200
     * @tc.desc   DialogDisplayMode.WINDOW_BASED enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogDisplayMode_0200', Level.LEVEL0, async () => {
        expect(DialogDisplayMode.WINDOW_BASED).assertEqual(1);
      });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogDisplayMode_0300
     * @tc.number SUB_ACE_API26_CustomDialogDisplayMode_0300
     * @tc.desc   CustomDialogController displayModeInSubWindow SCREEN_BASED opens dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogDisplayMode_0300', Level.LEVEL0, async () => {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let btn = await driver.findComponent(ON.id('open_screen_based'));
        await btn?.click();
        await CommonFunc.sleep(1000);
        let txt = await driver.findComponent(ON.text('Dialog_Mode_Test'));
        expect(!!txt).assertEqual(true);
        let closeBtn = await driver.findComponent(ON.id('confirm_btn'));
        await closeBtn?.click();
      });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogDisplayMode_0400
     * @tc.number SUB_ACE_API26_CustomDialogDisplayMode_0400
     * @tc.desc   CustomDialogController displayModeInSubWindow WINDOW_BASED opens dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogDisplayMode_0400', Level.LEVEL0, async () => {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let btn = await driver.findComponent(ON.id('open_window_based'));
        await btn?.click();
        await CommonFunc.sleep(1000);
        let txt = await driver.findComponent(ON.text('Dialog_Mode_Test'));
        expect(!!txt).assertEqual(true);
        let closeBtn = await driver.findComponent(ON.id('cancel_btn'));
        await closeBtn!.click();
      });
  });
}
