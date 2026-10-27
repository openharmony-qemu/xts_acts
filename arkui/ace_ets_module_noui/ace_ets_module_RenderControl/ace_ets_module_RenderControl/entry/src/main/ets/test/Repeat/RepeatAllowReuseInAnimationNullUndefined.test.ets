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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, UIElementInfo } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function RepeatAllowReuseInAnimationNullUndefinedTest() {
  describe('RepeatAllowReuseInAnimationNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatAllowReuseInAnimationNullUndefinedTest setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/RepeatAllowReuseInAnimationNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("RepeatAllowReuseInAnimationNullUndefined" == pages.name)) {
          console.info("get RepeatAllowReuseInAnimationNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatAllowReuseInAnimationNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatAllowReuseInAnimationNullUndefined page error:" + err);
        expect().assertFail();
      }
      console.info("RepeatAllowReuseInAnimationNullUndefinedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatAllowReuseInAnimationNullUndefinedTest after each called");
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0100
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0100
     * @tc.desc     allowReuseInAnimation=false, Grid container renders normally without crash
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL2
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0100] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 验证 allowReuseInAnimation=false 场景下 Grid 正常渲染
      let gridFalse = await driver.findComponent(ON.id('animReuseFalseGrid'));
      expect(gridFalse != null).assertTrue();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0100] gridFalse found');

      // 验证 Grid 内有子节点渲染（通过子 Text 组件 id 定位）
      let falseItem = await driver.findComponent(ON.id('falseItem_0'));
      expect(falseItem != null).assertTrue();
      let textInFalse = await falseItem.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0100] falseItem_0 text: ' + textInFalse);
      expect(textInFalse.length > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0100] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0200
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0200
     * @tc.desc     allowReuseInAnimation=null, Grid container renders normally without crash
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL2
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0200] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 验证 allowReuseInAnimation=null 场景下 Grid 正常渲染
      let gridNull = await driver.findComponent(ON.id('animReuseNullGrid'));
      expect(gridNull != null).assertTrue();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0200] gridNull found');

      // 验证 Grid 内有子节点渲染（通过子 Text 组件 id 定位）
      let nullItem = await driver.findComponent(ON.id('nullItem_0'));
      expect(nullItem != null).assertTrue();
      let textInNull = await nullItem.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0200] nullItem_0 text: ' + textInNull);
      expect(textInNull.length > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0200] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0300
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0300
     * @tc.desc     allowReuseInAnimation=undefined, Grid container renders normally without crash
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL2
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0300] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 验证 allowReuseInAnimation=undefined 场景下 Grid 正常渲染
      let gridUndefined = await driver.findComponent(ON.id('animReuseUndefinedGrid'));
      expect(gridUndefined != null).assertTrue();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0300] gridUndefined found');

      // 验证 Grid 内有子节点渲染（通过子 Text 组件 id 定位）
      let undefinedItem = await driver.findComponent(ON.id('undefinedItem_0'));
      expect(undefinedItem != null).assertTrue();
      let textInUndefined = await undefinedItem.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0300] undefinedItem_0 text: ' + textInUndefined);
      expect(textInUndefined.length > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0300] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0400
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0400
     * @tc.desc     allowReuseInAnimation=false/null/undefined, all three Grids render concurrently without crash
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL2
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0400] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 同时验证三个 Grid 都能正常渲染（并发场景）
      let gridFalse = await driver.findComponent(ON.id('animReuseFalseGrid'));
      let gridNull = await driver.findComponent(ON.id('animReuseNullGrid'));
      let gridUndefined = await driver.findComponent(ON.id('animReuseUndefinedGrid'));

      expect(gridFalse != null).assertTrue();
      expect(gridNull != null).assertTrue();
      expect(gridUndefined != null).assertTrue();

      // 通过子 Text 组件 id 验证三个 Grid 内都有子节点渲染
      let falseItem = await driver.findComponent(ON.id('falseItem_0'));
      let nullItem = await driver.findComponent(ON.id('nullItem_0'));
      let undefinedItem = await driver.findComponent(ON.id('undefinedItem_0'));

      expect(falseItem != null).assertTrue();
      expect(nullItem != null).assertTrue();
      expect(undefinedItem != null).assertTrue();

      let textFalse = await falseItem.getText();
      let textNull = await nullItem.getText();
      let textUndefined = await undefinedItem.getText();

      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0400] textFalse: ' + textFalse);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0400] textNull: ' + textNull);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0400] textUndefined: ' + textUndefined);

      // 三个 Grid 内子 Text 都应有非空文本
      expect(textFalse.length > 0).assertTrue();
      expect(textNull.length > 0).assertTrue();
      expect(textUndefined.length > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_0400] END');
      done();
    });
  })
}
