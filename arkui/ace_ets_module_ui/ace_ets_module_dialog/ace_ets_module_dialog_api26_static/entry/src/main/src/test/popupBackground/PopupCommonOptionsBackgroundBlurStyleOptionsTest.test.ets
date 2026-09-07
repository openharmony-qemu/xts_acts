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

import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

const PAGE_URL = 'MainAbility/pages/popupBackground/PopupCommonOptionsBackgroundBlurStyleOptions';
const PAGE_NAME = 'PopupCommonOptionsBackgroundBlurStyleOptions';

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

async function waitForPopupContent(): Promise<boolean> {
  let driver = Driver.create();
  for (let i = 0; i < 10; i++) {
    let popupText = await driver.findComponent(ON.text('Popup Content'));
    if (popupText !== undefined && popupText !== null) {
      return true;
    }
    await CommonFunc.sleep(500);
  }
  return false;
}

export default function PopupCommonBlurOptsTest(): void {
  describe('PopupCommonBlurOptsTest', (): void => {
    beforeEach(async (): Promise<void> => {
      try {
        await navigatePage();
      } catch (err) {
        console.info('PopupCommonBlurOptsTest beforeEach err: ' + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('PopupCommonBlurOptsTest afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0100
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0100
     * @tc.desc   PopupCommon blurStyleOptions policy FOLLOWS_WINDOW_ACTIVE_STATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_FOLLOWS_WINDOW_ACTIVE_STATE'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0100 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0200
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0200
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions policy_ALWAYS_ACTIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0200', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_ACTIVE'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0200 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0300
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0300
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions policy_ALWAYS_INACTIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0300', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('policy_ALWAYS_INACTIVE'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0300 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0400
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0400
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions inactiveColor_red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0400', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0400 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_red'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0400 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0500
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0500
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions inactiveColor_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0500', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0500 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_string'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0500 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0600
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0600
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions inactiveColor_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0600', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0600 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inactiveColor_number'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0600 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0700
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0700
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions colorMode_LIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0700', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0700 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('colorMode_LIGHT'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0700 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0800
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0800
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions colorMode_DARK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0800', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0800 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('colorMode_DARK'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0800 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0900
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0900
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions adaptiveColor_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0900', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0900 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_DEFAULT'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0900 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1000
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1000
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions adaptiveColor_AVERAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1000', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1000 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('adaptiveColor_AVERAGE'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1000 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1100
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1100
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions scale_0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1100', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_0'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1100 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1200
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1200
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions scale_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1200', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_1'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1200 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1300
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1300
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions scale_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1300', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scale_2'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn?.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1300 END');
    });

    /**
     * @tc.name   SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1400
     * @tc.number SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1400
     * @tc.desc   Test PopupCommonOptionsBackgroundBlurStyleOptions backgroundBlurStyleOptions combinedOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1400', Level.LEVEL0, async (): Promise<void> => {
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1400 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('combinedOptions'));
      await button?.click();
      await CommonFunc.sleep(1000);
      expect(await waitForPopupContent()).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_popup_btn'));
      await closeBtn!.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_1400 END');
    });
  });
}
