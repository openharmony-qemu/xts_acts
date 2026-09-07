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

export default function FocusScopePriority13() {
  describe('FocusScopePriority13', () => {
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopePriority13 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopePriority/FocusScopePriority13',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopePriority13 state success " + JSON.stringify(pages));
        if (!("FocusScopePriority13" == pages.name)) {
          console.info("get FocusScopePriority13 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FocusScopePriority13 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("FocusScopePriority13 after each called");
    });

    /**
     * @tc.number    FocusScopePriority13_static_0100
     * @tc.name      FocusScopePriority13_static_0100
     * @tc.desc      Test FocusScopePriority
     * @tc.level     Level 2
     */
    it('FocusScopePriority13_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopePriority13_static_0100] START');
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

      let open = await (driver.findComponent(ON.id('FocusScopePriority13_open')) as Promise<Component>);
      await open.click()
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopePriority13_static_0100] open click');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn2_1 = await (driver.findComponent(ON.id('FocusScopePriority13_btn2_1')) as Promise<Component>);
      let btn2_1_isFocusedValue = await btn2_1.isFocused()
      expect(btn2_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority13_static_0100] btn2_1 isFocused');

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

      let btn2_2 = await (driver.findComponent(ON.id('FocusScopePriority13_btn2_2')) as Promise<Component>);
      let btn2_2_isFocusedValue = await btn2_2.isFocused()
      expect(btn2_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority13_static_0100] btn2_2 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn3_2 = await (driver.findComponent(ON.id('FocusScopePriority13_btn3_2')) as Promise<Component>);
      let btn3_2_isFocusedValue = await btn3_2.isFocused()
      expect(btn3_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority13_static_0100] btn3_2 isFocused');

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

      let btn2_1_isFocusedValue2 = await btn2_1.isFocused()
      expect(btn2_1_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority13_static_0100] btn2_1 isFocused 2');

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

      let btn1_2 = await (driver.findComponent(ON.id('FocusScopePriority13_btn1_2')) as Promise<Component>);
      let btn1_2_isFocusedValue = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority13_static_0100] btn1_2 isFocused');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn2_2_isFocusedValue2 = await btn2_2.isFocused()
      expect(btn2_2_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority13_static_0100] btn2_2 isFocused 2');

      await driver.triggerKey(2049);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn3_2_isFocusedValue2 = await btn3_2.isFocused()
      expect(btn3_2_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority13_static_0100] btn3_2 isFocused 2');

      let close = await (driver.findComponent(ON.id('FocusScopePriority13_close')) as Promise<Component>);
      await close.click()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[FocusScopePriority13_static_0100] close click');

      console.info('[FocusScopePriority13_static_0100] END');
      done();
    });
  })
}
