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

export default function PopupCommonOptionsLevelModeTest(): void {
  describe('PopupCommonOptionsLevelModeTest', (): void => {
    beforeEach(async (): Promise<void> => {
       try {
         await navigatePage('MainAbility/pages/popup/PopupCommonOptionsLevelMode', 'PopupCommonOptionsLevelMode');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
    });
    afterEach(async (): Promise<void> => { try { await Utils.sleep(SLEEP_TIME); } catch (err) { console.info("sleep err: " + JSON.stringify(err)); } });

    /**
     * @tc.number  PopupCommonOptionsLevelMode_0100
     * @tc.name    PopupCommonOptionsLevelMode_0100
     * @tc.desc    PopupCommon default levelMode
     * @tc.level   Level.LEVEL0
     */
    it('PopupCommonOptionsLevelMode_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'popup_default');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon Default LevelMode Test'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'popup_default');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
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
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'popup_overlay');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon OVERLAY LevelMode Test'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'popup_overlay');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
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
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'popup_embedded');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon EMBEDDED LevelMode Test'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'popup_embedded');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
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
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'popup_null');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon Null LevelMode Test'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'popup_null');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
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
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await clickById(driver, 'popup_undefined');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
       try {
         await CommonFunc.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      const popupText = await driver.findComponent(ON.text('PopupCommon Undefined LevelMode Test'));
      expect(!!popupText).assertEqual(true);
       try {
         await clickById(driver, 'popup_undefined');
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
      done();
    });
  });
}