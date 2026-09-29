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

export default function CustomEnvFreezeTest() {
  describe('CustomEnvFreezeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvFreezeTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvFreeze',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvFreeze' == pages.name)) {
          console.info('get CustomEnvFreezeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvFreezeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvFreezeTest page error:' + err);
      }
      console.info('CustomEnvFreezeTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvFreezeTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0100
     * @tc.desc      Testing @CustomEnv initial value sync in active TabContent (tab0)
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify active tab0 child receives initial value (20) from parent's @Local message
        let text_1 = await (await driver.findComponent(ON.id('customEnvFreeze_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('message1:20, index: 0');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0200
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0200
     * @tc.desc      Testing @Monitor triggered in active TabContent when @CustomEnv value changes
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0200] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'change message' button to increment parent's message from 20 to 21
        let btn: Component = await driver.findComponent(ON.id('customEnvFreeze_dynamic_003'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // Verify active tab0 child's message syncs to new value (21) and @Monitor callback triggered (num1 incremented from 1 to 2)
        let text_2 = await (await driver.findComponent(ON.id('customEnvFreeze_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0200] component text_2: ' + text_2);
        expect(text_2).assertEqual('message2:21, index: 0');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0300
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0300
     * @tc.desc      Testing @Monitor triggered when inactive TabContent switches to active
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0300] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Switch to tab1 by clicking its tabBar
        let tab1 = await driver.findComponent(ON.text('tab1'));
        await CommonFunc.sleep(1000);
        await tab1.click();
        await CommonFunc.sleep(3000);

        // Click 'change message' button to increment parent's message from 21 to 22
        let btn: Component = await driver.findComponent(ON.id('customEnvFreeze_dynamic_003'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // Verify tab1 child becomes active, receives current value (22) and @Monitor callback triggered (num1 incremented from 1 to 2)
        let text_3 = await (await driver.findComponent(ON.id('customEnvFreeze_dynamic_002'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0300] component text_3: ' + text_3);
        expect(text_3).assertEqual('message2:22, index: 1');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0400
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0400
     * @tc.desc      Testing inactive TabContent does not trigger @Monitor when @CustomEnv value changes
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0400] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Switch back to tab0 to verify it was frozen (did not receive the change while inactive)
        let tab0 = await driver.findComponent(ON.text('tab0'));
        await CommonFunc.sleep(1000);
        await tab0.click();
        await CommonFunc.sleep(3000);
        // Currently tab1 is active, tab0 is inactive
        // Click 'change message' button to increment parent's message from 22 to 23
        let btn: Component = await driver.findComponent(ON.id('customEnvFreeze_dynamic_003'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // Verify active tab1 child's message syncs to new value (23) and @Monitor callback triggered (num1 incremented from 2 to 3)
        let text_4 = await (await driver.findComponent(ON.id('customEnvFreeze_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0400] component text_4: ' + text_4);
        expect(text_4).assertEqual('message4:23, index: 0');

        // Switch back to tab0 to verify it was frozen (did not receive the change while inactive)
        let tab1 = await driver.findComponent(ON.text('tab1'));
        await CommonFunc.sleep(1000);
        await tab1.click();
        await CommonFunc.sleep(3000);

        // tab0 was inactive when message changed from 22 to 23, now becomes active and @Monitor callback triggered
        // num1 should increment from 2 to 3, message should sync to 23
        let text_5 = await (await driver.findComponent(ON.id('customEnvFreeze_dynamic_002'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0400] component text_5: ' + text_5);
        expect(text_5).assertEqual('message3:23, index: 1');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0400 error:" + err);
        expect(true).assertEqual(false);
      }

      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVFREEZE_0400] END');
      done();
    });
  })
}
