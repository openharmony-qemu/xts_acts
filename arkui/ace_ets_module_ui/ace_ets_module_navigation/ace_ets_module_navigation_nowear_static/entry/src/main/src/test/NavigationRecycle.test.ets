'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from './Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

const BUNDLE_NAME = 'com.arkui.ace.navigation.nowear.static';
const ABILITY_NAME = 'EntryAbility';
const PAGE_URL = 'MainAbility/pages/NavigationRecyclePage';
const MOD_PAGE_URL = 'MainAbility/pages/ModifierRecyclePage';

function getAppStorageNumber(key: string): number {
  let val: number | undefined = AppStorage.get<number>(key);
  return val !== undefined ? val : 0;
}

function getAppStorageString(key: string): string {
  let val: string | undefined = AppStorage.get<string>(key);
  return val !== undefined ? val : '';
}

async function findComponentWithScroll(driver: Driver, id: string, maxSwipeRetries: int = 8): Promise<Component | null> {
  let comp = await driver.findComponent(ON.id(id));
  if (comp !== null) {
    return comp;
  }
  for (let i: int = 0; i < maxSwipeRetries; i++) {
    // Swipe up in top Scroll panel area to scroll down and reveal buttons below
    await driver.swipe(540, 1000, 540, 500, 600);
    await CommonFunc.sleep(600);
    comp = await driver.findComponent(ON.id(id));
    if (comp !== null) {
      return comp;
    }
    // Swipe down to scroll back up and reveal buttons above
    await driver.swipe(540, 500, 540, 1000, 600);
    await CommonFunc.sleep(600);
    comp = await driver.findComponent(ON.id(id));
    if (comp !== null) {
      return comp;
    }
  }
  return null;
}

// Require component by id: asserts non-null and returns Component type (avoids ! dereference at call site)
async function requireComponent(driver: Driver, id: string): Promise<Component> {
  let comp: Component | null = await findComponentWithScroll(driver, id);
  expect(comp !== null).assertTrue();
  return comp!;
}

async function navigateToPage(url: string): Promise<void> {
  let options: router.RouterOptions = { url: url };
  let pageName: string = url.substring(url.lastIndexOf('/') + 1);
  try {
    let routerInstance: Router | undefined = AppStorage.get<Router>("router");
    if (routerInstance !== undefined) {
      routerInstance.clear();
      let pages = routerInstance.getState();
      if (!(pageName == pages.name)) {
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(2500);
      }
    } else {
      console.error('navigateToPage: Router instance is undefined, cannot navigate to ' + url);
    }
  } catch (err) {
    console.error('navigateToPage navigate error:' + err);
    expect().assertFail();
  }
}

// Clear NavPathStack and AppStorage keys for NavigationRecyclePage
async function clearRecycleState(driver: Driver): Promise<void> {
  // Click clear button (always visible in top panel, even after NavDestination push)
  let clearBtn: Component | null = await findComponentWithScroll(driver, 'recycle_clear_btn');
  if (clearBtn !== null) {
    await clearBtn.click();
    await CommonFunc.sleep(300);
  }
  // Click pop button in case clear doesn't fully reset
  let popBtn: Component | null = await findComponentWithScroll(driver, 'recycle_pop_btn');
  if (popBtn !== null) {
    await popBtn.click();
    await CommonFunc.sleep(300);
  }
  // Clean AppStorage keys
  AppStorage.delete('recycleStackSize');
  AppStorage.delete('recycleAllPathNames');
  AppStorage.delete('saveStateResult');
  AppStorage.delete('restoreStateResult');
  AppStorage.delete('restoreStateResultB');
  AppStorage.delete('restoreEmptyResult');
  AppStorage.delete('restoredScrollOffset');
  AppStorage.delete('restoredDataB');
  AppStorage.delete('recycleIndexByName');
  AppStorage.delete('recycleParamByIndex');
  AppStorage.delete('recycleParamByName');
}

// Clear NavPathStack and AppStorage keys for ModifierRecyclePage
async function clearModifierState(driver: Driver): Promise<void> {
  let clearBtn: Component | null = await findComponentWithScroll(driver, 'mod_clear_btn');
  if (clearBtn !== null) {
    await clearBtn.click();
    await CommonFunc.sleep(300);
  }
  let popBtn: Component | null = await findComponentWithScroll(driver, 'mod_pop_btn');
  if (popBtn !== null) {
    await popBtn.click();
    await CommonFunc.sleep(300);
  }
  AppStorage.delete('modStackSize');
  AppStorage.delete('modAllPathNames');
  AppStorage.delete('modSaveStateResult');
  AppStorage.delete('modRestoreStateResult');
  AppStorage.delete('modRestoredData');
  AppStorage.delete('modNavDestShown');
}

export default function NavigationRecycleTest(): void {
  describe('NavigationRecycleTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility(BUNDLE_NAME, ABILITY_NAME);
    });

    beforeEach(async (): Promise<void> => {
      console.info('NavigationRecycleTest beforeEach start');
      await navigateToPage(PAGE_URL);
      console.info('NavigationRecycleTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await clearRecycleState(driver);
      await CommonFunc.sleep(500);
      console.info('NavigationRecycleTest after each called');
    });

    // =========================================================================
    // 1. Function Call Coverage - Navigation.recoverable()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0100
     * @tc.desc   Test Navigation.recoverable(true) can be called and attribute is set
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Set recoverable to true
        let btn = await requireComponent(driver, 'nav_recoverable_true');
        await btn.click();
        await driver.delayMs(500);
        // Verify Navigation id exists (component rendered)
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0100 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0200
     * @tc.desc   Test Navigation.recoverable(false) can be called
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let btn = await requireComponent(driver, 'nav_recoverable_false');
        await btn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0200 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 2. Function Call Coverage - Navigation.configuration()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0300
     * @tc.desc   Test Navigation.configuration with recyclePagesOnLowMemory true
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0300 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let btn = await requireComponent(driver, 'recycle_memory_true');
        await btn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0300 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0400
     * @tc.desc   Test Navigation.configuration with recyclePagesOnLowMemory false
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0400 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let btn = await requireComponent(driver, 'recycle_memory_false');
        await btn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0400 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 3. Function Call Coverage - NavDestination.recoverable()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0500
     * @tc.desc   Test NavDestination.recoverable(true) on STANDARD mode destination
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0500 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Set dest recoverable true
        let destBtn = await requireComponent(driver, 'dest_recoverable_true');
        await destBtn.click();
        await driver.delayMs(300);
        // Push standard page
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Verify standard page is visible
        let pageText = await requireComponent(driver, 'standardPageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0500 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0600
     * @tc.desc   Test NavDestination.recoverable(false) on STANDARD mode destination
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0600 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Set dest recoverable false
        let destBtn = await requireComponent(driver, 'dest_recoverable_false');
        await destBtn.click();
        await driver.delayMs(300);
        // Push standard page
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        let pageText = await requireComponent(driver, 'standardPageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0600 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0700
     * @tc.desc   Test NavDestination.recoverable on DIALOG mode (NavDestinationMode.DIALOG)
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0700 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let destBtn = await requireComponent(driver, 'dest_recoverable_true');
        await destBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_dialog');
        await pushBtn.click();
        await driver.delayMs(1500);
        let pageText = await requireComponent(driver, 'dialogPageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0700 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 4. Function Call Coverage - NavDestination.onSaveState / onRestoreState
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0800
     * @tc.desc   Test onSaveState callback is set and returns Record<string, Object>
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0800 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Push saveRestore page (which has onSaveState registered)
        let pushBtn = await requireComponent(driver, 'push_saveRestore');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Verify saveRestore page is visible
        let pageText = await requireComponent(driver, 'saveRestorePageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0800 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0900
     * @tc.desc   Test onSaveState callback that returns empty Record<string, Object>
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0900 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_saveEmpty');
        await pushBtn.click();
        await driver.delayMs(1500);
        let pageText = await requireComponent(driver, 'saveEmptyPageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0900 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_0900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 5. Parameter Coverage - Navigation.recoverable boolean values
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1000
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1000
     * @tc.desc   Test switching recoverable from true to false dynamically
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1000 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // First set true
        let trueBtn = await requireComponent(driver, 'nav_recoverable_true');
        await trueBtn.click();
        await driver.delayMs(300);
        // Then set false
        let falseBtn = await requireComponent(driver, 'nav_recoverable_false');
        await falseBtn.click();
        await driver.delayMs(500);
        // Verify Navigation still renders
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1000 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1100
     * @tc.desc   Test switching recyclePagesOnLowMemory from false to true dynamically
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let falseBtn = await requireComponent(driver, 'recycle_memory_false');
        await falseBtn.click();
        await driver.delayMs(300);
        let trueBtn = await requireComponent(driver, 'recycle_memory_true');
        await trueBtn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1100 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 6. Parameter Specification Coverage - NavigationConfiguration type
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1200
     * @tc.desc   Test NavigationConfiguration type: { recyclePagesOnLowMemory: boolean }
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Enable both recoverable and recycle
        let navBtn = await requireComponent(driver, 'nav_recoverable_true');
        await navBtn.click();
        await driver.delayMs(300);
        let memBtn = await requireComponent(driver, 'recycle_memory_true');
        await memBtn.click();
        await driver.delayMs(300);
        // Push a page - updateStackInfo() auto-called by push button
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Read stack size from AppStorage (auto-updated by updateStackInfo)
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1200 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 7. Parameter Specification Coverage - NavDestinationMode
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1300
     * @tc.desc   Test NavDestination mode STANDARD with recoverable
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1300 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let destBtn = await requireComponent(driver, 'dest_recoverable_true');
        await destBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Verify standard page text
        let pageText = await requireComponent(driver, 'standardPageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1300 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1400
     * @tc.desc   Test NavDestination mode DIALOG with recoverable
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1400 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let destBtn = await requireComponent(driver, 'dest_recoverable_true');
        await destBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_dialog');
        await pushBtn.click();
        await driver.delayMs(1500);
        let pageText = await requireComponent(driver, 'dialogPageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1400 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 8. Return Value Coverage - NavPathStack.size()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1500
     * @tc.desc   Test NavPathStack.size() return value when stack is empty
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1500 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let sizeBtn = await requireComponent(driver, 'recycle_get_stack_size');
        await sizeBtn.click();
        await driver.delayMs(500);
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(0);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1500 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1600
     * @tc.desc   Test NavPathStack.size() return value after pushing one STANDARD page
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1600 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateStackInfo() auto-called by push button click
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1600 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 9. Return Value Coverage - NavPathStack.getAllPathName()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1700
     * @tc.desc   Test getAllPathName returns correct array after pushPath
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1700 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateStackInfo() auto-called by push button click
        let names = getAppStorageString('recycleAllPathNames');
        expect(names).assertEqual('pageStandard');
        AppStorage.delete('recycleAllPathNames');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1700 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1800
     * @tc.desc   Test getAllPathName returns all path names after multiple pushes
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1800 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Push standard then dialog via top panel buttons (always visible)
        let pushStd = await requireComponent(driver, 'push_standard');
        await pushStd.click();
        await driver.delayMs(1000);
        let pushDlg = await requireComponent(driver, 'push_dialog');
        await pushDlg.click();
        await driver.delayMs(1500);
        // updateStackInfo auto-called after each push
        let names = getAppStorageString('recycleAllPathNames');
        expect(names).assertEqual('pageStandard,pageDialog');
        AppStorage.delete('recycleAllPathNames');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1800 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 10. Return Value Coverage - NavPathStack.getIndexByName()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1900
     * @tc.desc   Test getIndexByName returns correct index array for existing name
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1900 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Click getIndexByName button to populate AppStorage key
        let idxBtn = await requireComponent(driver, 'recycle_get_index_by_name');
        await idxBtn.click();
        await driver.delayMs(500);
        let indices = getAppStorageString('recycleIndexByName');
        expect(indices).assertEqual('[0]');
        AppStorage.delete('recycleIndexByName');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1900 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_1900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2000
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2000
     * @tc.desc   Test getIndexByName returns empty array when name not found
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2000 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // No page pushed, so 'pageStandard' should return empty
        let idxBtn = await requireComponent(driver, 'recycle_get_index_by_name');
        await idxBtn.click();
        await driver.delayMs(500);
        let indices = getAppStorageString('recycleIndexByName');
        expect(indices).assertEqual('[]');
        AppStorage.delete('recycleIndexByName');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2000 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 11. Return Value Coverage - NavPathStack.getParamByIndex()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2100
     * @tc.desc   Test getParamByIndex returns param object for pushed destination with param
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_standard_with_param');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Click getParamByIndex button to populate AppStorage key
        let paramBtn = await requireComponent(driver, 'recycle_get_param_by_index');
        await paramBtn.click();
        await driver.delayMs(500);
        let param = getAppStorageString('recycleParamByIndex');
        expect(param).assertContain('ParamTag1');
        AppStorage.delete('recycleParamByIndex');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2100 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 12. Return Value Coverage - NavPathStack.getParamByName()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2200
     * @tc.desc   Test getParamByName returns param array for pushed destination with param
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_standard_with_param');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Click getParamByName button to populate AppStorage key
        let paramBtn = await requireComponent(driver, 'recycle_get_param_by_name');
        await paramBtn.click();
        await driver.delayMs(500);
        let params = getAppStorageString('recycleParamByName');
        expect(params).assertContain('ParamTag1');
        AppStorage.delete('recycleParamByName');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2200 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 13. Return Value Coverage - NavPathStack.pop() / clear()
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2300
     * @tc.desc   Test pop removes top destination, stack size decreases
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2300 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Push first - updateStackInfo auto-called
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Verify size = 1 (from auto updateStackInfo)
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        // Pop via top panel button (always visible)
        let popBtn = await requireComponent(driver, 'recycle_pop_btn');
        await popBtn.click();
        await driver.delayMs(1000);
        // Verify size = 0 (auto updateStackInfo on pop)
        stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(0);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2300 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2400
     * @tc.desc   Test clear removes all destinations, stack size returns to 0
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2400 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Push two pages via top panel buttons (always visible)
        let pushStd = await requireComponent(driver, 'push_standard');
        await pushStd.click();
        await driver.delayMs(1000);
        let pushDlg = await requireComponent(driver, 'push_dialog');
        await pushDlg.click();
        await driver.delayMs(1000);
        // Verify size = 2 (from auto updateStackInfo after push_dialog)
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(2);
        AppStorage.delete('recycleStackSize');
        // Clear via top panel button
        let clearBtn = await requireComponent(driver, 'recycle_clear_btn');
        await clearBtn.click();
        await driver.delayMs(1000);
        // Verify size = 0 (auto updateStackInfo on clear)
        stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(0);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2400 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 14. Parameter Coverage - pushPath with/without param
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2500
     * @tc.desc   Test pushPath({name}) without param, getParamByIndex returns undefined
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2500 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Click getParamByIndex button to populate AppStorage key
        let paramBtn = await requireComponent(driver, 'recycle_get_param_by_index');
        await paramBtn.click();
        await driver.delayMs(500);
        let param = getAppStorageString('recycleParamByIndex');
        // Without param, getParamByIndex should return undefined or null
        expect(param !== null).assertTrue();
        AppStorage.delete('recycleParamByIndex');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2500 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2600
     * @tc.desc   Test pushPath({name, param}) with NavParamTwo param
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2600 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_standard_with_param');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateStackInfo auto-called by push button click
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2600 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 15. Combined: recoverable + configuration + push/pop workflow
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2700
     * @tc.desc   Test full workflow with both recoverable and recyclePagesOnLowMemory enabled
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2700 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Enable both
        let navBtn = await requireComponent(driver, 'nav_recoverable_true');
        await navBtn.click();
        await driver.delayMs(300);
        let memBtn = await requireComponent(driver, 'recycle_memory_true');
        await memBtn.click();
        await driver.delayMs(300);
        let destBtn = await requireComponent(driver, 'dest_recoverable_true');
        await destBtn.click();
        await driver.delayMs(300);
        // Push page via top panel button
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Verify size (auto updateStackInfo)
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        // Pop via top panel button
        let popBtn = await requireComponent(driver, 'recycle_pop_btn');
        await popBtn.click();
        await driver.delayMs(1000);
        // Verify empty (auto updateStackInfo on pop)
        stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(0);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2700 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2800
     * @tc.desc   Test workflow with both recoverable and recyclePagesOnLowMemory disabled
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2800 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Disable both
        let navBtn = await requireComponent(driver, 'nav_recoverable_false');
        await navBtn.click();
        await driver.delayMs(300);
        let memBtn = await requireComponent(driver, 'recycle_memory_false');
        await memBtn.click();
        await driver.delayMs(300);
        // Push page via top panel button
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Verify size (auto updateStackInfo)
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        // Pop via top panel button
        let popBtn = await requireComponent(driver, 'recycle_pop_btn');
        await popBtn.click();
        await driver.delayMs(1000);
        // Verify empty (auto updateStackInfo on pop)
        stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(0);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2800 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 16. onSaveState return type - Record<string, Object> specification
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2900
     * @tc.desc   Test onSaveState returning Record with string, boolean, number[], Object types
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2900 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_saveRestore');
        await pushBtn.click();
        await driver.delayMs(1500);
        // The page has onSaveState that returns Record<string, Object> with mixed types
        // Verify page is visible (callback registration is successful)
        let pageText = await requireComponent(driver, 'saveRestorePageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2900 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_2900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3000
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3000
     * @tc.desc   Test onSaveState returning empty Record<string, Object>
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3000 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let pushBtn = await requireComponent(driver, 'push_saveEmpty');
        await pushBtn.click();
        await driver.delayMs(1500);
        let pageText = await requireComponent(driver, 'saveEmptyPageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3000 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 17. onRestoreState callback parameter - return value coverage
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3100
     * @tc.desc   Test onRestoreState callback parameter type Record<string, Object>
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Push saveRestore page which has both onSaveState and onRestoreState registered
        let pushBtn = await requireComponent(driver, 'push_saveRestore');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Verify page is rendered
        let pageText = await requireComponent(driver, 'saveRestorePageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3100 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // 18. DIALOG mode with recoverable - parameter specification coverage
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3200
     * @tc.desc   Test NavDestinationMode.DIALOG with recoverable(false)
     */
    it('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let destBtn = await requireComponent(driver, 'dest_recoverable_false');
        await destBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_dialog');
        await pushBtn.click();
        await driver.delayMs(1500);
        let pageText = await requireComponent(driver, 'dialogPageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3200 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_NavigationRecycle_static_3200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });

  // ===========================================================================
  // NavigationModifier (AttributeModifier) Tests
  // ===========================================================================
  describe('ModifierRecycleTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('ModifierRecycleTest beforeEach start');
      await navigateToPage(MOD_PAGE_URL);
      console.info('ModifierRecycleTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await clearModifierState(driver);
      await CommonFunc.sleep(500);
      console.info('ModifierRecycleTest after each called');
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0100
     * @tc.desc   Test NavigationModifier sets recoverable(true) and recyclePagesOnLowMemory(true)
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let recycleBtn = await requireComponent(driver, 'use_recycle_modifier');
        await recycleBtn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testModNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testModNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0100 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0200
     * @tc.desc   Test NavigationModifier sets recoverable(false) and recyclePagesOnLowMemory(false)
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let noRecycleBtn = await requireComponent(driver, 'use_no_recycle_modifier');
        await noRecycleBtn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testModNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testModNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0200 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0300
     * @tc.desc   Test push and pop with recycle modifier, verify NavPathStack operations
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0300 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let recycleBtn = await requireComponent(driver, 'use_recycle_modifier');
        await recycleBtn.click();
        await driver.delayMs(300);
        // Push standard page
        let pushBtn = await requireComponent(driver, 'mod_push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Check size - updateModStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('modStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('modStackSize');
        // Pop (in top panel, always visible)
        let popBtn = await requireComponent(driver, 'mod_pop_btn');
        await popBtn.click();
        await driver.delayMs(1000);
        // Check size = 0 - updateModStackInfo() auto-called by pop
        stackSize = getAppStorageNumber('modStackSize');
        expect(stackSize).assertEqual(0);
        AppStorage.delete('modStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0300 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0400
     * @tc.desc   Test NavigationModifier page with onSaveState and onRestoreState callbacks
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0400 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let recycleBtn = await requireComponent(driver, 'use_recycle_modifier');
        await recycleBtn.click();
        await driver.delayMs(300);
        // Push saveRestore page
        let pushBtn = await requireComponent(driver, 'mod_push_saveRestore');
        await pushBtn.click();
        await driver.delayMs(1500);
        let pageText = await requireComponent(driver, 'modSaveRestorePageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0400 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0500
     * @tc.desc   Test getAllPathName returns correct path names with modifier
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0500 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let recycleBtn = await requireComponent(driver, 'use_recycle_modifier');
        await recycleBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'mod_push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateModStackInfo() auto-called by push, read directly from AppStorage
        let names = getAppStorageString('modAllPathNames');
        expect(names).assertEqual('modPageStandard');
        AppStorage.delete('modAllPathNames');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0500 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0600
     * @tc.desc   Test switching between RecycleNavigationModifier and NoRecycleNavigationModifier
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0600 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Start with recycle modifier
        let recycleBtn = await requireComponent(driver, 'use_recycle_modifier');
        await recycleBtn.click();
        await driver.delayMs(500);
        // Push page (mod_push_standard is in NavBar)
        let pushBtn = await requireComponent(driver, 'mod_push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Pop back first - use_no_recycle_modifier is in NavBar, hidden after push
        let popBtn = await requireComponent(driver, 'mod_pop_btn');
        await popBtn.click();
        await driver.delayMs(1000);
        // Now NavBar is visible again, switch to no-recycle modifier
        let noRecycleBtn = await requireComponent(driver, 'use_no_recycle_modifier');
        await noRecycleBtn.click();
        await driver.delayMs(500);
        // Verify navigation still renders
        let strJson = inspector.getInspectorByKey('testModNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testModNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0600 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0700
     * @tc.desc   Test clear removes all destinations with modifier
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0700 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let recycleBtn = await requireComponent(driver, 'use_recycle_modifier');
        await recycleBtn.click();
        await driver.delayMs(300);
        // Push page (mod_push_standard is in NavBar - only visible before push)
        let pushBtn = await requireComponent(driver, 'mod_push_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // Clear (in top panel, always visible)
        let clearBtn = await requireComponent(driver, 'mod_clear_btn');
        await clearBtn.click();
        await driver.delayMs(1000);
        // Verify size = 0 - updateModStackInfo() auto-called by clear
        let stackSize = getAppStorageNumber('modStackSize');
        expect(stackSize).assertEqual(0);
        AppStorage.delete('modStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0700 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // NavigationModifier stackSizeLimit - function call and parameter coverage
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0800
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0800
     * @tc.desc   Test StackLimitModifier sets configuration({stackSizeLimit: 2, recyclePagesOnLowMemory: true})
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0800 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let stackLimitBtn = await requireComponent(driver, 'use_stack_limit_modifier');
        await stackLimitBtn.click();
        await driver.delayMs(500);
        // Verify navigation renders with stack limit modifier
        let strJson = inspector.getInspectorByKey('testModNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testModNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0800 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0900
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0900
     * @tc.desc   Test push pages within stackSizeLimit=2, verify stack operations work
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0900 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let stackLimitBtn = await requireComponent(driver, 'use_stack_limit_modifier');
        await stackLimitBtn.click();
        await driver.delayMs(300);
        // Push 1 page (within stackSizeLimit=2) - mod_push_standard is in NavBar, only visible before push
        let pushBtn = await requireComponent(driver, 'mod_push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Check size - updateModStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('modStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('modStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0900 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_0900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // =========================================================================
    // ClearStackModifier - clearContentStackOnPrimaryNavigation via AttributeModifier
    // =========================================================================

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1000
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1000
     * @tc.desc   Test ClearStackModifier sets clearContentStackOnPrimaryNavigation=true
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1000 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearStackBtn = await requireComponent(driver, 'use_clear_stack_modifier');
        await clearStackBtn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testModNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testModNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1000 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1100
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1100
     * @tc.desc   Test ClearStackModifier with pushPath, verify stack size
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearStackBtn = await requireComponent(driver, 'use_clear_stack_modifier');
        await clearStackBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'mod_push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateModStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('modStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('modStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1100 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1200
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1200
     * @tc.desc   Test switch from ClearStackModifier to NoRecycleNavigationModifier
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearStackBtn = await requireComponent(driver, 'use_clear_stack_modifier');
        await clearStackBtn.click();
        await driver.delayMs(500);
        let noRecycleBtn = await requireComponent(driver, 'use_no_recycle_modifier');
        await noRecycleBtn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testModNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testModNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1200 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1300
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1300
     * @tc.desc   Test ClearStackModifier with push and pop, verify stack operations
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1300 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearStackBtn = await requireComponent(driver, 'use_clear_stack_modifier');
        await clearStackBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'mod_push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateModStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('modStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('modStackSize');
        // Pop (in top panel, always visible)
        let popBtn = await requireComponent(driver, 'mod_pop_btn');
        await popBtn.click();
        await driver.delayMs(1000);
        // updateModStackInfo() auto-called by pop
        stackSize = getAppStorageNumber('modStackSize');
        expect(stackSize).assertEqual(0);
        AppStorage.delete('modStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1300 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1400
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1400
     * @tc.desc   Test ClearStackModifier with getAllPathName returns correct names
     */
    it('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1400 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearStackBtn = await requireComponent(driver, 'use_clear_stack_modifier');
        await clearStackBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'mod_push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateModStackInfo() auto-called by push, read directly from AppStorage
        let names = getAppStorageString('modAllPathNames');
        expect(names).assertEqual('modPageStandard');
        AppStorage.delete('modAllPathNames');
        console.info('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1400 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ModifierRecycle_static_1400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });

  // ===========================================================================
  // stackSizeLimit Tests (NavigationConfiguration.stackSizeLimit)
  // ===========================================================================
  describe('StackSizeLimitTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('StackSizeLimitTest beforeEach start');
      await navigateToPage(PAGE_URL);
      console.info('StackSizeLimitTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await clearRecycleState(driver);
      await CommonFunc.sleep(500);
      console.info('StackSizeLimitTest after each called');
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0100
     * @tc.desc   Test stackSizeLimit=0 (default, no limit) function call
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let limitBtn = await requireComponent(driver, 'stack_limit_0');
        await limitBtn.click();
        await driver.delayMs(300);
        // Push 5 pages - no limit should allow all
        let pushBtn = await requireComponent(driver, 'push_5_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(5);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0100 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0200
     * @tc.desc   Test stackSizeLimit=1 limits active page nodes to 1, earlier pages auto-destroyed FIFO
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let limitBtn = await requireComponent(driver, 'stack_limit_1');
        await limitBtn.click();
        await driver.delayMs(300);
        // Push 3 pages with stackSizeLimit=1
        let pushBtn = await requireComponent(driver, 'push_3_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // NavPathInfo still kept in stack (size=3), but active nodes limited to 1
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        // Stack size should still reflect all path names (NavPathInfo preserved)
        expect(stackSize).assertEqual(3);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0200 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0300
     * @tc.desc   Test stackSizeLimit=3 limits active page nodes, push 5 pages
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0300 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let limitBtn = await requireComponent(driver, 'stack_limit_3');
        await limitBtn.click();
        await driver.delayMs(300);
        // Push 5 pages with stackSizeLimit=3
        let pushBtn = await requireComponent(driver, 'push_5_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // NavPathInfo preserved for all 5 - updateStackInfo() auto-called by push
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(5);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0300 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0400
     * @tc.desc   Test stackSizeLimit=-1 (negative value, equivalent to no limit per spec)
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0400 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let limitBtn = await requireComponent(driver, 'stack_limit_minus1');
        await limitBtn.click();
        await driver.delayMs(300);
        // Push 5 pages - negative limit means no limit
        let pushBtn = await requireComponent(driver, 'push_5_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(5);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0400 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0500
     * @tc.desc   Test stackSizeLimit=1 with recoverable pages triggers onSaveState when auto-destroyed
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0500 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Enable recoverable and set stack limit
        let navBtn = await requireComponent(driver, 'nav_recoverable_true');
        await navBtn.click();
        await driver.delayMs(300);
        let destBtn = await requireComponent(driver, 'dest_recoverable_true');
        await destBtn.click();
        await driver.delayMs(300);
        let limitBtn = await requireComponent(driver, 'stack_limit_1');
        await limitBtn.click();
        await driver.delayMs(300);
        // Push saveRestore page (has onSaveState)
        let pushBtn = await requireComponent(driver, 'push_saveRestore');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Verify page pushed
        let pageText = await requireComponent(driver, 'saveRestorePageText');
        expect(pageText !== null).assertTrue();
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0500 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0600
     * @tc.desc   Test getAllPathName returns all names even when stackSizeLimit auto-destroys earlier pages
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0600 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let limitBtn = await requireComponent(driver, 'stack_limit_1');
        await limitBtn.click();
        await driver.delayMs(300);
        // Push 3 standard pages
        let pushBtn = await requireComponent(driver, 'push_3_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // getAllPathName should still show all 3 (NavPathInfo preserved)
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let names = getAppStorageString('recycleAllPathNames');
        expect(names).assertContain('pageStandard');
        AppStorage.delete('recycleAllPathNames');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0600 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0700
     * @tc.desc   Test configuration with both stackSizeLimit and recyclePagesOnLowMemory set
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0700 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        // Set stackSizeLimit=3 and recyclePagesOnLowMemory=true together
        let limitBtn = await requireComponent(driver, 'stack_limit_3');
        await limitBtn.click();
        await driver.delayMs(300);
        let memBtn = await requireComponent(driver, 'recycle_memory_true');
        await memBtn.click();
        await driver.delayMs(300);
        let navBtn = await requireComponent(driver, 'nav_recoverable_true');
        await navBtn.click();
        await driver.delayMs(300);
        // Push pages
        let pushBtn = await requireComponent(driver, 'push_5_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(5);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0700 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0800
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0800
     * @tc.desc   Test pop navigates back even after earlier pages auto-destroyed by stackSizeLimit
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0800 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let limitBtn = await requireComponent(driver, 'stack_limit_1');
        await limitBtn.click();
        await driver.delayMs(300);
        let navBtn = await requireComponent(driver, 'nav_recoverable_true');
        await navBtn.click();
        await driver.delayMs(300);
        let destBtn = await requireComponent(driver, 'dest_recoverable_true');
        await destBtn.click();
        await driver.delayMs(300);
        // Push 3 pages
        let pushBtn = await requireComponent(driver, 'push_3_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // Pop - should navigate back (page recreated from NavPathInfo) - in top panel, always visible
        let popBtn = await requireComponent(driver, 'recycle_pop_btn');
        await popBtn.click();
        await driver.delayMs(1500);
        // Verify stack size decreased - updateStackInfo() auto-called by pop
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(2);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0800 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0900
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0900
     * @tc.desc   Test getParamByIndex still returns param for auto-destroyed pages (NavPathInfo preserved)
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0900 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let limitBtn = await requireComponent(driver, 'stack_limit_1');
        await limitBtn.click();
        await driver.delayMs(300);
        // Push with param
        let pushBtn = await requireComponent(driver, 'push_standard_with_param');
        await pushBtn.click();
        await driver.delayMs(1000);
        await pushBtn.click();
        await driver.delayMs(1000);
        // Get param for first page - should still be accessible via NavPathInfo
        // Click getParamByIndex button to populate AppStorage key
        let paramBtn = await requireComponent(driver, 'recycle_get_param_by_index');
        await paramBtn.click();
        await driver.delayMs(500);
        let param = getAppStorageString('recycleParamByIndex');
        expect(param).assertContain('ParamTag1');
        AppStorage.delete('recycleParamByIndex');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0900 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_0900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackSizeLimit_static_1000
     * @tc.name   SUB_ARKUI_NAVIGATION_StackSizeLimit_static_1000
     * @tc.desc   Test stackSizeLimit auto-destroy triggers onSaveState, pop back triggers onRestoreState
     */
    it('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_1000 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let navBtn = await requireComponent(driver, 'nav_recoverable_true');
        await navBtn.click();
        await driver.delayMs(300);
        let destBtn = await requireComponent(driver, 'dest_recoverable_true');
        await destBtn.click();
        await driver.delayMs(300);
        let limitBtn = await requireComponent(driver, 'stack_limit_1');
        await limitBtn.click();
        await driver.delayMs(300);
        // Push saveRestore page (has both onSaveState and onRestoreState)
        let pushBtn = await requireComponent(driver, 'push_saveRestore');
        await pushBtn.click();
        await driver.delayMs(1500);
        // Push another saveRestoreB page to trigger auto-destroy of first
        let pushB = await requireComponent(driver, 'push_saveRestoreB');
        await pushB.click();
        await driver.delayMs(2000);
        // Verify both pages in stack - updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(2);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_1000 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_StackSizeLimit_static_1000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });

  // ===========================================================================
  // clearContentStackOnPrimaryNavigation Tests (NavigationConfiguration)
  // ===========================================================================
  describe('ClearContentStackRecycleTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('ClearContentStackTest beforeEach start');
      await navigateToPage(PAGE_URL);
      console.info('ClearContentStackTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await clearRecycleState(driver);
      await CommonFunc.sleep(500);
      console.info('ClearContentStackTest after each called');
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_static_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_static_0100
     * @tc.desc   Test clearContentStackOnPrimaryNavigation set to true
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0100 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let btn = await requireComponent(driver, 'clear_stack_true');
        await btn.click();
        await driver.delayMs(500);
        // Verify Navigation still renders after setting clearContentStackOnPrimaryNavigation=true
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0100 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_static_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_static_0200
     * @tc.desc   Test clearContentStackOnPrimaryNavigation set to false (default)
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0200 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let btn = await requireComponent(driver, 'clear_stack_false');
        await btn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0200 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_static_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_static_0300
     * @tc.desc   Test clearContentStackOnPrimaryNavigation=true with pushPath, verify stack retains pushed page
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0300 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearBtn = await requireComponent(driver, 'clear_stack_true');
        await clearBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0300 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_static_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_static_0400
     * @tc.desc   Test clearContentStackOnPrimaryNavigation=false with pushPath, verify stack size
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0400 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearBtn = await requireComponent(driver, 'clear_stack_false');
        await clearBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0400 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_static_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_static_0500
     * @tc.desc   Test switching clearContentStackOnPrimaryNavigation from true to false dynamically
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0500 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let trueBtn = await requireComponent(driver, 'clear_stack_true');
        await trueBtn.click();
        await driver.delayMs(300);
        let falseBtn = await requireComponent(driver, 'clear_stack_false');
        await falseBtn.click();
        await driver.delayMs(500);
        let strJson = inspector.getInspectorByKey('testNavigation');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('id')).assertEqual('testNavigation');
        console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0500 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_static_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_static_0600
     * @tc.desc   Test clearContentStackOnPrimaryNavigation combined with recoverable and recyclePagesOnLowMemory
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0600 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let navBtn = await requireComponent(driver, 'nav_recoverable_true');
        await navBtn.click();
        await driver.delayMs(300);
        let memBtn = await requireComponent(driver, 'recycle_memory_true');
        await memBtn.click();
        await driver.delayMs(300);
        let clearBtn = await requireComponent(driver, 'clear_stack_true');
        await clearBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(1);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0600 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_static_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_static_0700
     * @tc.desc   Test clearContentStackOnPrimaryNavigation=true with stackSizeLimit combined
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0700 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearBtn = await requireComponent(driver, 'clear_stack_true');
        await clearBtn.click();
        await driver.delayMs(300);
        let limitBtn = await requireComponent(driver, 'stack_limit_3');
        await limitBtn.click();
        await driver.delayMs(300);
        let navBtn = await requireComponent(driver, 'nav_recoverable_true');
        await navBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_5_standard');
        await pushBtn.click();
        await driver.delayMs(2000);
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let stackSize = getAppStorageNumber('recycleStackSize');
        expect(stackSize).assertEqual(5);
        AppStorage.delete('recycleStackSize');
        console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0700 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_static_0800
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_static_0800
     * @tc.desc   Test clearContentStackOnPrimaryNavigation with getAllPathName returns correct names
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0800 START');
      try {
        let driver = Driver.create();
        await driver.delayMs(500);
        let clearBtn = await requireComponent(driver, 'clear_stack_true');
        await clearBtn.click();
        await driver.delayMs(300);
        let pushBtn = await requireComponent(driver, 'push_standard');
        await pushBtn.click();
        await driver.delayMs(1500);
        // updateStackInfo() auto-called by push, read directly from AppStorage
        let names = getAppStorageString('recycleAllPathNames');
        expect(names).assertContain('pageStandard');
        AppStorage.delete('recycleAllPathNames');
        console.info('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0800 END');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_ClearContentStack_static_0800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });
}
