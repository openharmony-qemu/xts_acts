'use static'
/*
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

import { describe, it, expect, afterEach, Level, beforeEach } from
  '../../../../hypium';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/popup/PopupCommonOptionsBackgroundEffect';
const PAGE_NAME = 'PopupCommonOptionsBackgroundEffect';
const POPUP_TEXT = 'Popup Content';

async function clickById(driver: Driver, id: string): Promise<void> {
  let button: Component = (await driver.findComponent(ON.id(id))) as Component;
  await (button?.click() as Promise<void>);
}

async function navigatePage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== PAGE_NAME) {
    routerInstance.replaceUrl({ url: PAGE_URL });
          await CommonFunc.sleep(2000);
  }
}

async function assertCommonPopup(driver: Driver, btnId: string): Promise<void> {
  await clickById(driver, btnId);
  await CommonFunc.sleep(SLEEP_TIME);
  const popupText = await driver.findComponent(ON.text(POPUP_TEXT));
  expect(!!popupText).assertEqual(true);
  await clickById(driver, 'close_popup');
  await CommonFunc.sleep(SLEEP_TIME);
}

export default function PopupCommonOptionsBackgroundEffectTest(): void {
  describe('PopupCommonOptionsBackgroundEffectTest', (): void => {
    beforeEach(async (): Promise<void> => {
       try {
         await navigatePage();
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
    });
    afterEach(async (): Promise<void> => {
       try {
         await Utils.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('sleep err: ' + JSON.stringify(err));
       }
    });

    it('PopupCommonOptionsBackgroundEffect_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'radius_0');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'radius_20');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0003', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'radius_60');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0004', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'saturation_0');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0005', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'saturation_1');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0006', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'saturation_2');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0007', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'brightness_0');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0008', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'brightness_1');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0009', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'brightness_2');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'color_red');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0011', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'color_string');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0012', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'adaptiveColor_DEFAULT');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0013', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'adaptiveColor_AVERAGE');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0014', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'policy_ALWAYS_ACTIVE');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0015', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'policy_ALWAYS_INACTIVE_inactiveColor');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    it('PopupCommonOptionsBackgroundEffect_0016', Level.LEVEL2, async (done: () => void): Promise<void> => {
       try {
         await assertCommonPopup(Driver.create(), 'combinedOptions');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
  });
}