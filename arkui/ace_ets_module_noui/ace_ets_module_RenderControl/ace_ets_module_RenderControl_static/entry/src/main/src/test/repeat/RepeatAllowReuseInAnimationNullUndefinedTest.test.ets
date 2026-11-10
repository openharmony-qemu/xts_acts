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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function RepeatAllowReuseInAnimationNullUndefinedTest(): void {
  describe('RepeatAllowReuseInAnimationNullUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.RenderControl.static", "EntryAbility")
    })

    beforeEach(async (): Promise<void> => {
      console.info("RepeatAllowReuseInAnimationNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/repeat/RepeatAllowReuseInAnimationNullUndefined",
      }
      try {
        const routerObj = AppStorage.get<Router>("router") as Router
        routerObj.clear();
        let pages: router.RouterState = routerObj.getState();
        console.info("get RepeatAllowReuseInAnimationNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("RepeatAllowReuseInAnimationNullUndefined" == pages.name)) {
          console.info("get RepeatAllowReuseInAnimationNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          routerObj.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push RepeatAllowReuseInAnimationNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("RepeatAllowReuseInAnimationNullUndefinedTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0100
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0100
     * @tc.desc     allowReuseInAnimation=false, Grid container renders normally without crash
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0100] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();

      // 验证 allowReuseInAnimation=false 场景下 Grid 正常渲染
      let gridFalse = await driver.findComponent(ON.id('animReuseFalseGrid'));
      expect(gridFalse != null).assertTrue();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0100] gridFalse found');

      // 验证 Grid 内有子节点渲染（通过子 Text 组件 id 定位）
      let falseItem = await driver.findComponent(ON.id('falseItem_0'));
      expect(falseItem != null).assertTrue();
      let textInFalse = await falseItem?.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0100] falseItem_0 text: ' + textInFalse);
      expect(textInFalse != null && String(textInFalse).length > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0200
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0200
     * @tc.desc     allowReuseInAnimation=null, Grid container renders normally without crash
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0200] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();

      // 验证 allowReuseInAnimation=null 场景下 Grid 正常渲染
      let gridNull = await driver.findComponent(ON.id('animReuseNullGrid'));
      expect(gridNull != null).assertTrue();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0200] gridNull found');

      // 验证 Grid 内有子节点渲染（通过子 Text 组件 id 定位）
      let nullItem = await driver.findComponent(ON.id('nullItem_0'));
      expect(nullItem != null).assertTrue();
      let textInNull = await nullItem?.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0200] nullItem_0 text: ' + textInNull);
      expect(textInNull != null && String(textInNull).length > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0300
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0300
     * @tc.desc     allowReuseInAnimation=undefined, Grid container renders normally without crash
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0300] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();

      // 验证 allowReuseInAnimation=undefined 场景下 Grid 正常渲染
      let gridUndefined = await driver.findComponent(ON.id('animReuseUndefinedGrid'));
      expect(gridUndefined != null).assertTrue();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0300] gridUndefined found');

      // 验证 Grid 内有子节点渲染（通过子 Text 组件 id 定位）
      let undefinedItem = await driver.findComponent(ON.id('undefinedItem_0'));
      expect(undefinedItem != null).assertTrue();
      let textInUndefined = await undefinedItem?.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0300] undefinedItem_0 text: ' + textInUndefined);
      expect(textInUndefined != null && String(textInUndefined).length > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0400
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0400
     * @tc.desc     allowReuseInAnimation=false/null/undefined, all three Grids render concurrently without crash
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0400] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();

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

      let textFalse = await falseItem?.getText();
      let textNull = await nullItem?.getText();
      let textUndefined = await undefinedItem?.getText();

      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0400] textFalse: ' + textFalse);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0400] textNull: ' + textNull);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0400] textUndefined: ' + textUndefined);

      // 三个 Grid 内子 Text 都应有非空文本
      expect(textFalse != null && String(textFalse).length > 0).assertTrue();
      expect(textNull != null && String(textNull).length > 0).assertTrue();
      expect(textUndefined != null && String(textUndefined).length > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationNullUndefinedTest_static_0400] END');
      done();
    });
  })
}
