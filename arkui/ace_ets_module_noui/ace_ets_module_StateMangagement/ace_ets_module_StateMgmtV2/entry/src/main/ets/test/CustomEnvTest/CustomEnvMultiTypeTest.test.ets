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

export default function CustomEnvMultiTypeTest() {
  describe('CustomEnvMultiTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvMultiTypeTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvMultiType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvMultiType' == pages.name)) {
          console.info('get CustomEnvMultiTypeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvMultiTypeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvMultiTypeTest page error:' + err);
      }
      console.info('CustomEnvMultiTypeTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvMultiTypeTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0100
     * @tc.desc      Testing @CustomEnv decorated string type variable initial value display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify @CustomEnv decorated string type variable displays correct type
        let text_1 = await (await driver.findComponent(ON.id('customEnvMultiType_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('customStrVarName type is string');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0200
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0200
     * @tc.desc      Testing @CustomEnv decorated number type variable initial value display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0200] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify @CustomEnv decorated number type variable displays correct type
        let text_1 = await (await driver.findComponent(ON.id('customEnvMultiType_dynamic_002'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0200] component text_1: ' + text_1);
        expect(text_1).assertEqual('customNumVarName type is number');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0300
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0300
     * @tc.desc      Testing @CustomEnv decorated boolean type variable initial value display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0300] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify @CustomEnv decorated boolean type variable displays correct type
        let text_1 = await (await driver.findComponent(ON.id('customEnvMultiType_dynamic_003'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0300] component text_1: ' + text_1);
        expect(text_1).assertEqual('customBoolVarName type is boolean');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0400
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0400
     * @tc.desc      Testing @CustomEnv decorated Object type variable initial value display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0400] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify @CustomEnv decorated Object type variable displays correct type
        let text_1 = await (await driver.findComponent(ON.id('customEnvMultiType_dynamic_004'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0400] component text_1: ' + text_1);
        expect(text_1).assertEqual('customObjVarName type is object');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMULTITYPE_0400] END');
      done();
    });
  })
}
