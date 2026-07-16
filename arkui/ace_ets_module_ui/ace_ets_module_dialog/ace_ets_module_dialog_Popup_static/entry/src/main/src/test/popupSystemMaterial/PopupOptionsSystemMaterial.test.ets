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
import { uiMaterial } from '@kit.ArkUI';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/popupSystemMaterial/PopupOptionsSystemMaterial';

async function clickById(driver: Driver, id: string): Promise<void> {
  let button: Component = (await driver.findComponent(ON.id(id))) as Component;
  await (button?.click() as Promise<void>);
}

export default function PopupOptionsSystemMaterialTest(): void {
  describe('PopupOptionsSystemMaterial', (): void => {
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
        if (pages.name !== 'PopupOptionsSystemMaterial') {
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error('replace PopupOptionsSystemMaterial page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    it('PopupOptionsSystemMaterial_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'undefined');
        await CommonFunc.sleep(SLEEP_TIME);
        let popupText = await driver.findComponent(ON.text('PopupOptions Undefined Test'));
        expect(!!popupText).assertEqual(true);
        expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
        expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
        await clickById(driver, 'undefined');
        done();
      } catch (err) {
        console.error('PopupOptionsSystemMaterial_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    it('PopupOptionsSystemMaterial_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'hds_thick');
        await CommonFunc.sleep(SLEEP_TIME);
        let popupText = await driver.findComponent(ON.text('PopupOptions HDS THICK Test'));
        expect(!!popupText).assertEqual(true);
        await clickById(driver, 'hds_thick');
        done();
      } catch (err) {
        console.error('PopupOptionsSystemMaterial_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    it('PopupOptionsSystemMaterial_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'semi_transparent');
        await CommonFunc.sleep(SLEEP_TIME);
        let popupText = await driver.findComponent(ON.text('PopupOptions SEMI_TRANSPARENT Test'));
        expect(!!popupText).assertEqual(true);
        await clickById(driver, 'semi_transparent');
        done();
      } catch (err) {
        console.error('PopupOptionsSystemMaterial_0300 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    it('PopupOptionsSystemMaterial_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'immersive_thick');
        await CommonFunc.sleep(SLEEP_TIME);
        let popupText = await driver.findComponent(ON.text('PopupOptions Immersive THICK Test'));
        expect(!!popupText).assertEqual(true);
        await clickById(driver, 'immersive_thick');
        done();
      } catch (err) {
        console.error('PopupOptionsSystemMaterial_0400 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    it('PopupOptionsSystemMaterial_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'immersive_ultra_thin');
        await CommonFunc.sleep(SLEEP_TIME);
        let popupText = await driver.findComponent(ON.text('PopupOptions Immersive ULTRA_THIN Test'));
        expect(!!popupText).assertEqual(true);
        await clickById(driver, 'immersive_ultra_thin');
        done();
      } catch (err) {
        console.error('PopupOptionsSystemMaterial_0500 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    it('PopupOptionsSystemMaterial_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'none');
        await CommonFunc.sleep(SLEEP_TIME);
        let popupText = await driver.findComponent(ON.text('PopupOptions NONE Test'));
        expect(!!popupText).assertEqual(true);
        await clickById(driver, 'none');
        done();
      } catch (err) {
        console.error('PopupOptionsSystemMaterial_0600 error: ' + err);
        expect().assertFail();
        done();
      }
    });
  });
}
