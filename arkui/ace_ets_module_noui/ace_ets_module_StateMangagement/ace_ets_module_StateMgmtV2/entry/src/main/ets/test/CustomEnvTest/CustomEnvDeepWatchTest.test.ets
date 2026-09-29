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

export default function CustomEnvDeepWatchTest() {
  describe('CustomEnvDeepWatchTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvDeepWatchTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvDeepWatch',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvDeepWatch' == pages.name)) {
          console.info('get CustomEnvDeepWatchTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvDeepWatchTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvDeepWatchTest page error:' + err);
      }
      console.info('CustomEnvDeepWatchTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvDeepWatchTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0100
     * @tc.desc      Testing @CustomEnv decorator initial value sync from parent to child (nested array)
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify child component receives initial value (1) from parent's @State message
        let text_1 = await (await driver.findComponent(ON.id('customEnvDeepWatch_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('message1:1');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0200
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0200
     * @tc.desc      Testing @CustomEnv @Watch triggered when inner property of nested array changes
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0200] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'update' button to increment parent's message[0][0] from 1 to 2
        let btn: Component = await driver.findComponent(ON.id('customEnvDeepWatch_dynamic_002'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // Verify child's msg syncs to new value (2) and @Watch callback triggered (num1 incremented from 1 to 2)
        let text_2 = await (await driver.findComponent(ON.id('customEnvDeepWatch_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0200] component text_2: ' + text_2);
        expect(text_2).assertEqual('message2:2');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDEEPWATCH_0200] END');
      done();
    });
  })
}
