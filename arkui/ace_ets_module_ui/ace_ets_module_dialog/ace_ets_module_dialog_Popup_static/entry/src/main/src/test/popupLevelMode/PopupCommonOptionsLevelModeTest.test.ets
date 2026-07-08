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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
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

export default function PopupCommonOptionsLevelModeTest(): void {
  describe('PopupCommonOptionsLevelModeTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.popup.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      await navigatePage('MainAbility/pages/popup/PopupCommonOptionsLevelMode', 'PopupCommonOptionsLevelMode');
    });
    afterEach(async (): Promise<void> => { await Utils.sleep(SLEEP_TIME); });

    /**
     * @tc.number  PopupCommonOptionsLevelMode_0100
     * @tc.name    PopupCommonOptionsLevelMode_0100
     * @tc.desc    PopupCommon default levelMode
     * @tc.level   Level.LEVEL0
     */
    it('PopupCommonOptionsLevelMode_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_default');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('PopupCommon Default LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_default');
      done();
    });
    /**
     * @tc.number  PopupCommonOptionsLevelMode_0200
     * @tc.name    PopupCommonOptionsLevelMode_0200
     * @tc.desc    PopupCommon OVERLAY levelMode
     * @tc.level   Level.LEVEL0
     */
    it('PopupCommonOptionsLevelMode_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_overlay');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('PopupCommon OVERLAY LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_overlay');
      done();
    });
    /**
     * @tc.number  PopupCommonOptionsLevelMode_0300
     * @tc.name    PopupCommonOptionsLevelMode_0300
     * @tc.desc    PopupCommon EMBEDDED levelMode
     * @tc.level   Level.LEVEL0
     */
    it('PopupCommonOptionsLevelMode_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_embedded');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('PopupCommon EMBEDDED LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_embedded');
      done();
    });
    /**
     * @tc.number  PopupCommonOptionsLevelMode_0400
     * @tc.name    PopupCommonOptionsLevelMode_0400
     * @tc.desc    PopupCommon null levelMode
     * @tc.level   Level.LEVEL0
     */
    it('PopupCommonOptionsLevelMode_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_null');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('PopupCommon Null LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_null');
      done();
    });
    /**
     * @tc.number  PopupCommonOptionsLevelMode_0500
     * @tc.name    PopupCommonOptionsLevelMode_0500
     * @tc.desc    PopupCommon undefined levelMode
     * @tc.level   Level.LEVEL0
     */
    it('PopupCommonOptionsLevelMode_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_undefined');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('PopupCommon Undefined LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_undefined');
      done();
    });
  });
}
