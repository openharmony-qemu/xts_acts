'use static';
/**
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

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

const PAGE_URL = 'MainAbility/pages/popupBackground/PopupBackgroundBlurStyleOptions';
const PAGE_NAME = 'PopupBackgroundBlurStyleOptions';

async function navigatePage(): Promise<void> {
  let routerInstance = AppStorage.get<Router>('router');
  if (routerInstance === undefined || routerInstance === null) {
    await CommonFunc.sleep(2000);
    routerInstance = AppStorage.get<Router>('router');
  }
  if (routerInstance === undefined || routerInstance === null) {
    return;
  }
  const router = routerInstance as Router;
  router.clear();
  if (router.getState().name !== PAGE_NAME) {
    router.replaceUrl({ url: PAGE_URL });
    await CommonFunc.sleep(1500);
  }
}

async function waitForText(label: string): Promise<boolean> {
  let driver = Driver.create();
  for (let i = 0; i < 10; i++) {
    let comp = await driver.findComponent(ON.text(label));
    if (comp !== undefined && comp !== null) {
      return true;
    }
    await CommonFunc.sleep(500);
  }
  return false;
}

export default function PopupBackgroundBlurStyleOptionsTest(): void {
  describe('PopupBackgroundBlurStyleOptionsTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.api26.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      await navigatePage();
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0100
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0100
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions policy_FOLLOWS_WINDOW_ACTIVE_STATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_FOLLOWS_WINDOW_ACTIVE_STATE'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup policy FOLLOWS_WINDOW_ACTIVE_STATE')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0100 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0200
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0200
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions policy_ALWAYS_ACTIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0200', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_ACTIVE'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup policy ALWAYS_ACTIVE')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0200 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0300
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0300
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions policy_ALWAYS_INACTIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0300', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_INACTIVE'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup policy ALWAYS_INACTIVE')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0300 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0400
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0400
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions inactiveColor_red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0400', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0400 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_red'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup inactiveColor red')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0400 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0500
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0500
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions inactiveColor_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0500', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0500 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_string'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup inactiveColor string')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0500 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0600
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0600
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions inactiveColor_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0600', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0600 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_number'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup inactiveColor number')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0600 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0700
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0700
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions colorMode_LIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0700', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0700 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('colorMode_LIGHT'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup colorMode LIGHT')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0700 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0800
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0800
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions colorMode_DARK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0800', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0800 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('colorMode_DARK'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup colorMode DARK')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0800 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0900
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0900
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions adaptiveColor_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0900', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0900 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_DEFAULT'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup adaptiveColor DEFAULT')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0900 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1000
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1000
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions adaptiveColor_AVERAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1000', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1000 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_AVERAGE'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup adaptiveColor AVERAGE')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1000 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1100
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1100
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions scale_0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1100', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_0'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup scale 0')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1100 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1200
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1200
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions scale_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1200', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_1'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup scale 1')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1200 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1300
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1300
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions scale_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1300', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_2'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup scale 2')).assertEqual(true);
      await button!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1300 END');
    });
    /**
     * @tc.name   SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1400
     * @tc.number SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1400
     * @tc.desc   Test PopupBackgroundBlurStyleOptions backgroundBlurStyleOptions combinedOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1400', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1400 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('combinedOptions'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForText('Popup combined options')).assertEqual(true);
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupBackgroundBlurStyleOptions_1400 END');
    });
  });
}
