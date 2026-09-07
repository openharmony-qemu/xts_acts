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

export default function FocusScopeId10() {
  describe('FocusScopeId10', () => {
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId10',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId10 state success " + JSON.stringify(pages));
        if (!("FocusScopeId10" == pages.name)) {
          console.info("get FocusScopeId10 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push FocusScopeId10 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("FocusScopeId10 after each called");
    });

    /**
     * @tc.number    FocusScopeId10_static_0100
     * @tc.name      FocusScopeId10_static_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId10_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId10_static_0100] START');
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

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn3 = await (driver.findComponent(ON.id('FocusScopeId10_btn3')) as Promise<Component>);
      let btn3_isFocusedValue = await btn3.isFocused()
      expect(btn3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn3 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn4 = await (driver.findComponent(ON.id('FocusScopeId10_btn4')) as Promise<Component>);
      let btn4_isFocusedValue = await btn4.isFocused()
      expect(btn4_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn4 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn6 = await (driver.findComponent(ON.id('FocusScopeId10_btn6')) as Promise<Component>);
      let btn6_isFocusedValue = await btn6.isFocused()
      expect(btn6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn6 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn7 = await (driver.findComponent(ON.id('FocusScopeId10_btn7')) as Promise<Component>);
      let btn7_isFocusedValue = await btn7.isFocused()
      expect(btn7_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn7 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn3_isFocusedValue2 = await btn3.isFocused()
      expect(btn3_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn3 isFocused 2');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn4_isFocusedValue2 = await btn4.isFocused()
      expect(btn4_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn4 isFocused 2');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn5 = await (driver.findComponent(ON.id('FocusScopeId10_btn5')) as Promise<Component>);
      let btn5_isFocusedValue = await btn5.isFocused()
      expect(btn5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn5 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn6_isFocusedValue2 = await btn6.isFocused()
      expect(btn6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn6 isFocused 2');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn7_isFocusedValue2 = await btn7.isFocused()
      expect(btn7_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn7 isFocused 2');

      let clearFocus = await (driver.findComponent(ON.id('FocusScopeId10_btn5')) as Promise<Component>);
      await clearFocus.click()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopeId10_static_0100] clearFocus click');

      console.info('[FocusScopeId10_static_0100] END');
      done();
    });
  })
}
