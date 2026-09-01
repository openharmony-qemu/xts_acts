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

export default function FocusScopeId6() {
  describe('FocusScopeId6', () => {
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId6 state success " + JSON.stringify(pages));
        if (!("FocusScopeId6" == pages.name)) {
          console.info("get FocusScopeId6 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push FocusScopeId6 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("FocusScopeId6 after each called");
    });

    /**
     * @tc.number FocusScopeId6_static_0100
     * @tc.name FocusScopeId6_static_0100
     * @tc.desc Support for mixed focusing of focus groups and ordinary components
     * @tc.level Level 2
     */
    it('FocusScopeId6_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId6_static_0100] START');
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

      let btn1_1 = await (driver.findComponent(ON.id('FocusScopeId6_btn1_1')) as Promise<Component>);
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId6_static_0100] btn1_1 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn_del = await (driver.findComponent(ON.id('FocusScopeId6_btn_del')) as Promise<Component>);
      let btn_del_isFocusedValue = await btn_del.isFocused()
      expect(btn_del_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId6_static_0100] btn_del isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn1_2 = await (driver.findComponent(ON.id('FocusScopeId6_btn1_2')) as Promise<Component>);
      let btn1_2_isFocusedValue = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId6_static_0100] btn1_2 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn_btn = await (driver.findComponent(ON.id('FocusScopeId6_btn_btn')) as Promise<Component>);
      let btn_btn_isFocusedValue = await btn_btn.isFocused()
      expect(btn_btn_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId6_static_0100] btn_btn isFocused');

      let clearFocus = await (driver.findComponent(ON.id('FocusScopeId6_clearFocus')) as Promise<Component>);
      await clearFocus.click()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopeId6_static_0100] clearFocus click');

      console.info('[FocusScopeId6_static_0100] END');
      done();
    });
  })
}
