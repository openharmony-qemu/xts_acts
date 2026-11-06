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

export default function ClearCacheRepeatReusableStaticTest(): void {
  describe('ClearCacheRepeatReusableStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.RenderControl.static", "EntryAbility")
    })

    beforeEach(async (): Promise<void> => {
      console.info("ClearCacheRepeatReusableStaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/repeat/ClearCacheRepeatReusableStatic",
      }
      try {
        const routerObj = AppStorage.get<Router>("router") as Router
        routerObj.clear();
        await CommonFunc.sleep(2000);
        let pages: router.RouterState = routerObj.getState();
        console.info("get state pages: " + JSON.stringify(pages));
        if (!("ClearCacheRepeatReusableStatic" == pages.name)) {
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
      console.info("ClearCacheRepeatReusableStaticTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_API_ClearCacheRepeatReusableStaticTest_0100
     * @tc.name     SUB_ARKUI_API_ClearCacheRepeatReusableStaticTest_0100
     * @tc.desc     RepeatController and IDefaultReusePool bind independent controllers, clearCache only affects bound component
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SUB_ARKUI_API_ClearCacheRepeatReusableStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ClearCacheRepeatReusableStaticTest_0100] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let scrollBtn = await driver.findComponent(ON.id('repeat_reusable_static_scroll'));
      for (let i = 0; i < 5; i++) {
        await (scrollBtn?.click() as Promise<void>);
        await CommonFunc.sleep(500);
      }
      await CommonFunc.sleep(1500);

      let repeatClearBeforeComp = await driver.findComponent(ON.id('repeat_reusable_static_repeat_clear_times'));
      let repeatClearBeforeText = await (repeatClearBeforeComp?.getText() as Promise<string>);
      let repeatClearBefore = parseInt(repeatClearBeforeText.split(':')[1]);
      let poolClearBeforeComp = await driver.findComponent(ON.id('repeat_reusable_static_pool_clear_times'));
      let poolClearBeforeText = await (poolClearBeforeComp?.getText() as Promise<string>);
      let poolClearBefore = parseInt(poolClearBeforeText.split(':')[1]);

      let repeatClearBtn = await driver.findComponent(ON.id('repeat_reusable_static_repeat_clear'));
      await (repeatClearBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let repeatClearAfter1Comp = await driver.findComponent(ON.id('repeat_reusable_static_repeat_clear_times'));
      let repeatClearAfter1Text = await (repeatClearAfter1Comp?.getText() as Promise<string>);
      let repeatClearAfter1 = parseInt(repeatClearAfter1Text.split(':')[1]);
      let poolClearAfter1Comp = await driver.findComponent(ON.id('repeat_reusable_static_pool_clear_times'));
      let poolClearAfter1Text = await (poolClearAfter1Comp?.getText() as Promise<string>);
      let poolClearAfter1 = parseInt(poolClearAfter1Text.split(':')[1]);
      expect(repeatClearAfter1 == repeatClearBefore + 1).assertTrue();
      expect(poolClearAfter1 == poolClearBefore).assertTrue();

      let poolClearBtn = await driver.findComponent(ON.id('repeat_reusable_static_pool_clear'));
      await (poolClearBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let repeatClearAfter2Comp = await driver.findComponent(ON.id('repeat_reusable_static_repeat_clear_times'));
      let repeatClearAfter2Text = await (repeatClearAfter2Comp?.getText() as Promise<string>);
      let repeatClearAfter2 = parseInt(repeatClearAfter2Text.split(':')[1]);
      let poolClearAfter2Comp = await driver.findComponent(ON.id('repeat_reusable_static_pool_clear_times'));
      let poolClearAfter2Text = await (poolClearAfter2Comp?.getText() as Promise<string>);
      let poolClearAfter2 = parseInt(poolClearAfter2Text.split(':')[1]);
      expect(repeatClearAfter2 == repeatClearAfter1).assertTrue();
      expect(poolClearAfter2 == poolClearBefore + 1).assertTrue();

      let scrollTopBtn = await driver.findComponent(ON.id('repeat_reusable_static_scroll_top'));
      await (scrollTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      for (let i = 0; i < 5; i++) {
        let scrollBtnRetry = await driver.findComponent(ON.id('repeat_reusable_static_scroll'));
        await (scrollBtnRetry?.click() as Promise<void>);
        await CommonFunc.sleep(500);
      }
      await CommonFunc.sleep(1000);
      let textAfterComp = await driver.findComponent(ON.id('repeat_reusable_static_repeat_clear_times'));
      let textAfter = await (textAfterComp?.getText() as Promise<string>);
      expect(textAfter != null && textAfter.length > 0).assertTrue();

      console.info('[SUB_ARKUI_API_ClearCacheRepeatReusableStaticTest_0100] END');
      done();
    });
  })
}
