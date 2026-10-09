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

export default function CustomEnvMapTest() {
  describe('CustomEnvMapTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvMapTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvMap',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvMap' == pages.name)) {
          console.info('get CustomEnvMapTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvMapTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvMapTest page error:' + err);
      }
      console.info('CustomEnvMapTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvMapTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0100
     * @tc.desc      Testing @CustomEnv decorated Map initial value display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify initial Map entries: apple=1, banana=2
        let text_1 = await (await driver.findComponent(ON.id('customEnvMap_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('key: apple, value: 1');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0200
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0200
     * @tc.desc      Testing @CustomEnv Map set operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0200] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Set entry cherry' button to add new entry cherry=3
        let btn: Component = await driver.findComponent(ON.id('customEnvMap_dynamic_002'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After set, Map has apple=1, banana=2, cherry=3
        let text_1 = await (await driver.findComponent(ON.id('customEnvMap_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0200] component text_1: ' + text_1);
        expect(text_1).assertEqual('key: apple, value: 1');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0300
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0300
     * @tc.desc      Testing @CustomEnv Map update operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0300] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Update entry apple' button to update apple from 1 to 4
        let btn: Component = await driver.findComponent(ON.id('customEnvMap_dynamic_003'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        let text_2 = await (await driver.findComponent(ON.id('customEnvMap_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0300] component text_2: ' + text_2);
        expect(text_2).assertEqual('key: apple, value: 4');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0400
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0400
     * @tc.desc      Testing @CustomEnv Map delete operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0400] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Delete entry apple' button to delete apple
        let btn: Component = await driver.findComponent(ON.id('customEnvMap_dynamic_004'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After delete, Map has banana=2, cherry=3
        let text_1 = await (await driver.findComponent(ON.id('customEnvMap_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0400] component text_1: ' + text_1);
        expect(text_1).assertEqual('key: banana, value: 2');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0500
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0500
     * @tc.desc      Testing @CustomEnv Map clear operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0500] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'Clear map' button to clear all entries
        let btn: Component = await driver.findComponent(ON.id('customEnvMap_dynamic_005'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After clear, Map is empty, no Text components rendered
        let textComponent = await driver.findComponent(ON.id('customEnvMap_dynamic_001'));
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0500] textComponent: ' + JSON.stringify(textComponent));
        expect(textComponent).assertNull();
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0500 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVMAP_0500] END');
      done();
    });
  })
}
