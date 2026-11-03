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

export default function IDefaultReusePoolClearCacheNullUndefinedTest() {
  describe('IDefaultReusePoolClearCacheNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("IDefaultReusePoolClearCacheNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/IDefaultReusePoolClearCacheNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages: " + JSON.stringify(pages));
        if (!("IDefaultReusePoolClearCacheNullUndefined" == pages.name)) {
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
      console.info("IDefaultReusePoolClearCacheNullUndefinedTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0100
     * @tc.desc   Test IDefaultReusePool.clearCache(null) does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      await (await driver.findComponent(ON.id('pool_null_clear_btn'))).click();
      await CommonFunc.sleep(2000);

      let result = await driver.findComponent(ON.id('pool_null_result'));
      let resultText = await result.getText();
      expect(resultText == 'null:no_crash').assertTrue();

      console.info('[SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0200
     * @tc.number SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0200
     * @tc.desc   Test IDefaultReusePool.clearCache(undefined) does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      await (await driver.findComponent(ON.id('pool_undefined_clear_btn'))).click();
      await CommonFunc.sleep(2000);

      let result = await driver.findComponent(ON.id('pool_undefined_result'));
      let resultText = await result.getText();
      expect(resultText == 'undef:no_crash').assertTrue();

      console.info('[SUB_ARKUI_API_IDefaultReusePoolClearCacheNullUndefinedTest_0200] END');
      done();
    });
  })
}
