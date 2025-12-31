'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import {Color,$r,Component} from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import Utils from '../../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function stepperInterface001() {
  describe('stepperInterface001', () => {
    beforeAll(() => {
      console.info("stepperInterface001 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperInterface/stepperInterface001',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stepperInterface001 state success " + JSON.stringify(pages));
        if (!("stepperInterface001" == pages.name)) {
          console.info("get stepperInterface001 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push stepperInterface001 page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperInterface001 after each called");
    });


    
/**
     * @tc.number   stepperInterface_static_0010
     * @tc.name     stepperInterface_static_0010
     * @tc.desc     stepperInterface_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('stepperInterface_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('stepperInterface0010 START');
          let driver: Driver = Driver.create();
          await driver.delayMs(1000);
          await driver.assertComponentExist(ON.text('0'));
          let button:Component = await driver.findComponent(ON.text('Next')) as Component
          await button.click();
          await driver.delayMs(1000);
          await driver.assertComponentExist(ON.text('1'));
          done();
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
