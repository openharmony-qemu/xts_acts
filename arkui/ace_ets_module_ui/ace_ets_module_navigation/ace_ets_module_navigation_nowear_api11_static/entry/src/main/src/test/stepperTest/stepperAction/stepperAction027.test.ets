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
import {Color,$r} from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import Utils from '../../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component ,DisplayRotation} from '@ohos.UiTest';
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

export default function stepperAction027() {
  describe('stepperAction027', () => {
    beforeAll(() => {
      console.info("stepperAction027 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperAction/stepperAction027',
      }
      try {
   const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stepperAction027 state success " + JSON.stringify(pages));
        if (!("stepperAction027" == pages.name)) {
          console.info("get stepperAction027 state success " + JSON.stringify(pages.name));
         routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push stepperAction027 page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperAction027 after each called");
    });


    
/*
     * @tc.number   stepperAction_static_0270
     * @tc.name     stepperAction_static_0270
     * @tc.desc     stepperAction_static_0270
     * @tc.level    Level.LEVEL0
     */
    it('stepperAction_static_0270', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('stepperAction0270 START');
          let driver: Driver = Driver.create();
          await driver.delayMs(1000);
          await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
          await driver.delayMs(1000);
          await driver.assertComponentExist(ON.text('Page One'));
          let button: Component = await driver.findComponent(ON.text('Next1111111111111111111111111111111111111111111111111')) as Component;
          console.info('click Next1');
          await button.click();
          await driver.delayMs(1000);
          await driver.assertComponentExist(ON.text('Page Two'));
          let button1: Component = await driver.findComponent(ON.text('Next2222222222222222222222222222222222222222222222222')) as Component;
          console.info('click Next2');
          await button1.click();
          await driver.delayMs(1000);
          await driver.assertComponentExist(ON.text('Page Three'));
          let button2: Component = await driver.findComponent(ON.text('Previous2222222222222222222222222222222222222222222222222222')) as Component;
          console.info('click Previous2');
          await button2.click();
          await driver.delayMs(1000);
          await driver.assertComponentExist(ON.text('Page Two'));
          let button3: Component = await driver.findComponent(ON.text('Previous111111111111111111111111111111111111111111111111111')) as Component;
          console.info('click Previous1');
          await button3.click();
          await driver.delayMs(1000);
          await driver.assertComponentExist(ON.text('Page One'));
          await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
          await driver.delayMs(500);
          done();
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
