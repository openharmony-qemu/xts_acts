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
const PAGE_URL = 'MainAbility/pages/Select/SelectMenuBackgroundEffect';
const PAGE_NAME = 'SelectMenuBackgroundEffect';

async function clickById(driver: Driver, id: string): Promise<void> {
  let button = await driver.findComponent(ON.id(id));
  await (button as Component).click();
}

async function openSelectMenu(driver: Driver): Promise<void> {
  await clickById(driver, 'selectMenuEffect');
  await CommonFunc.sleep(SLEEP_TIME);
}

async function navigatePage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== PAGE_NAME) {
    routerInstance.replaceUrl({ url: PAGE_URL });
    await CommonFunc.sleep(SLEEP_TIME);
  }
}

export default function SelectMenuBackgroundEffectTest(): void {
  describe('SelectMenuBackgroundEffectTest', (): void => {
    beforeEach(async (): Promise<void> => {
      try {
        await navigatePage();
      } catch (err) {
        console.info('SelectMenuBackgroundEffectTest beforeEach err: ' + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('SelectMenuBackgroundEffectTest afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number  SelectMenuBackgroundEffect_0001
     * @tc.name    SelectMenuBackgroundEffect_0001
     * @tc.desc    Default menuBackgroundEffect, open select menu
     * @tc.level   Level.LEVEL2
     */
    it('SelectMenuBackgroundEffect_0001', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const driver = Driver.create();
          await CommonFunc.sleep(SLEEP_TIME);
          await openSelectMenu(driver);
          const menuItem = await driver.findComponent(ON.text('aaa'));
          expect(!!menuItem).assertEqual(true);
          await openSelectMenu(driver);
          done();
        } catch (error) {
          console.error('SelectMenuBackgroundEffect_0001 error: ' + error);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number  SelectMenuBackgroundEffect_0002
     * @tc.name    SelectMenuBackgroundEffect_0002
     * @tc.desc    Undefined menuBackgroundEffect, open select menu
     * @tc.level   Level.LEVEL2
     */
    it('SelectMenuBackgroundEffect_0002', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const driver = Driver.create();
          await CommonFunc.sleep(SLEEP_TIME);
          await clickById(driver, 'btnEffectEmpty');
          await CommonFunc.sleep(SLEEP_TIME);
          await openSelectMenu(driver);
          const menuItem = await driver.findComponent(ON.text('aaa'));
          expect(!!menuItem).assertEqual(true);
          await openSelectMenu(driver);
          done();
        } catch (error) {
          console.error('SelectMenuBackgroundEffect_0002 error: ' + error);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number  SelectMenuBackgroundEffect_0003
     * @tc.name    SelectMenuBackgroundEffect_0003
     * @tc.desc    Purple menuBackgroundEffect, open select menu
     * @tc.level   Level.LEVEL2
     */
    it('SelectMenuBackgroundEffect_0003', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const driver = Driver.create();
          await CommonFunc.sleep(SLEEP_TIME);
          await clickById(driver, 'btnEffectPurple');
          await CommonFunc.sleep(SLEEP_TIME);
          await openSelectMenu(driver);
          const menuItem = await driver.findComponent(ON.text('aaa'));
          expect(!!menuItem).assertEqual(true);
          await openSelectMenu(driver);
          done();
        } catch (error) {
          console.error('SelectMenuBackgroundEffect_0003 error: ' + error);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number  SelectMenuBackgroundEffect_0004
     * @tc.name    SelectMenuBackgroundEffect_0004
     * @tc.desc    Green menuBackgroundEffect, open select menu
     * @tc.level   Level.LEVEL2
     */
    it('SelectMenuBackgroundEffect_0004', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const driver = Driver.create();
          await CommonFunc.sleep(SLEEP_TIME);
          await clickById(driver, 'btnEffectGreen');
          await CommonFunc.sleep(SLEEP_TIME);
          await openSelectMenu(driver);
          const menuItem = await driver.findComponent(ON.text('aaa'));
          expect(!!menuItem).assertEqual(true);
          await openSelectMenu(driver);
          done();
        } catch (error) {
          console.error('SelectMenuBackgroundEffect_0004 error: ' + error);
          expect().assertFail();
          done();
        }
      });
  });
}
