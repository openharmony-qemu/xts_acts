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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CustomEnvArrayTest() {
  describe('CustomEnvArrayTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvArrayTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvArray',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvArray' == pages.name)) {
          console.info('get CustomEnvArrayTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvArrayTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvArrayTest page error:' + err);
      }
      console.info('CustomEnvArrayTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvArrayTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0100
     * @tc.desc      Testing @CustomEnv decorated Array initial value display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify initial array elements: fruits[0]='apple', fruits[1]='banana'
        let text_1 = await (await driver.findComponent(ON.id('customEnvArray_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('apple');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0200
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0200
     * @tc.desc      Testing @CustomEnv Array push operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0200] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Push element' button to add 'cherry' to array
        let btn: Component = await driver.findComponent(ON.id('customEnvArray_dynamic_003'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After push, array is [apple, banana, cherry]. fruits[0] and fruits[1] remain unchanged
        let text_1 = await (await driver.findComponent(ON.id('customEnvArray_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0200] component text_1: ' + text_1);
        expect(text_1).assertEqual('apple');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0300
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0300
     * @tc.desc      Testing @CustomEnv Array reverse operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0300] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Reverse array' button to reverse array
        // Current array: [apple, banana, cherry] -> reversed: [cherry, banana, apple]
        let btn: Component = await driver.findComponent(ON.id('customEnvArray_dynamic_004'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After reverse, fruits[0]='cherry', fruits[1]='banana'
        let text_1 = await (await driver.findComponent(ON.id('customEnvArray_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0300] component text_1: ' + text_1);
        expect(text_1).assertEqual('cherry');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0400
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0400
     * @tc.desc      Testing @CustomEnv Array fill operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0400] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Fill array' button to fill array with 'apple'
        // Current array: [cherry, banana, apple] -> filled: [apple, apple, apple]
        let btn: Component = await driver.findComponent(ON.id('customEnvArray_dynamic_005'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After fill, fruits[0]='apple', fruits[1]='apple'
        let text_1 = await (await driver.findComponent(ON.id('customEnvArray_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0400] component text_1: ' + text_1);
        expect(text_1).assertEqual('apple');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVARRAY_0400] END');
      done();
    });
  })
}
