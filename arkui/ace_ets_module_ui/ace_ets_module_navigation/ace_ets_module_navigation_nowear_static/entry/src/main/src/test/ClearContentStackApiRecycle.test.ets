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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../hypium/index';
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

function getAppStorageNumber(key: string): number {
  let val: number | undefined = AppStorage.get<number>(key);
  return val !== undefined ? val : 0;
}

function getAppStorageString(key: string): string {
  let val: string | undefined = AppStorage.get<string>(key);
  return val !== undefined ? val : '';
}

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

// Require component by id: asserts non-null and returns Component type
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
  let clearBtn: Component | null = await findComponentWithScroll(driver, 'recycle_clear_btn');
  if (clearBtn !== null) {
    await clearBtn.click();
    await CommonFunc.sleep(300);
  }
  let popBtn: Component | null = await findComponentWithScroll(driver, 'recycle_pop_btn');
  if (popBtn !== null) {
    await popBtn.click();
    await CommonFunc.sleep(300);
  }
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

export default function ClearContentStackApiRecycleTest(): void {
  describe('ClearContentStackApiRecycleTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility(BUNDLE_NAME, ABILITY_NAME);
    });

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
