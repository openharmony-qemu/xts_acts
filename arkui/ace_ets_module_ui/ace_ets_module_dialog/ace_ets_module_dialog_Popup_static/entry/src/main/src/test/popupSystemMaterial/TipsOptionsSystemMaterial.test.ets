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
const PAGE_URL = 'MainAbility/pages/popupSystemMaterial/TipsOptionsSystemMaterial';

async function hoverButtonAndFindTips(
  driver: Driver,
  buttonId: string,
  tipsText: string
): Promise<void> {
  let button = await driver.findComponent(ON.id(buttonId));
  let bounds = await button?.getBounds();
  let centerX: int = Math.floor(((bounds?.left ?? 0) + (bounds?.right ?? 0)) / 2).toInt();
  let centerY: int = Math.floor(((bounds?.top ?? 0) + (bounds?.bottom ?? 0)) / 2).toInt();
  await driver.mouseMoveTo({ x: centerX, y: centerY });
  await CommonFunc.sleep(1000);
  let popupText = await driver.findComponent(ON.text(tipsText));
  expect(!!popupText).assertEqual(true);
}

export default function TipsOptionsSystemMaterialTest(): void {
  describe('TipsOptionsSystemMaterial', (): void => {

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = { url: PAGE_URL };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages.name !== 'TipsOptionsSystemMaterial') {
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('replace TipsOptionsSystemMaterial page error: ' + err);
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

    it('TipsOptionsSystemMaterial_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await hoverButtonAndFindTips(driver, 'undefined', 'TipsOptions Undefined Test');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      done();
    });

    it('TipsOptionsSystemMaterial_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('hds_thick'));
        let bounds = await button?.getBounds();
        let centerX: int = Math.floor(((bounds?.left ?? 0) + (bounds?.right ?? 0)) / 2).toInt();
        let centerY: int = Math.floor(((bounds?.top ?? 0) + (bounds?.bottom ?? 0)) / 2).toInt();
        await driver.mouseMoveTo({ x: centerX, y: centerY });
        await CommonFunc.sleep(1000);
        let popupText = await driver.findComponent(ON.text('TipsOptions HDS THICK Test'));
        expect(popupText).not().assertUndefined();
        await CommonFunc.sleep(500);
        await driver.mouseMoveTo({ x: 1, y: 1 });
        await CommonFunc.sleep(500);
        done();
      } catch (err) {
        console.error('TipsOptionsSystemMaterial_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    it('TipsOptionsSystemMaterial_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await hoverButtonAndFindTips(driver, 'semi_transparent', 'TipsOptions SEMI_TRANSPARENT Test');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await driver.mouseMoveTo({ x: 1, y: 1 });
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(500);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });

    it('TipsOptionsSystemMaterial_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await hoverButtonAndFindTips(driver, 'immersive_thick', 'TipsOptions Immersive THICK Test');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await driver.mouseMoveTo({ x: 1, y: 1 });
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(500);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });

    it('TipsOptionsSystemMaterial_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await hoverButtonAndFindTips(driver, 'immersive_ultra_thin', 'TipsOptions Immersive ULTRA_THIN Test');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await driver.mouseMoveTo({ x: 1, y: 1 });
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(500);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });

    it('TipsOptionsSystemMaterial_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await hoverButtonAndFindTips(driver, 'none', 'TipsOptions NONE Test');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await driver.mouseMoveTo({ x: 1, y: 1 });
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(500);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
  });
}