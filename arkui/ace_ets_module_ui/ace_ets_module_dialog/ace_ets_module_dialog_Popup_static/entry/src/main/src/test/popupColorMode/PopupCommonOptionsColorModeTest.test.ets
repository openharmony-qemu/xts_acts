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
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

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
          await CommonFunc.sleep(2000);
  }
}

export default function PopupCommonOptionsColorModeTest(): void {
  describe('PopupCommonOptionsColorModeTest', (): void => {
    beforeEach(async (): Promise<void> => {
       try {
         await navigatePage('MainAbility/pages/popup/PopupCommonOptionsColorMode', 'PopupCommonOptionsColorMode');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
    });
    afterEach(async (): Promise<void> => { try { await Utils.sleep(SLEEP_TIME); } catch (err) { console.info("sleep err: " + JSON.stringify(err)); } });

    /**
     * @tc.number  PopupCommonOptionsColorMode_0001
     * @tc.name    PopupCommonOptionsColorMode_0001
     * @tc.desc    PopupCommonOptions FOLLOW_SYSTEM colorMode
     * @tc.level   Level.LEVEL2
     */
    it('PopupCommonOptionsColorMode_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'PopupColorMode_FOLLOW_SYSTEM');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon FOLLOW_SYSTEM'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'PopupColorMode_FOLLOW_SYSTEM');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    /**
     * @tc.number  PopupCommonOptionsColorMode_0002
     * @tc.name    PopupCommonOptionsColorMode_0002
     * @tc.desc    PopupCommonOptions FOLLOW_TARGET colorMode
     * @tc.level   Level.LEVEL2
     */
    it('PopupCommonOptionsColorMode_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'PopupColorMode_FOLLOW_TARGET');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon FOLLOW_TARGET'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'PopupColorMode_FOLLOW_TARGET');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    /**
     * @tc.number  PopupCommonOptionsColorMode_0003
     * @tc.name    PopupCommonOptionsColorMode_0003
     * @tc.desc    PopupCommonOptions null colorMode
     * @tc.level   Level.LEVEL2
     */
    it('PopupCommonOptionsColorMode_0003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'PopupColorMode_null');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon null'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'PopupColorMode_null');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
    /**
     * @tc.number  PopupCommonOptionsColorMode_0004
     * @tc.name    PopupCommonOptionsColorMode_0004
     * @tc.desc    PopupCommonOptions undefined colorMode
     * @tc.level   Level.LEVEL2
     */
    it('PopupCommonOptionsColorMode_0004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'PopupColorMode_undefined');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon undefined'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'PopupColorMode_undefined');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
  });
}