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

import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { uiMaterial } from '@kit.ArkUI';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/popupSystemMaterial/PopupCommonOptionsSystemMaterial';

export default function PopupCommonOptionsSystemMaterialTest(): void {
  describe('PopupCommonOptionsSystemMaterial', (): void => {

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = { url: PAGE_URL };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages.name !== 'PopupCommonOptionsSystemMaterial') {
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('replace PopupCommonOptionsSystemMaterial page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
       try {
         await Utils.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('sleep err: ' + JSON.stringify(err));
       }
    });

    it('PopupCommonOptionsSystemMaterial_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let button = await driver.findComponent(ON.id('undefined'));
       try {
         await (button?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let popupText = await driver.findComponent(ON.text('Popup Content'));
      expect(!!popupText).assertEqual(true);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      let closeButton = await driver.findComponent(ON.text('Close'));
       try {
         await (closeButton?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });

    it('PopupCommonOptionsSystemMaterial_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let button = await driver.findComponent(ON.id('hds_thick'));
       try {
         await (button?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let popupText = await driver.findComponent(ON.text('Popup Content'));
      expect(!!popupText).assertEqual(true);
      let closeButton = await driver.findComponent(ON.text('Close'));
       try {
         await (closeButton?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });

    it('PopupCommonOptionsSystemMaterial_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let button = await driver.findComponent(ON.id('semi_transparent'));
       try {
         await (button?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let popupText = await driver.findComponent(ON.text('Popup Content'));
      expect(!!popupText).assertEqual(true);
      let closeButton = await driver.findComponent(ON.text('Close'));
       try {
         await (closeButton?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });

    it('PopupCommonOptionsSystemMaterial_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let button = await driver.findComponent(ON.id('immersive_thick'));
       try {
         await (button?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let popupText = await driver.findComponent(ON.text('Popup Content'));
      expect(!!popupText).assertEqual(true);
      let closeButton = await driver.findComponent(ON.text('Close'));
       try {
         await (closeButton?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });

    it('PopupCommonOptionsSystemMaterial_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
       try {
         await (button?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let popupText = await driver.findComponent(ON.text('Popup Content'));
      expect(!!popupText).assertEqual(true);
      let closeButton = await driver.findComponent(ON.text('Close'));
       try {
         await (closeButton?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });

    it('PopupCommonOptionsSystemMaterial_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let button = await driver.findComponent(ON.id('none'));
       try {
         await (button?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      let popupText = await driver.findComponent(ON.text('Popup Content'));
      expect(!!popupText).assertEqual(true);
      let closeButton = await driver.findComponent(ON.text('Close'));
       try {
         await (closeButton?.click() as Promise<void>);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
  });
}