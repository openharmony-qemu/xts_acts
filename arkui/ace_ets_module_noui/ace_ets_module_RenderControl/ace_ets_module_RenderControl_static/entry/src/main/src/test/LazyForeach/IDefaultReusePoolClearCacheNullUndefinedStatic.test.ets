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

export default function IDefaultReusePoolClearCacheNullUndefinedStaticTest(): void {
  describe('IDefaultReusePoolClearCacheNullUndefinedStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.RenderControl.static", "EntryAbility")
    })

    beforeEach(async (): Promise<void> => {
      console.info("IDefaultReusePoolClearCacheNullUndefinedStaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForeach/IDefaultReusePoolClearCacheNullUndefinedStatic",
      }
      try {
        const routerObj = AppStorage.get<Router>("router") as Router
        routerObj.clear();
        let pages: router.RouterState = routerObj.getState();
        console.info("get state pages: " + JSON.stringify(pages));
        if (!("IDefaultReusePoolClearCacheNullUndefinedStatic" == pages.name)) {
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
      console.info("IDefaultReusePoolClearCacheNullUndefinedStaticTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedStaticTest_0100
     * @tc.name     SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedStaticTest_0100
     * @tc.desc     Test IDefaultReusePool.clearCache(undefined) does not crash
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedStaticTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedStaticTest_0100] START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let clearUndefBtn = await driver.findComponent(ON.id('pool_undefined_static_clear_btn'));
      await (clearUndefBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let resultComp = await driver.findComponent(ON.id('pool_undefined_static_result'));
      let resultText = await (resultComp?.getText() as Promise<string>);
      expect(resultText == 'undef:no_crash').assertTrue();

      console.info('[SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedStaticTest_0100] END');
      done();
    });
  })
}
