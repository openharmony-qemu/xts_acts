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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/Select/SelectMenuBackgroundBlurStyleOptions';
const PAGE_NAME = 'SelectMenuBackgroundBlurStyleOptions';

async function clickById(driver: Driver, id: string): Promise<void> {
  let button = await driver.findComponent(ON.id(id));
  await (button as Component).click();
}

async function openSelectMenu(driver: Driver): Promise<void> {
  await clickById(driver, 'selectMenuBlur');
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

export default function SelectMenuBackgroundBlurStyleOptionsTest(): void {
  describe('SelectMenuBackgroundBlurStyleOptionsTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.select.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      await navigatePage();
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number  SelectMenuBackgroundBlurStyleOptions_0001
     * @tc.name    SelectMenuBackgroundBlurStyleOptions_0001
     * @tc.desc    Default menuBackgroundBlurStyleOptions, open select menu
     * @tc.level   Level.LEVEL2
     */
    it('SelectMenuBackgroundBlurStyleOptions_0001', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await openSelectMenu(driver);
        const menuItem = await driver.findComponent(ON.text('aaa'));
        expect(!!menuItem).assertEqual(true);
        await openSelectMenu(driver);
        done();
      });

    /**
     * @tc.number  SelectMenuBackgroundBlurStyleOptions_0002
     * @tc.name    SelectMenuBackgroundBlurStyleOptions_0002
     * @tc.desc    Undefined menuBackgroundBlurStyleOptions, open select menu
     * @tc.level   Level.LEVEL2
     */
    it('SelectMenuBackgroundBlurStyleOptions_0002', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'btnBlurEmpty');
        await CommonFunc.sleep(SLEEP_TIME);
        await openSelectMenu(driver);
        const menuItem = await driver.findComponent(ON.text('aaa'));
        expect(!!menuItem).assertEqual(true);
        await openSelectMenu(driver);
        done();
      });

    /**
     * @tc.number  SelectMenuBackgroundBlurStyleOptions_0003
     * @tc.name    SelectMenuBackgroundBlurStyleOptions_0003
     * @tc.desc    Blue menuBackgroundBlurStyleOptions, open select menu
     * @tc.level   Level.LEVEL2
     */
    it('SelectMenuBackgroundBlurStyleOptions_0003', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);
        await clickById(driver, 'btnBlurBlue');
        await CommonFunc.sleep(SLEEP_TIME);
        await openSelectMenu(driver);
        const menuItem = await driver.findComponent(ON.text('aaa'));
        expect(!!menuItem).assertEqual(true);
        await openSelectMenu(driver);
        done();
      });
  });
}
