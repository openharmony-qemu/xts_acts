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

export default function CustomEnvSetTest() {
  describe('CustomEnvSetTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvSetTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvSet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvSet' == pages.name)) {
          console.info('get CustomEnvSetTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvSetTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvSetTest page error:' + err);
      }
      console.info('CustomEnvSetTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvSetTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0100
     * @tc.desc      Testing @CustomEnv decorated Set initial value display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify initial Set elements: 'apple' is first element
        let text_1 = await (await driver.findComponent(ON.id('customEnvSet_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('apple');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0200
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0200
     * @tc.desc      Testing @CustomEnv Set add operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0200] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Add element' button to add 'cherry' to Set
        let btn: Component = await driver.findComponent(ON.id('customEnvSet_dynamic_002'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After add, Set has apple, banana, cherry. First element remains 'apple'
        let text_1 = await (await driver.findComponent(ON.id('customEnvSet_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0200] component text_1: ' + text_1);
        expect(text_1).assertEqual('apple');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0300
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0300
     * @tc.desc      Testing @CustomEnv Set delete operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0300] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Delete element apple' button to delete 'apple' from Set
        let btn: Component = await driver.findComponent(ON.id('customEnvSet_dynamic_003'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After delete, Set has banana, cherry. First element becomes 'banana'
        let text_1 = await (await driver.findComponent(ON.id('customEnvSet_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0300] component text_1: ' + text_1);
        expect(text_1).assertEqual('banana');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0400
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0400
     * @tc.desc      Testing @CustomEnv Set clear operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0400] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Clear set' button to clear all elements
        let btn: Component = await driver.findComponent(ON.id('customEnvSet_dynamic_004'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After clear, Set is empty, no Text components rendered
        let textComponent = await driver.findComponent(ON.id('customEnvSet_dynamic_001'));
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0400] textComponent: ' + JSON.stringify(textComponent));
        expect(textComponent).assertNull();
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVSET_0400] END');
      done();
    });
  })
}
