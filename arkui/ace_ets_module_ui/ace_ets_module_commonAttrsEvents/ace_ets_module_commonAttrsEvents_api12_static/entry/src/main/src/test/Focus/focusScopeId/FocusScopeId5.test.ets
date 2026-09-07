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

export default function FocusScopeId5() {
  describe('FocusScopeId5', () => {
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId5',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId5 state success " + JSON.stringify(pages));
        if (!("FocusScopeId5" == pages.name)) {
          console.info("get FocusScopeId5 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push FocusScopeId5 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("FocusScopeId5 after each called");
    });

    /**
     * @tc.number FocusScopeId5_static_0100
     * @tc.name FocusScopeId5_static_0100
     * @tc.desc Support for mixed focusing of focus groups and ordinary components
     * @tc.level Level 2
     */
    it('FocusScopeId5_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId5_static_0100] START');
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

      let btn3_6 = await (driver.findComponent(ON.id('FocusScopeId5_btn3_6')) as Promise<Component>);
      let btn3_6_isFocusedValue = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_static_0100] btn3_6 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn_clearFocus = await (driver.findComponent(ON.id('FocusScopeId5_clearFocus')) as Promise<Component>);
      let btn_clearFocus_isFocusedValue = await btn_clearFocus.isFocused()
      expect(btn_clearFocus_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_static_0100] btn_clearFocus isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn_requestFocus = await (driver.findComponent(ON.id('FocusScopeId5_requestFocus')) as Promise<Component>);
      let btn_requestFocus_isFocusedValue = await btn_requestFocus.isFocused()
      expect(btn_requestFocus_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_static_0100] btn_requestFocus isFocused');

      let clearFocus = await (driver.findComponent(ON.id('FocusScopeId5_clearFocus')) as Promise<Component>);
      await clearFocus.click()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopeId5_static_0100] clearFocus click');

      console.info('[FocusScopeId5_static_0100] END');
      done();
    });
  })
}
