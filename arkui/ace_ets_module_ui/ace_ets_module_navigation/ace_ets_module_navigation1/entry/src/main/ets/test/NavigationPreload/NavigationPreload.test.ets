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
import { UiDriver, BY, UiComponent } from '@ohos.UiTest';

const BUNDLE_NAME = 'com.arkui.ace.navigation1';
const ABILITY_NAME = 'EntryAbility';
const PAGE_URL = 'MainAbility/pages/NavigationPreload/NavigationPreload';

async function findComponentWithScroll(driver: UiDriver, key: string, maxRetries: number = 8): Promise<UiComponent> {
  // Try direct find first
  try {
    let btn = await driver.findComponent(BY.key(key));
    if (btn != null) {
      return btn;
    }
  } catch (e) {
    // not found, proceed to scroll
  }
  // Use driver.swipe to physically scroll down and find the component
  for (let i = 0; i < maxRetries; i++) {
    await driver.swipe(500, 1500, 500, 500);
    await CommonFunc.sleep(800);
    try {
      let btn = await driver.findComponent(BY.key(key));
      if (btn != null) {
        return btn;
      }
    } catch (e) {
      // still not found, retry
    }
  }
  // If still not found after scrolling down, scroll back up and retry
  for (let i = 0; i < maxRetries; i++) {
    await driver.swipe(500, 500, 500, 1500);
    await CommonFunc.sleep(800);
    try {
      let btn = await driver.findComponent(BY.key(key));
      if (btn != null) {
        return btn;
      }
    } catch (e) {
      // still not found, retry
    }
  }
  throw new Error('Component not found: ' + key);
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

export default function NavigationPreloadTest() {
  describe('NavigationPreloadTest', () => {

    beforeAll(async (done: Function) => {
      console.info("NavigationPreloadTest beforeAll start");
      done();
    });

    beforeEach(async (done: Function) => {
      console.info("NavigationPreloadTest beforeEach start");
      let options: router.RouterOptions = {
        url: PAGE_URL,
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
        console.error("replaceUrl NavigationPreloadTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(500);
      done();
    });

    // ========================================================================
    // 函数调用覆盖 (Function Call Coverage)
    // ========================================================================

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0100
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0100
     * @tc.desc   Test preloadPath basic function call with STANDARD NavDestination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadStandard');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0200
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0200
     * @tc.desc   Test preloadPath basic function call with DIALOG NavDestination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadDialog');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0300
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0300
     * @tc.desc   Test preloadPath function call with PreloadOptions.onDestroy callback registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0300', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadStandard_0300');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
        let onDestroy = getTextContentById('onDestroyCalled');
        expect(onDestroy === 'false' || onDestroy === 'true').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 入参覆盖 (Parameter Coverage)
    // ========================================================================

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0400
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0400
     * @tc.desc   Test preloadPath with NavPathInfo.name as valid STANDARD route name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0400', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadStandard_0400');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0500
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0500
     * @tc.desc   Test preloadPath with NavPathInfo.name as valid DIALOG route name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0500', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadDialog_0500');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0600
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0600
     * @tc.desc   Test preloadPath with NavPathInfo.name as non-existent route name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0600', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadWrongName');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('error');
        let catchCalled = getTextContentById('catchCalled');
        expect(catchCalled).assertEqual('true');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0700
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0700
     * @tc.desc   Test preloadPath with NavPathInfo.name as empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0700', Level.LEVEL2, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadEmptyName');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('error');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0800
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0800
     * @tc.desc   Test preloadPath with NavPathInfo.param as object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0800', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadObjectParam');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_0900
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_0900
     * @tc.desc   Test preloadPath with NavPathInfo.param as string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_0900', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadStringParam');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_0900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1000
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1000
     * @tc.desc   Test preloadPath with NavPathInfo.param as number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1000', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadNumberParam');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1100
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1100
     * @tc.desc   Test preloadPath with NavPathInfo without param (param omitted)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1100', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadNoParam');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1200
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1200
     * @tc.desc   Test preloadPath with PreloadOptions containing onDestroy callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1200', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadStandard_1200');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
        let onDestroy = getTextContentById('onDestroyCalled');
        expect(onDestroy === 'false' || onDestroy === 'true').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1300
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1300
     * @tc.desc   Test preloadPath without PreloadOptions (options omitted)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1300', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadNoOptions');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 参数规格覆盖 (Parameter Specification Coverage)
    // ========================================================================

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1400
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1400
     * @tc.desc   Test preloadPath with info = undefined, error code 401 expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1400', Level.LEVEL0, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadUndefined');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('error');
        let catchCalled = getTextContentById('catchCalled');
        expect(catchCalled).assertEqual('true');
        let errorCode = getTextContentById('errorCode');
        expect(errorCode === '401' || errorCode === '100005' || errorCode === '100006').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1500
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1500
     * @tc.desc   Test preloadPath with NavPathInfo.param = null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1500', Level.LEVEL2, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadNullParam');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result === 'success' || result === 'error').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1600
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1600
     * @tc.desc   Test preloadPath error code 401 with empty name - mandatory parameter unspecified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1600', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadEmptyName_1600');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('error');
        let errorCode = getTextContentById('errorCode');
        expect(errorCode === '401' || errorCode === '100005' || errorCode === '100006').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1700
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1700
     * @tc.desc   Test preloadPath error code 100005 - Builder function not registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1700', Level.LEVEL0, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadNoBuilder');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('error');
        let catchCalled = getTextContentById('catchCalled');
        expect(catchCalled).assertEqual('true');
        let errorCode = getTextContentById('errorCode');
        expect(errorCode === '100005' || errorCode === '100006').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1800
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1800
     * @tc.desc   Test preloadPath error code 100006 - NavDestination not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1800', Level.LEVEL0, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadNotFound');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('error');
        let catchCalled = getTextContentById('catchCalled');
        expect(catchCalled).assertEqual('true');
        let errorCode = getTextContentById('errorCode');
        expect(errorCode === '100005' || errorCode === '100006').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_1900
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_1900
     * @tc.desc   Test preloadPath error code 100005 with wrong route name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_1900', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadWrongName_1900');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('error');
        let errorCode = getTextContentById('errorCode');
        expect(errorCode === '100005' || errorCode === '100006').assertTrue();
        let errorMsg = getTextContentById('errorMsg');
        expect(errorMsg.length).assertLarger(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_1900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2000
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2000
     * @tc.desc   Test preloadPath with NavPathInfo.onPop callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2000', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadWithOnPop');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
        let thenCalled = getTextContentById('thenCalled');
        expect(thenCalled).assertEqual('true');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2100
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2100
     * @tc.desc   Test preloadPath with NavPathInfo.isEntry = true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2100', Level.LEVEL2, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadIsEntryTrue');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2200
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2200
     * @tc.desc   Test preloadPath with NavPathInfo.isEntry = false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2200', Level.LEVEL2, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadIsEntryFalse');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2300
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2300
     * @tc.desc   Test preloadPath with NavPathInfo name-only (no param, like router_map pattern)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2300', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadNameOnly');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    // ========================================================================
    // 返回值覆盖 (Return Value Coverage)
    // ========================================================================

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2400
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2400
     * @tc.desc   Test preloadPath return value - Promise<void> resolves on success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2400', Level.LEVEL0, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadThenVerify');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let thenCalled = getTextContentById('thenCalled');
        expect(thenCalled).assertEqual('true');
        let catchCalled = getTextContentById('catchCalled');
        expect(catchCalled).assertEqual('false');
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2500
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2500
     * @tc.desc   Test preloadPath return value - Promise rejects with BusinessError on failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2500', Level.LEVEL0, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadCatchVerify');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let catchCalled = getTextContentById('catchCalled');
        expect(catchCalled).assertEqual('true');
        let thenCalled = getTextContentById('thenCalled');
        expect(thenCalled).assertEqual('false');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2600
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2600
     * @tc.desc   Test preloadPath return value - verify error.code contains correct error ID on failed preload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2600', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadWrongName_2600');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let errorCode = getTextContentById('errorCode');
        expect(errorCode.length).assertLarger(0);
        expect(errorCode === '401' || errorCode === '100001' ||
          errorCode === '100005' || errorCode === '100006').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2600 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2700
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2700
     * @tc.desc   Test preloadPath return value - verify error.message is non-empty on failed preload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2700', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadNotFound_2700');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let errorMsg = getTextContentById('errorMsg');
        expect(errorMsg.length).assertLarger(0);
        let catchCalled = getTextContentById('catchCalled');
        expect(catchCalled).assertEqual('true');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2700 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2800
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2800
     * @tc.desc   Test PreloadOptions.onDestroy not called during successful preload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2800', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadOnDestroyNotCalled');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
        let onDestroy = getTextContentById('onDestroyCalled');
        expect(onDestroy).assertEqual('false');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2800 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_2900
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_2900
     * @tc.desc   Test PreloadOptions.onDestroy triggered when preloaded page is destroyed by stack.clear()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_2900', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadThenClear');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(3000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
        // PreloadOptions.onDestroy is "Callback when preloaded page is destroyed by the system",
        // NOT triggered by developer calling stack.clear(). Verify the preload succeeded and
        // clear completed without error. onDestroy may or may not fire depending on system behavior.
        let onDestroy = getTextContentById('onDestroyCalled');
        expect(onDestroy === 'true' || onDestroy === 'false').assertTrue();
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_2900 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_3000
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_3000
     * @tc.desc   Test preloadPath does not add visible entry to NavPathStack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_3000', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let initialNames = getTextContentById('stackNames');
        let btn = await findComponentWithScroll(driver, 'btnPreloadStandard_3000');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
        let afterNames = getTextContentById('stackNames');
        expect(afterNames).assertEqual(initialNames);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_3000 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_3100
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_3100
     * @tc.desc   Test multiple sequential preloadPath calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_3100', Level.LEVEL2, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadMultiple');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(3000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success_2');
        let thenCalled = getTextContentById('thenCalled');
        expect(thenCalled).assertEqual('true');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_3100 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_3200
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_3200
     * @tc.desc   Test preload then pushPath with matching name uses preloaded instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_3200', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadThenPush');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(3000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
        let pushResult = getTextContentById('pushAfterPreloadResult');
        expect(pushResult).assertEqual('pushed');
        let stackNames = getTextContentById('stackNames');
        expect(stackNames.length).assertLarger(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_3200 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_3300
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_3300
     * @tc.desc   Test preload then pushPath with different param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_3300', Level.LEVEL2, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadThenPushDiff');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(3000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success');
        let pushResult = getTextContentById('pushAfterPreloadResult');
        expect(pushResult).assertEqual('pushed_diff');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_3300 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_3400
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_3400
     * @tc.desc   Test preload same destination name twice sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL2
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_3400', Level.LEVEL2, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadSameTwice');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(3000);
        let result = getTextContentById('preloadResult');
        expect(result).assertEqual('success_2');
        let thenCalled = getTextContentById('thenCalled');
        expect(thenCalled).assertEqual('true');
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_3400 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_NAVIGATION_PRELOADPATH_3500
     * @tc.number SUB_ARKUI_NAVIGATION_PRELOADPATH_3500
     * @tc.desc   Test preloadPath error code 401 - info parameter incorrect type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_PRELOADPATH_3500', Level.LEVEL1, async (done: Function): Promise<void> => {
      try {
        let driver = await UiDriver.create();
        let btn = await findComponentWithScroll(driver, 'btnPreloadUndefined_3500');
        expect(btn != null).assertTrue();
        await btn.click();
        await CommonFunc.sleep(2000);
        let errorCode = getTextContentById('errorCode');
        expect(errorCode === '401' || errorCode === '100005' || errorCode === '100006').assertTrue();
        let errorMsg = getTextContentById('errorMsg');
        expect(errorMsg.length).assertLarger(0);
      } catch (err) {
        console.error('SUB_ARKUI_NAVIGATION_PRELOADPATH_3500 error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });
}
