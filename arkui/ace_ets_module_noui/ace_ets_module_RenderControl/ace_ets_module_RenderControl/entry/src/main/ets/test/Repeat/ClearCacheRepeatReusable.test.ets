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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ClearCacheRepeatReusableTest() {
  describe('ClearCacheRepeatReusableTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ClearCacheRepeatReusableTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/ClearCacheRepeatReusable",
      }
      try {
        router.clear();
        await CommonFunc.sleep(2000);
        let pages = router.getState();
        console.info("get state pages: " + JSON.stringify(pages));
        if (!("ClearCacheRepeatReusable" == pages.name)) {
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ClearCacheRepeatReusableTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_API_ClearCacheRepeatReusableTest_0100
     * @tc.number SUB_ARKUI_API_ClearCacheRepeatReusableTest_0100
     * @tc.desc   RepeatController and IDefaultReusePool bind independent controllers, clearCache only affects bound component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ClearCacheRepeatReusableTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_ClearCacheRepeatReusableTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let scrollBtn = await driver.findComponent(ON.id('repeat_reusable_scroll'));
      for (let i = 0; i < 5; i++) {
        await scrollBtn.click();
        await CommonFunc.sleep(500);
      }
      await CommonFunc.sleep(1500);

      let repeatClearBefore = parseInt((await (await driver.findComponent(ON.id('repeat_reusable_repeat_clear_times'))).getText()).split(':')[1]);
      let poolClearBefore = parseInt((await (await driver.findComponent(ON.id('repeat_reusable_pool_clear_times'))).getText()).split(':')[1]);

      // 仅调用 RepeatController.clearCache()，pool 的 clear 次数应不变
      await (await driver.findComponent(ON.id('repeat_reusable_repeat_clear'))).click();
      await CommonFunc.sleep(1500);
      let repeatClearAfter1 = parseInt((await (await driver.findComponent(ON.id('repeat_reusable_repeat_clear_times'))).getText()).split(':')[1]);
      let poolClearAfter1 = parseInt((await (await driver.findComponent(ON.id('repeat_reusable_pool_clear_times'))).getText()).split(':')[1]);
      expect(repeatClearAfter1 == repeatClearBefore + 1).assertTrue();
      expect(poolClearAfter1 == poolClearBefore).assertTrue();

      // 仅调用 IDefaultReusePool.clearCache()，repeat 的 clear 次数应不变
      await (await driver.findComponent(ON.id('repeat_reusable_pool_clear'))).click();
      await CommonFunc.sleep(1500);
      let repeatClearAfter2 = parseInt((await (await driver.findComponent(ON.id('repeat_reusable_repeat_clear_times'))).getText()).split(':')[1]);
      let poolClearAfter2 = parseInt((await (await driver.findComponent(ON.id('repeat_reusable_pool_clear_times'))).getText()).split(':')[1]);
      expect(repeatClearAfter2 == repeatClearAfter1).assertTrue();
      expect(poolClearAfter2 == poolClearBefore + 1).assertTrue();

      // 重新滚动，缓存应正常重建
      await (await driver.findComponent(ON.id('repeat_reusable_scroll_top'))).click();
      await CommonFunc.sleep(1000);
      for (let i = 0; i < 5; i++) {
        let scrollBtnRetry = await driver.findComponent(ON.id('repeat_reusable_scroll'));
        await scrollBtnRetry.click();
        await CommonFunc.sleep(500);
      }
      await CommonFunc.sleep(1000);
      let textAfter = await (await driver.findComponent(ON.id('repeat_reusable_repeat_clear_times'))).getText();
      expect(textAfter != null && textAfter.length > 0).assertTrue();

      console.info('[SUB_ARKUI_API_ClearCacheRepeatReusableTest_0100] END');
      done();
    });
  })
}
