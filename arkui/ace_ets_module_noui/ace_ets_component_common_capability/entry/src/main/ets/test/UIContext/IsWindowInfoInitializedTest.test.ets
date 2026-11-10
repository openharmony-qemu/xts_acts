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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import { Driver, ON, Component } from '@ohos.UiTest';
import { UIContext } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/common/Common';

export default function isWindowInfoInitializedTest() {
  describe('IsWindowInfoInitializedTest', () => {
    beforeAll(async () => {
      console.info('[IsWindowInfoInitializedTest] 测试前置开始');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/IsWindowInfoInitializedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('IsWindowInfoInitializedTest' == pages.name)) {
          await router.push(options);
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error('[IsWindowInfoInitializedTest] push page error: ' + err);
      }
      console.info('[IsWindowInfoInitializedTest] 测试前置结束');
    });

    beforeEach(() => {
      console.info('[IsWindowInfoInitializedTest] beforeEach called');
    });

    afterEach(async () => {
      console.info('[IsWindowInfoInitializedTest] afterEach called');
    });

    afterAll(async () => {
      console.info('[IsWindowInfoInitializedTest] afterAll called');
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_FUNCTION_0100
     * @tc.name   SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_FUNCTION_0100
     * @tc.desc   测试isWindowInfoInitialized接口正常调用，页面加载完成后窗口信息已初始化，返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_FUNCTION_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_FUNCTION_0100] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);

      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_normal'));
      await btn.click();

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_normal_id');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_FUNCTION_0100] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_FUNCTION_0100] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('normal_result_true');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_FUNCTION_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_LIFECYCLE_0200
     * @tc.name   SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_LIFECYCLE_0200
     * @tc.desc   测试isWindowInfoInitialized接口在aboutToAppear生命周期中调用，返回合法boolean值且不抛出异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_LIFECYCLE_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_LIFECYCLE_0200] START');

      let strJson = getInspectorByKey('text_lifecycle_id');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_LIFECYCLE_0200] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_LIFECYCLE_0200] response: ' + JSON.stringify(content));
      expect(content === 'lifecycle_result_true' || content === 'lifecycle_result_false').assertTrue();
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_LIFECYCLE_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_STABILITY_0300
     * @tc.name   SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_STABILITY_0300
     * @tc.desc   测试isWindowInfoInitialized接口多次调用返回值类型为boolean且结果一致，通过UIContext.getAllUIContexts获取实例直接调用返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_STABILITY_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_STABILITY_0300] START');

      let uiContexts: UIContext[] = UIContext.getAllUIContexts();
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_STABILITY_0300] uiContexts length: ' + uiContexts.length);
      expect(uiContexts.length > 0).assertTrue();

      let uiContext: ESObject = uiContexts[0];
      let first: boolean = uiContext.isWindowInfoInitialized();
      let second: boolean = uiContext.isWindowInfoInitialized();
      let third: boolean = uiContext.isWindowInfoInitialized();
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_STABILITY_0300] first: ' + first + ', second: ' + second + ', third: ' + third);
      expect(typeof first === 'boolean').assertTrue();
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(first).assertTrue();
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_STABILITY_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_NULL_0400
     * @tc.name   SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_NULL_0400
     * @tc.desc   测试isWindowInfoInitialized接口传入null参数，多余参数被忽略，正常返回boolean不抛出异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_NULL_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_NULL_0400] START');

      let uiContexts: UIContext[] = UIContext.getAllUIContexts();
      expect(uiContexts.length > 0).assertTrue();

      let uiContext: ESObject = uiContexts[0];
      let resultNull: ESObject = uiContext.isWindowInfoInitialized(null);
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_NULL_0400] resultNull: ' + String(resultNull));
      expect(typeof resultNull === 'boolean').assertTrue();
      expect(resultNull === true).assertTrue();

      let driver = await Driver.create();
      await CommonFunc.sleep(2000);

      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_null'));
      await btn.click();

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_null_id');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_NULL_0400] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_NULL_0400] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('null_result_true');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_NULL_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_UNDEFINED_0500
     * @tc.name   SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_UNDEFINED_0500
     * @tc.desc   测试isWindowInfoInitialized接口传入undefined参数，多余参数被忽略，正常返回boolean不抛出异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_UNDEFINED_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_UNDEFINED_0500] START');

      let uiContexts: UIContext[] = UIContext.getAllUIContexts();
      expect(uiContexts.length > 0).assertTrue();

      let uiContext: ESObject = uiContexts[0];
      let resultUndefined: ESObject = uiContext.isWindowInfoInitialized(undefined);
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_UNDEFINED_0500] resultUndefined: ' + String(resultUndefined));
      expect(typeof resultUndefined === 'boolean').assertTrue();
      expect(resultUndefined === true).assertTrue();

      let driver = await Driver.create();
      await CommonFunc.sleep(2000);

      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_undefined'));
      await btn.click();

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_undefined_id');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_UNDEFINED_0500] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_UNDEFINED_0500] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined_result_true');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_PARAM_UNDEFINED_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600
     * @tc.name   SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600
     * @tc.desc   测试isWindowInfoInitialized接口在UIContext实例为null时调用，抛出异常并被捕获
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600] START');

      let hasError: boolean = false;
      try {
        let nullContext: ESObject = null;
        let result: ESObject = nullContext.isWindowInfoInitialized();
        console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600] result: ' + String(result));
      } catch (err) {
        console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600] catch error: ' + err);
        hasError = true;
      }
      expect(hasError).assertTrue();

      let driver = await Driver.create();
      await CommonFunc.sleep(2000);

      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_instance_null'));
      await btn.click();

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_instance_null_id');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('instance_null_result_error');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_NULL_0600] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700
     * @tc.name   SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700
     * @tc.desc   测试isWindowInfoInitialized接口在UIContext实例为undefined时调用，抛出异常并被捕获
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700] START');

      let hasError: boolean = false;
      try {
        let undefinedContext: ESObject = undefined;
        let result: ESObject = undefinedContext.isWindowInfoInitialized();
        console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700] result: ' + String(result));
      } catch (err) {
        console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700] catch error: ' + err);
        hasError = true;
      }
      expect(hasError).assertTrue();

      let driver = await Driver.create();
      await CommonFunc.sleep(2000);

      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_instance_undefined'));
      await btn.click();

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text_instance_undefined_id');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('instance_undefined_result_error');
      console.info('[SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_INSTANCE_UNDEFINED_0700] END');
      done();
    });
  })
}
