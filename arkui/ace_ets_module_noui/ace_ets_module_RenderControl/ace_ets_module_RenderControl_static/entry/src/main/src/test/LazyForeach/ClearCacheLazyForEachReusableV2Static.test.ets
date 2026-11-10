'use static';

/*
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
 
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function ClearCacheLazyForEachReusableV2StaticTest(): void {
  describe('ClearCacheLazyForEachReusableV2StaticTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.RenderControl.static", "EntryAbility")
    })

    beforeEach(async (): Promise<void> => {
      console.info("ClearCacheLazyForEachReusableV2StaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForeach/ClearCacheLazyForEachReusableV2Static",
      }
      try {
        const routerObj = AppStorage.get<Router>("router") as Router
        routerObj.clear();
        await CommonFunc.sleep(2000);
        let pages: router.RouterState = routerObj.getState();
        console.info("get state pages: " + JSON.stringify(pages));
        if (!("ClearCacheLazyForEachReusableV2Static" == pages.name)) {
          routerObj.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ClearCacheLazyForEachReusableV2StaticTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_API_ClearCacheLazyForEachReusableV2StaticTest_0100
     * @tc.name     SUB_ARKUI_API_ClearCacheLazyForEachReusableV2StaticTest_0100
     * @tc.desc     LazyForEachController and IDefaultReusePool bind independent controllers, clearCache only affects bound component
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SUB_ARKUI_API_ClearCacheLazyForEachReusableV2StaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ClearCacheLazyForEachReusableV2StaticTest_0100] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let scrollBtn = await driver.findComponent(ON.id('lazy_reusablev2_static_scroll'));
      for (let i = 0; i < 5; i++) {
        await (scrollBtn?.click() as Promise<void>);
        await CommonFunc.sleep(500);
      }
      await CommonFunc.sleep(1500);

      let lazyClearBeforeComp = await driver.findComponent(ON.id('lazy_reusablev2_static_lazy_clear_times'));
      let lazyClearBeforeText = await (lazyClearBeforeComp?.getText() as Promise<string>);
      let lazyClearBefore = parseInt(lazyClearBeforeText.split(':')[1]);
      let poolClearBeforeComp = await driver.findComponent(ON.id('lazy_reusablev2_static_pool_clear_times'));
      let poolClearBeforeText = await (poolClearBeforeComp?.getText() as Promise<string>);
      let poolClearBefore = parseInt(poolClearBeforeText.split(':')[1]);

      let lazyClearBtn = await driver.findComponent(ON.id('lazy_reusablev2_static_lazy_clear'));
      await (lazyClearBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let lazyClearAfter1Comp = await driver.findComponent(ON.id('lazy_reusablev2_static_lazy_clear_times'));
      let lazyClearAfter1Text = await (lazyClearAfter1Comp?.getText() as Promise<string>);
      let lazyClearAfter1 = parseInt(lazyClearAfter1Text.split(':')[1]);
      let poolClearAfter1Comp = await driver.findComponent(ON.id('lazy_reusablev2_static_pool_clear_times'));
      let poolClearAfter1Text = await (poolClearAfter1Comp?.getText() as Promise<string>);
      let poolClearAfter1 = parseInt(poolClearAfter1Text.split(':')[1]);
      expect(lazyClearAfter1 == lazyClearBefore + 1).assertTrue();
      expect(poolClearAfter1 == poolClearBefore).assertTrue();

      let poolClearBtn = await driver.findComponent(ON.id('lazy_reusablev2_static_pool_clear'));
      await (poolClearBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let lazyClearAfter2Comp = await driver.findComponent(ON.id('lazy_reusablev2_static_lazy_clear_times'));
      let lazyClearAfter2Text = await (lazyClearAfter2Comp?.getText() as Promise<string>);
      let lazyClearAfter2 = parseInt(lazyClearAfter2Text.split(':')[1]);
      let poolClearAfter2Comp = await driver.findComponent(ON.id('lazy_reusablev2_static_pool_clear_times'));
      let poolClearAfter2Text = await (poolClearAfter2Comp?.getText() as Promise<string>);
      let poolClearAfter2 = parseInt(poolClearAfter2Text.split(':')[1]);
      expect(lazyClearAfter2 == lazyClearAfter1).assertTrue();
      expect(poolClearAfter2 == poolClearBefore + 1).assertTrue();

      let scrollTopBtn = await driver.findComponent(ON.id('lazy_reusablev2_static_scroll_top'));
      await (scrollTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      for (let i = 0; i < 5; i++) {
        let scrollBtnRetry = await driver.findComponent(ON.id('lazy_reusablev2_static_scroll'));
        await (scrollBtnRetry?.click() as Promise<void>);
        await CommonFunc.sleep(500);
      }
      await CommonFunc.sleep(1000);
      let textAfterComp = await driver.findComponent(ON.id('lazy_reusablev2_static_lazy_clear_times'));
      let textAfter = await (textAfterComp?.getText() as Promise<string>);
      expect(textAfter != null && textAfter.length > 0).assertTrue();

      console.info('[SUB_ARKUI_API_ClearCacheLazyForEachReusableV2StaticTest_0100] END');
      done();
    });
  })
}
