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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium';
import { Driver, ON, Component } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

async function clickById(driver: Driver, id: string): Promise<void> {
  let button: Component = (await driver.findComponent(ON.id(id))) as Component;
  await (button?.click() as Promise<void>);
}

async function navigatePage(pageUrl: string, pageName: string): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== pageName) {
    routerInstance.replaceUrl({ url: pageUrl });
    await CommonFunc.sleep(SLEEP_TIME);
  }
}

export default function CustomPopupOptionsColorModeTest(): void {
  describe('CustomPopupOptionsColorModeTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.popup.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      await navigatePage('MainAbility/pages/popup/CustomPopupOptionsColorMode', 'CustomPopupOptionsColorMode');
    });
    afterEach(async (): Promise<void> => { await Utils.sleep(SLEEP_TIME); });

    /**
     * @tc.number  PopupCustomOptionsColorMode_0001
     * @tc.name    PopupCustomOptionsColorMode_0001
     * @tc.desc    CustomPopupOptions FOLLOW_SYSTEM colorMode
     * @tc.level   Level.LEVEL2
     */
    it('PopupCustomOptionsColorMode_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'PopupColorMode_FOLLOW_SYSTEM');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('CustomPopup FOLLOW_SYSTEM'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'PopupColorMode_FOLLOW_SYSTEM');
      done();
    });
    /**
     * @tc.number  PopupCustomOptionsColorMode_0002
     * @tc.name    PopupCustomOptionsColorMode_0002
     * @tc.desc    CustomPopupOptions FOLLOW_TARGET colorMode
     * @tc.level   Level.LEVEL2
     */
    it('PopupCustomOptionsColorMode_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'PopupColorMode_FOLLOW_TARGET');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('CustomPopup FOLLOW_TARGET'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'PopupColorMode_FOLLOW_TARGET');
      done();
    });
    /**
     * @tc.number  PopupCustomOptionsColorMode_0003
     * @tc.name    PopupCustomOptionsColorMode_0003
     * @tc.desc    CustomPopupOptions null colorMode
     * @tc.level   Level.LEVEL2
     */
    it('PopupCustomOptionsColorMode_0003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'PopupColorMode_null');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('CustomPopup null'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'PopupColorMode_null');
      done();
    });
    /**
     * @tc.number  PopupCustomOptionsColorMode_0004
     * @tc.name    PopupCustomOptionsColorMode_0004
     * @tc.desc    CustomPopupOptions undefined colorMode
     * @tc.level   Level.LEVEL2
     */
    it('PopupCustomOptionsColorMode_0004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'PopupColorMode_undefined');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('CustomPopup undefined'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'PopupColorMode_undefined');
      done();
    });
  });
}
