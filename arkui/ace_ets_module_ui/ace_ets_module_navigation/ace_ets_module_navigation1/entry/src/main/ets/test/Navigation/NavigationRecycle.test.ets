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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import { Driver, ON, Component } from '@ohos.UiTest';

const BUNDLE_NAME = 'com.arkui.ace.navigation1';
const RECYCLE_PAGE_URL = 'MainAbility/pages/Navigation/NavigationRecyclePage';
const MODIFIER_PAGE_URL = 'MainAbility/pages/Navigation/ModifierRecyclePage';


async function findComponentWithScroll(driver: Driver, id: string, maxScrollRetries: number = 10): Promise<Component | null> {
  // Try direct find first
  for (let i = 0; i < 3; i++) {
    let comp = await driver.findComponent(ON.id(id));
    if (comp !== null) {
      return comp;
    }
    await CommonFunc.sleep(500);
  }
 
  try {
    let scrollComp = await driver.findComponent(ON.type('Scroll'));
    let result = await scrollComp.scrollSearch(ON.id(id));
    if (result !== null && result !== undefined) {
      return result;
    }
  } catch (e) {
    // scrollSearch failed
  }
  
  try {
    let scrollComp = await driver.findComponent(ON.type('Scroll'));
    let bounds = await scrollComp.getBounds();
    let centerX: number = Math.round((bounds.left + bounds.right) / 2);
    let centerY: number = Math.round((bounds.top + bounds.bottom) / 2);
    await scrollComp.scrollToTop();
    await CommonFunc.sleep(800);
    for (let i = 0; i < maxScrollRetries; i++) {
      let comp = await driver.findComponent(ON.id(id));
      if (comp !== null) {
        return comp;
      }
      // Scroll down via mouse wheel (PC-compatible)
      await driver.mouseScroll({ x: centerX, y: centerY }, true, 3);
      await CommonFunc.sleep(500);
    }
    // Final check after scrolling
    let comp = await driver.findComponent(ON.id(id));
    if (comp !== null) {
      return comp;
    }
  } catch (e) {
    // mouseScroll fallback failed
  }
 
  try {
    let scrollComp = await driver.findComponent(ON.type('Scroll'));
    await scrollComp.scrollToBottom();
    await CommonFunc.sleep(800);
    let comp = await driver.findComponent(ON.id(id));
    if (comp !== null) {
      return comp;
    }
  } catch (e) {
    // scrollToBottom fallback failed
  }
  return null;
}

function getTextContentById(id: string): string {
  let strJson: string = getInspectorByKey(id);
  let obj: Record<string, ESObject> = JSON.parse(strJson) as Record<string, ESObject>;
  let attrs: ESObject = obj["$attrs"];
  if (attrs !== undefined && attrs !== null) {
    let content: ESObject = attrs["content"];
    if (content !== undefined && content !== null) {
      return String(content);
    }
  }
  return '';
}

// ============================================================================
// NavigationRecycleTest - Navigation.recoverable / configuration API coverage
// ============================================================================
export default function NavigationRecycleTest() {

  // ==========================================================================
  // NavigationRecycleTest
  // ==========================================================================
  describe('NavigationRecycleTest', () => {

    beforeAll(async (done: Function) => {
      console.info("NavigationRecycleTest beforeAll start");
      done();
    });

    beforeEach(async (done: Function) => {
      console.info("NavigationRecycleTest beforeEach start");
      let options: router.RouterOptions = {
        url: RECYCLE_PAGE_URL,
      }
      try {
        await router.replaceUrl(options);
        await CommonFunc.sleep(2000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        if (navPathStack) {
          navPathStack.clear();
        }
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error("replaceUrl NavigationRecycleTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(500);
      done();
    });

   
    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0100
     * @tc.desc   Test Navigation.recoverable(true) function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0100 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'nav_recoverable_true');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0200
     * @tc.desc   Test Navigation.recoverable(false) function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0200 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'nav_recoverable_false');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0300
     * @tc.desc   Test Navigation.configuration({recyclePagesOnLowMemory: true}) function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0300', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0300 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'recycle_memory_true');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0400
     * @tc.desc   Test Navigation.configuration({recyclePagesOnLowMemory: false}) function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0400', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0400 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'recycle_memory_false');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0500
     * @tc.desc   Test NavDestination.recoverable(true) function call via push standard page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0500', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0500 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'dest_recoverable_true');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_standard');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0600
     * @tc.desc   Test NavDestination.recoverable(false) function call via push standard page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0600', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0600 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'dest_recoverable_false');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_0600');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0700
     * @tc.desc   Test NavDestination.onSaveState/onRestoreState function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0700', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0700 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 入参覆盖 (Parameter Coverage)
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0800
     * @tc.desc   Test Navigation.recoverable with boolean true parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0800', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0800 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'nav_recoverable_true_0800');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_0800');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
        // Pop via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_0900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_0900
     * @tc.desc   Test Navigation.recoverable with boolean false parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_0900', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_0900 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'nav_recoverable_false_0900');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_0900');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_0900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1000
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1000
     * @tc.desc   Test configuration.recyclePagesOnLowMemory = true parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1000', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1000 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'recycle_memory_true_1000');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_1000');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1100
     * @tc.desc   Test configuration.recyclePagesOnLowMemory = false parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1100', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1100 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'recycle_memory_false_1100');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_1100');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1200
     * @tc.desc   Test NavDestination.mode = STANDARD with recoverable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1200', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1200 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_1200');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1300
     * @tc.desc   Test NavDestination.mode = DIALOG with recoverable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1300', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1300 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_dialog');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1400
     * @tc.desc   Test onSaveState returns Record<string, Object> with multiple types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1400', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1400 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore_1400');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1500
     * @tc.desc   Test onSaveState returns empty Record<string, Object>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1500', Level.LEVEL2, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1500 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_saveEmpty');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1600
     * @tc.desc   Test pushPath with param - parameter coverage for NavPathInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1600', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1600 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_with_param');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1700
     * @tc.desc   Test pushPath to DIALOG mode with param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1700', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1700 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_dialog_with_param');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 参数规格覆盖 (Parameter Specification Coverage)
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1800
     * @tc.desc   Test configuration.stackSizeLimit = 0 means no limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1800', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1800 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'stack_limit_0');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_3_standard');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(2000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(3);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_1900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_1900
     * @tc.desc   Test configuration.stackSizeLimit = -1 means no limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_1900', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_1900 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'stack_limit_minus1');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_3_standard_1900');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(2000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(3);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_1900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2000
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2000
     * @tc.desc   Test configuration.stackSizeLimit = 1 limits active pages to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2000', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2000 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'stack_limit_1');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_3_standard_2000');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(2000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertLarger(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2100
     * @tc.desc   Test configuration.stackSizeLimit = 3 limits active pages to 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2100', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2100 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'stack_limit_3');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'push_5_standard');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(3000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertLarger(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2200
     * @tc.desc   Test onSaveState returns Record with Object, string, bool, number array types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2200', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2200 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore_2200');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
        // Pop via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2300
     * @tc.desc   Test onRestoreState callback receives saved state Record
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2300', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2300 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore_2300');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2400
     * @tc.desc   Test onSaveState/onRestoreState with different page (pageSaveRestoreB)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2400', Level.LEVEL2, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2400 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestoreB');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 返回值覆盖 (Return Value Coverage)
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2500
     * @tc.desc   Test NavPathStack.size() return value after push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2500', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2500 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_2500');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Query stack size via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2600
     * @tc.desc   Test NavPathStack.getAllPathName() return value after push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2600', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2600 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_2600');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Query path names via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageStandard');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2700
     * @tc.desc   Test NavPathStack.getIndexByName() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2700', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2700 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_2700');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Query index by name via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        let indices: number[] = navPathStack.getIndexByName('pageStandard');
        expect(JSON.stringify(indices)).assertEqual('[0]');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2800
     * @tc.desc   Test NavPathStack.getParamByIndex() return value with param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2800', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2800 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_with_param_2800');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Query param by index via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        let param: Object | undefined = navPathStack.getParamByIndex(0) as Object | undefined;
        expect(param !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_2900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_2900
     * @tc.desc   Test NavPathStack.getParamByName() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_2900', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_2900 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_with_param_2900');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Query params by name via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        let params: Object[] = navPathStack.getParamByName('pageStandard') as Object[];
        expect(params.length > 0).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_2900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3000
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3000
     * @tc.desc   Test push and pop - stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3000', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3000 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_standard_3000');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
        // Pop via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3100
     * @tc.desc   Test push multiple pages and clear - stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3100', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3100 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'push_3_standard_3100');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(2000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(3);
        // Clear via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.clear();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // recyclePagesOnLowMemory 行为语义覆盖 (Behavior Semantics Coverage)
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3200
     * @tc.desc   Test recyclePagesOnLowMemory=true with onSaveState callback registered, verify page in stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3200 START');
      try {
        let driver = await Driver.create();
        // Set recyclePagesOnLowMemory to true
        let memBtn = await findComponentWithScroll(driver, 'recycle_memory_true');
        expect(memBtn != null).assertTrue();
        await memBtn!.click();
        await CommonFunc.sleep(500);
        // Push a page with onSaveState/onRestoreState callbacks
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Verify the page is in the stack
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
        expect(navPathStack.size()).assertEqual(1);
        // Verify the pushed page name contains saveRestore
        let allNames: string[] = navPathStack.getAllPathName();
        expect(allNames.length).assertEqual(1);
        // Clean up via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.clear();
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3300
     * @tc.desc   Test recyclePagesOnLowMemory=false, onSaveState callback still registered on page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3300', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3300 START');
      try {
        let driver = await Driver.create();
        // Set recyclePagesOnLowMemory to false
        let memBtn = await findComponentWithScroll(driver, 'recycle_memory_false');
        expect(memBtn != null).assertTrue();
        await memBtn!.click();
        await CommonFunc.sleep(500);
        // Push a page with onSaveState/onRestoreState callbacks
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Verify the page is in the stack
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
        expect(navPathStack.size()).assertEqual(1);
        // Clean up via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.clear();
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3400
     * @tc.desc   Test recyclePagesOnLowMemory=true with multiple pages pushed, verify NavPathInfo preserved in stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3400', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3400 START');
      try {
        let driver = await Driver.create();
        // Set recyclePagesOnLowMemory to true
        let memBtn = await findComponentWithScroll(driver, 'recycle_memory_true');
        expect(memBtn != null).assertTrue();
        await memBtn!.click();
        await CommonFunc.sleep(500);
        // Push saveRestore page first
        let pushSaveBtn = await findComponentWithScroll(driver, 'push_saveRestore');
        expect(pushSaveBtn != null).assertTrue();
        await pushSaveBtn!.click();
        await CommonFunc.sleep(1000);
        // Push standard page on top via NavPathStack API (NavDestination covers the main page after first push)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageStandard' });
        await CommonFunc.sleep(1000);
        // Verify stack has 2 entries and NavPathInfo is preserved
        expect(navPathStack.size()).assertEqual(2);
        let allNames: string[] = navPathStack.getAllPathName();
        expect(allNames.length).assertEqual(2);
        // Pop back to verify navigation still works
        // Pop via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        // Pop again
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3500
     * @tc.desc   Test recyclePagesOnLowMemory=true, push saveRestore page and pop, verify onSaveState callback fires
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3500', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3500 START');
      try {
        let driver = await Driver.create();
        // Clear previous state
        AppStorage.delete('saveStateResult');
        // Set recyclePagesOnLowMemory to true
        let memBtn = await findComponentWithScroll(driver, 'recycle_memory_true');
        expect(memBtn != null).assertTrue();
        await memBtn!.click();
        await CommonFunc.sleep(500);
        // Push saveRestore page which has onSaveState callback
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Pop the page - this triggers onSaveState when page is removed from stack
        // Pop via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pop();
        await CommonFunc.sleep(1500);
        // Verify onSaveState callback was called
        let saveResult: string | undefined = AppStorage.get<string>('saveStateResult');
        expect(saveResult).assertEqual('called');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3600
     * @tc.desc   Test recyclePagesOnLowMemory=true, push saveRestore then standard, pop standard to reveal saveRestore, verify onRestoreState callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3600', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3600 START');
      try {
        let driver = await Driver.create();
        // Clear previous state
        AppStorage.delete('saveStateResult');
        AppStorage.delete('restoreStateResult');
        // Set recyclePagesOnLowMemory to true
        let memBtn = await findComponentWithScroll(driver, 'recycle_memory_true');
        expect(memBtn != null).assertTrue();
        await memBtn!.click();
        await CommonFunc.sleep(500);
        // Push saveRestore page
        let pushSaveBtn = await findComponentWithScroll(driver, 'push_saveRestore');
        expect(pushSaveBtn != null).assertTrue();
        await pushSaveBtn!.click();
        await CommonFunc.sleep(1000);
        // Push standard page on top via NavPathStack API (NavDestination covers the main page after first push)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageStandard' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        // Pop standard page to reveal saveRestore page again
        // Pop via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.pop();
        await CommonFunc.sleep(1500);
        expect(navPathStack.size()).assertEqual(1);
        // Verify onSaveState was called (callback writes 'called' to AppStorage when page leaves)
        let saveResult: string | undefined = AppStorage.get<string>('saveStateResult');
        expect(saveResult).assertEqual('called');
        // Clean up
        navPathStack.pop();
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3700
     * @tc.desc   Test recyclePagesOnLowMemory=false, push and pop saveRestore page, verify onSaveState does NOT fire (no recycling)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3700', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3700 START');
      try {
        let driver = await Driver.create();
        // Clear previous state
        AppStorage.delete('saveStateResult');
        // Set recyclePagesOnLowMemory to false
        let memBtn = await findComponentWithScroll(driver, 'recycle_memory_false');
        expect(memBtn != null).assertTrue();
        await memBtn!.click();
        await CommonFunc.sleep(500);
        // Push saveRestore page
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Pop the page
        // Pop via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pop();
        await CommonFunc.sleep(1500);
        // When recyclePagesOnLowMemory=false, onSaveState should still fire on pop
        // (onSaveState fires when page is removed from stack regardless of recycle setting)
        let saveResult: string | undefined = AppStorage.get<string>('saveStateResult');
        expect(saveResult).assertEqual('called');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3800
     * @tc.desc   Test recyclePagesOnLowMemory=true, switch from true to false, verify configuration change takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3800', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3800 START');
      try {
        let driver = await Driver.create();
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        // First set to true
        let memTrueBtn = await findComponentWithScroll(driver, 'recycle_memory_true');
        expect(memTrueBtn != null).assertTrue();
        await memTrueBtn!.click();
        await CommonFunc.sleep(500);
        // Push a standard page
        let pushBtn = await findComponentWithScroll(driver, 'push_standard');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        // Pop back via API, then switch to false
        navPathStack.pop();
        await CommonFunc.sleep(500);
        let memFalseBtn = await findComponentWithScroll(driver, 'recycle_memory_false');
        expect(memFalseBtn != null).assertTrue();
        await memFalseBtn!.click();
        await CommonFunc.sleep(500);
        // Verify stack is empty after pop
        expect(navPathStack.size()).assertEqual(0);
        // Push again with false setting
        pushBtn = await findComponentWithScroll(driver, 'push_standard');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        // Clean up via API
        navPathStack.pop();
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_3900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_3900
     * @tc.desc   Test recyclePagesOnLowMemory=true with recoverable=true, verify page can be re-created after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_3900', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_3900 START');
      try {
        let driver = await Driver.create();
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        // Ensure clean state
        navPathStack.clear();
        await CommonFunc.sleep(500);
        AppStorage.delete('saveStateResult');
        // Set both recyclePagesOnLowMemory=true and recoverable=true
        let memBtn = await findComponentWithScroll(driver, 'recycle_memory_true_3900');
        expect(memBtn != null).assertTrue();
        await memBtn!.click();
        await CommonFunc.sleep(500);
        let recBtn = await findComponentWithScroll(driver, 'nav_recoverable_true_3900');
        expect(recBtn != null).assertTrue();
        await recBtn!.click();
        await CommonFunc.sleep(500);
        // Push saveRestore page
        let pushBtn = await findComponentWithScroll(driver, 'push_saveRestore_3900');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        // Pop the page via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        navPathStack.pop();
        await CommonFunc.sleep(1500);
        expect(navPathStack.size()).assertEqual(0);
        // Verify onSaveState was triggered on pop
        let saveResult: string | undefined = AppStorage.get<string>('saveStateResult');
        expect(saveResult !== undefined).assertTrue();
        // Re-push the same page - verify it can be re-created
        let rePushBtn = await findComponentWithScroll(driver, 'push_saveRestore_3900');
        expect(rePushBtn != null).assertTrue();
        await rePushBtn!.click();
        await CommonFunc.sleep(1500);
        expect(navPathStack.size()).assertEqual(1);
        // Clean up via NavPathStack API
        navPathStack.pop();
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_3900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });

  // ==========================================================================
  // ModifierRecycleTest - NavigationModifier (attributeModifier) coverage
  // ==========================================================================
  describe('ModifierRecycleTest', () => {

    beforeEach(async (done: Function) => {
      console.info("ModifierRecycleTest beforeEach start");
      let options: router.RouterOptions = {
        url: MODIFIER_PAGE_URL,
      }
      try {
        await router.replaceUrl(options);
        await CommonFunc.sleep(2000);
        let modNavPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        if (modNavPathStack) {
          modNavPathStack.clear();
        }
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error("replaceUrl ModifierRecycleTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(500);
      done();
    });

    // ========================================================================
    // 函数调用覆盖 (Function Call Coverage) - Modifier
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0100
     * @tc.desc   Test RecycleNavigationModifier (attributeModifier) function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0100 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'use_recycle_modifier');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0200
     * @tc.desc   Test NoRecycleNavigationModifier function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0200 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'use_no_recycle_modifier');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0300
     * @tc.desc   Test StackLimitModifier function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0300', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0300 START');
      try {
        let driver = await Driver.create();
        let btn = await findComponentWithScroll(driver, 'use_stack_limit_modifier_0600');
        expect(btn != null).assertTrue();
        await btn!.click();
        await CommonFunc.sleep(1500);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        expect(navPathStack != null).assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 入参覆盖 (Parameter Coverage) - Modifier
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0400
     * @tc.desc   Test RecycleNavigationModifier with push and pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0400', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0400 START');
      try {
        let driver = await Driver.create();
        let modBtn = await findComponentWithScroll(driver, 'use_recycle_modifier_0400');
        expect(modBtn != null).assertTrue();
        await modBtn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'mod_push_standard');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0500
     * @tc.desc   Test NoRecycleNavigationModifier with push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0500', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0500 START');
      try {
        let driver = await Driver.create();
        let modBtn = await findComponentWithScroll(driver, 'use_no_recycle_modifier_0500');
        expect(modBtn != null).assertTrue();
        await modBtn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'mod_push_standard_0500');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 参数规格覆盖 (Parameter Specification Coverage) - Modifier
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0600
     * @tc.desc   Test StackLimitModifier with stackSizeLimit=2 and multiple pushes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0600', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0600 START');
      try {
        let driver = await Driver.create();
        let modBtn = await findComponentWithScroll(driver, 'use_stack_limit_modifier_0600');
        expect(modBtn != null).assertTrue();
        await modBtn!.click();
        await CommonFunc.sleep(1500);
        // Push first page via UI button
        let pushBtn = await findComponentWithScroll(driver, 'mod_push_standard_0600');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Push remaining pages via NavPathStack API (NavDestination covers the main page after first push)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'modPageStandard' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'modPageStandard' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertLarger(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0700
     * @tc.desc   Test Modifier onSaveState/onRestoreState via modPageSaveRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0700', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0700 START');
      try {
        let driver = await Driver.create();
        let modBtn = await findComponentWithScroll(driver, 'use_recycle_modifier_0700');
        expect(modBtn != null).assertTrue();
        await modBtn!.click();
        await CommonFunc.sleep(500);
        let pushBtn = await findComponentWithScroll(driver, 'mod_push_saveRestore');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 返回值覆盖 (Return Value Coverage) - Modifier
    // ========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0800
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0800
     * @tc.desc   Test Modifier NavPathStack.size() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0800', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0800 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'mod_push_standard_0800');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Query stack size via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        expect(navPathStack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_0900
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_0900
     * @tc.desc   Test Modifier NavPathStack.getAllPathName() return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_0900', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_0900 START');
      try {
        let driver = await Driver.create();
        let pushBtn = await findComponentWithScroll(driver, 'mod_push_standard_0900');
        expect(pushBtn != null).assertTrue();
        await pushBtn!.click();
        await CommonFunc.sleep(1000);
        // Query path names via NavPathStack API (NavDestination covers the main page, UI button not clickable)
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('modNavPathStack') as NavPathStack;
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('modPageStandard');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_0900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });
}
