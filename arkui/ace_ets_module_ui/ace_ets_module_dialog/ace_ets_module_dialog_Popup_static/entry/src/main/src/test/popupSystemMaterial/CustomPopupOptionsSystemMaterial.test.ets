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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { uiMaterial } from '@kit.ArkUI';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/popupSystemMaterial/CustomPopupOptionsSystemMaterial';

export default function CustomPopupOptionsSystemMaterialTest(): void {
  describe('CustomPopupOptionsSystemMaterial', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.dialog.popup.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = { url: PAGE_URL };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages.name !== 'CustomPopupOptionsSystemMaterial') {
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error('replace CustomPopupOptionsSystemMaterial page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    it('CustomPopupOptionsSystemMaterial_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('undefined'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(!!popupText).assertEqual(true);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await (closeButton?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      done();
    });

    it('CustomPopupOptionsSystemMaterial_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('hds_thick'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(!!popupText).assertEqual(true);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await (closeButton?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      done();
    });

    it('CustomPopupOptionsSystemMaterial_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('semi_transparent'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(!!popupText).assertEqual(true);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      done();
    });

    it('CustomPopupOptionsSystemMaterial_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('immersive_thick'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(!!popupText).assertEqual(true);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      done();
    });

    it('CustomPopupOptionsSystemMaterial_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(!!popupText).assertEqual(true);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      done();
    });

    it('CustomPopupOptionsSystemMaterial_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('materialTypeNone'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let popupText = await driver.findComponent(ON.text('CustomPopupOptions Test'));
      expect(!!popupText).assertEqual(true);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      done();
    });
  });
}
