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

export default function FocusScopeId15() {
  describe('FocusScopeId15', () => {
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId15 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId15',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId15 state success " + JSON.stringify(pages));
        if (!("FocusScopeId15" == pages.name)) {
          console.info("get FocusScopeId15 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FocusScopeId15 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("FocusScopeId15 after each called");
    });

    /**
     * @tc.number    FocusScopeId15_static_0100
     * @tc.name      FocusScopeId15_static_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId15_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId15_static_0100] START');
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

      let scrollBar = await (driver.findComponent(ON.id('FocusScopeId15_scroll')) as Promise<Component>);
      let btn_requestFocus1 =
        await (scrollBar.scrollSearch(ON.id('FocusScopeId15_requestFocus1')) as Promise<Component>);
      await btn_requestFocus1.click()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopeId15_static_0100] btn_requestFocus1 click');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn2_1 = await (driver.findComponent(ON.id('FocusScopeId15_btn2_1')) as Promise<Component>);
      let btn2_1_isFocusedValue = await btn2_1.isFocused()
      expect(btn2_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId15_static_0100] btn2_1 isFocused');

      let btn_requestFocus2 =
        await (scrollBar.scrollSearch(ON.id('FocusScopeId15_requestFocus2')) as Promise<Component>);
      await btn_requestFocus2.click()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopeId15_static_0100] btn_requestFocus2 click');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn2_2 = await (driver.findComponent(ON.id('FocusScopeId15_btn2_2')) as Promise<Component>);
      let btn2_2_isFocusedValue = await btn2_2.isFocused()
      expect(btn2_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId15_static_0100] btn2_2 isFocused');

      let clearFocus = await (scrollBar.scrollSearch(ON.id('FocusScopeId15_clearFocus')) as Promise<Component>);
      await clearFocus.click()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopeId15_static_0100] clearFocus click');

      console.info('[FocusScopeId15_static_0100] END');
      done();
    });
  })
}
