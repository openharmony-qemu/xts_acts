'use static';
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
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function CustomEnvDate(): void {
  describe('CustomEnvDateTest', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvDate',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvDate state pages:' + JSON.stringify(pages));
        if (!('CustomEnvDate' == pages.name)) {
          console.info('get CustomEnvDate state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvDate page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvDate after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvDate_0100
     * @tc.number SUB_ARKUI_CustomEnvDate_0100
     * @tc.desc   test @CustomEnv decorator with Date type - verify initial state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvDate_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvDate_0100] START');
      await CommonFunc.sleep(1500);
      try{
        // Verify initial state - selected date is 2021-08-08
        let strJson = inspector.getInspectorByKey('customEnvDate_001');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CustomEnvDate_0100] content is: ' + content);
        expect(content).assertContain('Selected Date: 8/8/2021');
      } catch (err) {
        console.error("SUB_ARKUI_CustomEnvDate_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CustomEnvDate_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvDate_0200
     * @tc.number SUB_ARKUI_CustomEnvDate_0200
     * @tc.desc   test @CustomEnv Date - verify setFullYear operation updates year
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvDate_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvDate_0200] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the increase the year by 1 button
        let btn = await driver.findComponent(ON.id('customEnvDate_002'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        // Verify the year has been increased to 2022
        let strJson = inspector.getInspectorByKey('customEnvDate_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CustomEnvDate_0200] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CustomEnvDate_0200] content is: ' + content);

        expect(content).assertContain('Selected Date: 8/8/2022');
      } catch (err){
        console.error("SUB_ARKUI_CustomEnvDate_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CustomEnvDate_0200] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvDate_0300
     * @tc.number SUB_ARKUI_CustomEnvDate_0300
     * @tc.desc   test @CustomEnv Date - verify setMonth operation updates month
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvDate_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvDate_0300] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the increase the month by 1 button
        let btn = await driver.findComponent(ON.id('customEnvDate_003'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        // Verify the month has been increased (from August to September)
        let strJson = inspector.getInspectorByKey('customEnvDate_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CustomEnvDate_0300] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CustomEnvDate_0300] content is: ' + content);

        // After setMonth, month changes from 7 (August) to 8 (September) or to 0 (January if wraps around)
        // The date string should contain 9 or 1 indicating month change
        expect(content).assertContain('Selected Date: 9/8/2022');
      } catch (err){
        console.error("SUB_ARKUI_CustomEnvDate_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CustomEnvDate_0300] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvDate_0400
     * @tc.number SUB_ARKUI_CustomEnvDate_0400
     * @tc.desc   test @CustomEnv Date - verify setDate operation updates day
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvDate_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvDate_0400] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the increase the day by 1 button
        let btn = await driver.findComponent(ON.id('customEnvDate_004'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        // Verify the day has been increased to 9
        let strJson = inspector.getInspectorByKey('customEnvDate_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CustomEnvDate_0400] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CustomEnvDate_0400] content is: ' + content);

        expect(content).assertContain('Selected Date: 9/9/2022');
      } catch (err){
        console.error("SUB_ARKUI_CustomEnvDate_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CustomEnvDate_0400] END')
      done();
    });

  })
}
