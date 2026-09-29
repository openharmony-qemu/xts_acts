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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic-dynamic';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CustomEnvParamV2Test() {
  describe('CustomEnvParamV2Test', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvParamV2Test setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvParamV2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvParamV2' == pages.name)) {
          console.info('get CustomEnvParamV2Test pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvParamV2Test page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvParamV2Test page error:' + err);
      }
      console.info('CustomEnvParamV2Test beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvParamV2Test after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0100
     * @tc.desc      Testing @CustomEnv @ObservedV2 value passed from V1 to V2 @Param initial display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify parent @CustomEnv @ObservedV2 variable displays initial @Trace value 'hello'
        let text_1 = await (await driver.findComponent(ON.id('customEnvParamV2_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('hello');

        // Verify child @Param receives @ObservedV2 value from parent @CustomEnv variable
        let text_2 = await (await driver.findComponent(ON.id('customEnvParamV2_dynamic_003'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0100] component text_2: ' + text_2);
        expect(text_2).assertEqual('Child Value is : hello');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0200
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0200
     * @tc.desc      Testing @CustomEnv @ObservedV2 @Trace property change triggers UI refresh in V1 and V2
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0200] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'update' button to change @Trace property from 'hello' to 'hello world'
        let btn: Component = await driver.findComponent(ON.id('customEnvParamV2_dynamic_002'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // Verify parent @CustomEnv @Trace property updated to 'hello world'
        let text_1 = await (await driver.findComponent(ON.id('customEnvParamV2_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0200] component text_1: ' + text_1);
        expect(text_1).assertEqual('hello world');

        // Verify child @Param received updated @Trace property value
        let text_2 = await (await driver.findComponent(ON.id('customEnvParamV2_dynamic_003'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0200] component text_2: ' + text_2);
        expect(text_2).assertEqual('Child Value is : hello world');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVPARAMV2_0200] END');
      done();
    });
  })
}
