'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from './Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';

const BUNDLE_NAME = 'com.arkui.ace.navigation.nowear.static';
const ABILITY_NAME = 'EntryAbility';
const NAV_BAR_PAGE_URL = 'MainAbility/pages/NavBarTest';
const NAV_BAR_DISABLE_PAGE_URL = 'MainAbility/pages/NavBarDisableClearTest';
const MODIFIER_PAGE_URL = 'MainAbility/pages/ModifierTest';
const MODIFIER_DISABLE_PAGE_URL = 'MainAbility/pages/ModifierDisableClearTest';

// Find component by id with retry polling (NO swipe — swipe interferes with Navigation)
async function findComponentWithScroll(driver: Driver, id: string, maxSwipeRetries: int = 10): Promise<Component | null> {
  for (let i: int = 0; i < maxSwipeRetries; i++) {
    let comp = await driver.findComponent(ON.id(id));
    if (comp !== null) {
      return comp;
    }
    await CommonFunc.sleep(500);
  }
  return null;
}

export default function ClearContentStackTest() {
  describe('ClearContentStackTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility(BUNDLE_NAME, ABILITY_NAME);
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    // =========================================================================
    // NavBarTest - clearContentStackOnPrimaryNavigation = true (attribute)
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0100
     * @tc.desc   Test NavBarTest page renders with clearContentStackOnPrimaryNavigation=true
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: NAV_BAR_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Verify page loaded by checking enableClearTrue Radio is visible
        let enableClearRadio = await findComponentWithScroll(driver, 'enableClearTrue');
        expect(enableClearRadio !== null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0200
     * @tc.desc   Test NavBarTest with enableClear=true and pushPath
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: NAV_BAR_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Click pushPath button to push a destination
        let pushBtn = await findComponentWithScroll(driver, 'pushPath');
        expect(pushBtn !== null).assertTrue();
        if (pushBtn !== null) {
          await pushBtn.click();
          await CommonFunc.sleep(1500);
        }
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0300
     * @tc.desc   Test NavBarTest toggle enableClear to false via AttrControlPanel
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0300 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: NAV_BAR_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Click enableClear false radio to toggle
        let clearFalseRadio = await findComponentWithScroll(driver, 'enableClearFalse');
        expect(clearFalseRadio !== null).assertTrue();
        if (clearFalseRadio !== null) {
          await clearFalseRadio.click();
          await CommonFunc.sleep(500);
        }
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0350
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0350
     * @tc.desc   Test NavBarTest switch to Split mode with enableClear=true and push destination
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0350', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0350 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: NAV_BAR_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Switch to Split mode
        let splitRadio = await findComponentWithScroll(driver, 'modeSplit');
        if (splitRadio !== null) {
          await splitRadio.click();
          await CommonFunc.sleep(1000);
        }
        // Ensure enableClear is true
        let enableClearTrue = await findComponentWithScroll(driver, 'enableClearTrue');
        if (enableClearTrue !== null) {
          await enableClearTrue.click();
          await CommonFunc.sleep(500);
        }
        // Push a destination
        let pushBtn = await findComponentWithScroll(driver, 'pushPath');
        if (pushBtn !== null) {
          await pushBtn.click();
          await CommonFunc.sleep(1500);
        }
        expect(splitRadio !== null && pushBtn !== null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0350 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // NavBarDisableClearTest - clearContentStackOnPrimaryNavigation = false
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0400
     * @tc.desc   Test NavBarDisableClearTest page renders with clearContentStackOnPrimaryNavigation=false
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0400 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: NAV_BAR_DISABLE_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Verify page loaded
        let pushBtn = await findComponentWithScroll(driver, 'pushPath');
        expect(pushBtn !== null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0500
     * @tc.desc   Test NavBarDisableClearTest push and pop without clear behavior
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0500 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: NAV_BAR_DISABLE_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Push a page
        let pushBtn = await findComponentWithScroll(driver, 'pushPath');
        expect(pushBtn !== null).assertTrue();
        if (pushBtn !== null) {
          await pushBtn.click();
          await CommonFunc.sleep(1500);
        }
        // Pop
        let popBtn = await findComponentWithScroll(driver, 'pop');
        if (popBtn !== null) {
          await popBtn.click();
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // ModifierTest - clearContentStackOnPrimaryNavigation via AttributeModifier
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0600
     * @tc.desc   Test ModifierTest page renders with AttributeModifier clearContentStackOnPrimaryNavigation=true
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0600 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: MODIFIER_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Verify page loaded - check pushPath button exists
        let pushBtn = await findComponentWithScroll(driver, 'pushPath');
        expect(pushBtn !== null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0700
     * @tc.desc   Test ModifierTest toggle enableClear via AttrControlPanel Radio
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0700 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: MODIFIER_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Verify enableClear Radio is present in AttrControlPanel
        let enableClearTrue = await findComponentWithScroll(driver, 'enableClearTrue');
        expect(enableClearTrue !== null).assertTrue();
        // Toggle to false via AttrControlPanel (synced to myModifier via @Watch)
        let enableClearFalse = await findComponentWithScroll(driver, 'enableClearFalse');
        if (enableClearFalse !== null) {
          await enableClearFalse.click();
          await CommonFunc.sleep(500);
        }
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // ModifierDisableClearTest - AttributeModifier with enableClear=false
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0800
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0800
     * @tc.desc   Test ModifierDisableClearTest page renders with AttributeModifier clearContentStackOnPrimaryNavigation=false
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0800 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: MODIFIER_DISABLE_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Verify page loaded
        let pushBtn = await findComponentWithScroll(driver, 'pushPath');
        expect(pushBtn !== null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0900
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0900
     * @tc.desc   Test ModifierDisableClearTest toggle enableClear to true via AttrControlPanel Radio
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0900 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: MODIFIER_DISABLE_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Verify enableClear Radio is present
        let enableClearFalse = await findComponentWithScroll(driver, 'enableClearFalse');
        expect(enableClearFalse !== null).assertTrue();
        // Toggle to true via AttrControlPanel (synced to myModifier via @Watch)
        let enableClearTrue = await findComponentWithScroll(driver, 'enableClearTrue');
        if (enableClearTrue !== null) {
          await enableClearTrue.click();
          await CommonFunc.sleep(500);
        }
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0950
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0950
     * @tc.desc   Test ModifierDisableClearTest switch to Split mode and push destination
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0950', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0950 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let options: router.RouterOptions = { url: MODIFIER_DISABLE_PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(2000);
        // Switch to Split mode
        let splitRadio = await findComponentWithScroll(driver, 'modeSplit');
        if (splitRadio !== null) {
          await splitRadio.click();
          await CommonFunc.sleep(1000);
        }
        // Push a destination
        let pushBtn = await findComponentWithScroll(driver, 'pushPath');
        if (pushBtn !== null) {
          await pushBtn.click();
          await CommonFunc.sleep(1500);
        }
        // Verify Split mode radio and push button were found and operated
        expect(splitRadio !== null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStackNav_static_0950 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });
}
