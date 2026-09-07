'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function FocusScopeId14() {
  describe('FocusScopeId14', () => {
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId14 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId14',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId14 state success " + JSON.stringify(pages));
        if (!("FocusScopeId14" == pages.name)) {
          console.info("get FocusScopeId14 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FocusScopeId14 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("FocusScopeId14 after each called");
    });

    /**
     * @tc.number    FocusScopeId14_static_0100
     * @tc.name      FocusScopeId14_static_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId14_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId14_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let driver = Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btnOpen = await (driver.findComponent(ON.id('FocusScopeId14_open')) as Promise<Component>);
      await btnOpen.click()
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopeId14_static_0100] btnOpen click');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn1 = await (driver.findComponent(ON.id('FocusScopeId14_btn1')) as Promise<Component>);
      let btn1_isFocusedValue = await btn1.isFocused()
      expect(btn1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId14_static_0100] btn1 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn4 = await (driver.findComponent(ON.id('FocusScopeId14_btn4')) as Promise<Component>);
      let btn4_isFocusedValue = await btn4.isFocused()
      expect(btn4_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId14_static_0100] btn4 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn1_isFocusedValue2 = await btn1.isFocused()
      expect(btn1_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId14_static_0100] btn1 isFocused 2');

      let btn2 = await (driver.findComponent(ON.id('FocusScopeId14_btn2')) as Promise<Component>);
      await btn2.click()
      console.info('[FocusScopeId14_static_0100] btn2 click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn2_isFocusedValue = await btn2.isFocused()
      expect(btn2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId14_static_0100] btn2 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn4_isFocusedValue2 = await btn4.isFocused()
      expect(btn4_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId14_static_0100] btn4 isFocused 2');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn2_isFocusedValue2 = await btn2.isFocused()
      expect(btn2_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId14_static_0100] btn2 isFocused 2');

      await btn4.click()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopeId14_static_0100] close click');

      console.info('[FocusScopeId14_static_0100] END');
      done();
    });
  })
}
