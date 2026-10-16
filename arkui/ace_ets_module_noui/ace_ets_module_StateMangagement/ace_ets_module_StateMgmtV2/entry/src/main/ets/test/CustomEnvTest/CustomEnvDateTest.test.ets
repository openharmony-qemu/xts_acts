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

export default function CustomEnvDateTest() {
  describe('CustomEnvDateTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvDateTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnvDate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnvDate' == pages.name)) {
          console.info('get CustomEnvDateTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvDateTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvDateTest page error:' + err);
      }
      console.info('CustomEnvDateTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvDateTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0100
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0100
     * @tc.desc      Testing @CustomEnv decorated Date initial value display
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0100] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Verify initial Date value: 2021-08-08
        let text_1 = await (await driver.findComponent(ON.id('customEnvDate_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0100] component text_1: ' + text_1);
        expect(text_1).assertEqual('Selected Date: 8/8/2021');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0200
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0200
     * @tc.desc      Testing @CustomEnv Date setFullYear operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0200] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'increase the year by 1' button to setFullYear from 2021 to 2022
        let btn: Component = await driver.findComponent(ON.id('customEnvDate_dynamic_002'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After setFullYear, date becomes 2022/08/08
        let text_1 = await (await driver.findComponent(ON.id('customEnvDate_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0200] component text_1: ' + text_1);
        expect(text_1).assertEqual('Selected Date: 8/8/2022');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0300
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0300
     * @tc.desc      Testing @CustomEnv Date setMonth operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0300] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'increase the month by 1' button to setMonth from 07 (Aug) to 08 (Sep)
        // Current date: 2022/08/08, setMonth(getMonth()+1) -> 2022/09/08
        let btn: Component = await driver.findComponent(ON.id('customEnvDate_dynamic_003'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After setMonth, date becomes 2022/09/08
        let text_1 = await (await driver.findComponent(ON.id('customEnvDate_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0300] component text_1: ' + text_1);
        expect(text_1).assertEqual('Selected Date: 9/8/2022');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0400
     * @tc.name      SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0400
     * @tc.desc      Testing @CustomEnv Date setDate operation triggers UI refresh
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0400] START');
      await CommonFunc.sleep(2000);
      try{
        let driver: Driver = Driver.create();
        // Click 'increase the day by 1' button to setDate from 08 to 09
        // Current date: 2022/09/08, setDate(getDate()+1) -> 2022/09/09
        let btn: Component = await driver.findComponent(ON.id('customEnvDate_dynamic_004'));
        await CommonFunc.sleep(1000);
        await btn.click();
        await CommonFunc.sleep(1000);

        // After setDate, date becomes 2022/09/09
        let text_1 = await (await driver.findComponent(ON.id('customEnvDate_dynamic_001'))).getText();
        await CommonFunc.sleep(1000);
        console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0400] component text_1: ' + text_1);
        expect(text_1).assertEqual('Selected Date: 9/9/2022');
      } catch (err){
        console.error("SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_COMPONENT_STATE_CUSTOMENVDATE_0400] END');
      done();
    });
  })
}
