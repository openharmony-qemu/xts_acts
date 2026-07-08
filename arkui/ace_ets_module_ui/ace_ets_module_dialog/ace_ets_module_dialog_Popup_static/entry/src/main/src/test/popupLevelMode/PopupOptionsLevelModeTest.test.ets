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
import { LevelMode } from '@ohos.promptAction';

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

export default function PopupOptionsLevelModeTest(): void {
  describe('PopupOptionsLevelModeTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.popup.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      await navigatePage('MainAbility/pages/popup/PopupOptionsLevelMode', 'PopupOptionsLevelMode');
    });
    afterEach(async (): Promise<void> => { await Utils.sleep(SLEEP_TIME); });

    /**
     * @tc.number  PopupOptionsLevelMode_0100
     * @tc.name    PopupOptionsLevelMode_0100
     * @tc.desc    LevelMode.OVERLAY enum equals 0
     * @tc.level   Level.LEVEL0
     */
    it('PopupOptionsLevelMode_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(LevelMode.OVERLAY).assertEqual(0);
      done();
    });
    /**
     * @tc.number  PopupOptionsLevelMode_0200
     * @tc.name    PopupOptionsLevelMode_0200
     * @tc.desc    LevelMode.EMBEDDED enum equals 1
     * @tc.level   Level.LEVEL0
     */
    it('PopupOptionsLevelMode_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(LevelMode.EMBEDDED).assertEqual(1);
      done();
    });
    /**
     * @tc.number  PopupOptionsLevelMode_0300
     * @tc.name    PopupOptionsLevelMode_0300
     * @tc.desc    default levelMode popup
     * @tc.level   Level.LEVEL0
     */
    it('PopupOptionsLevelMode_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_default');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('Popup Default LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_default');
      done();
    });
    /**
     * @tc.number  PopupOptionsLevelMode_0400
     * @tc.name    PopupOptionsLevelMode_0400
     * @tc.desc    OVERLAY levelMode popup
     * @tc.level   Level.LEVEL0
     */
    it('PopupOptionsLevelMode_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_overlay');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('Popup OVERLAY LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_overlay');
      done();
    });
    /**
     * @tc.number  PopupOptionsLevelMode_0500
     * @tc.name    PopupOptionsLevelMode_0500
     * @tc.desc    EMBEDDED levelMode popup
     * @tc.level   Level.LEVEL0
     */
    it('PopupOptionsLevelMode_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_embedded');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('Popup EMBEDDED LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_embedded');
      done();
    });
    /**
     * @tc.number  PopupOptionsLevelMode_0600
     * @tc.name    PopupOptionsLevelMode_0600
     * @tc.desc    null levelMode popup
     * @tc.level   Level.LEVEL0
     */
    it('PopupOptionsLevelMode_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_null');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('Popup Null LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_null');
      done();
    });
    /**
     * @tc.number  PopupOptionsLevelMode_0700
     * @tc.name    PopupOptionsLevelMode_0700
     * @tc.desc    undefined levelMode popup
     * @tc.level   Level.LEVEL0
     */
    it('PopupOptionsLevelMode_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await clickById(driver, 'popup_undefined');
      await CommonFunc.sleep(SLEEP_TIME);
      const popupText = await driver.findComponent(ON.text('Popup Undefined LevelMode Test'));
      expect(!!popupText).assertEqual(true);
      await clickById(driver, 'popup_undefined');
      done();
    });
  });
}
