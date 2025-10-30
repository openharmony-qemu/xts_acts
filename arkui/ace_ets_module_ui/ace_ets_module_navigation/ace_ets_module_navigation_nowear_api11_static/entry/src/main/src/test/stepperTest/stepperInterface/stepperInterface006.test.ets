/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function stepperInterface006() {
  describe('stepperInterface006', () => {

    beforeAll(() => {
      console.info("stepperInterface006 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("stepperInterface006 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperInterface/stepperInterface006',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stepperInterface006 state success " + JSON.stringify(pages));
        if (!("stepperInterface006" == pages.name)) {
          console.info("get stepperInterface006 state success " + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await Utils.sleep(2000);

        }
      } catch (err) {
        console.error("push stepperInterface006 page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperInterface006 after each called");
    });

    /*
     * @tc.number       SUB_ACE_UI_COMPONENT_NAV_STEPPER_INTERFACE_0060
     * @tc.name         stepperInterface_static_0060
     * @tc.desc         stepperInterface0060
     */
    it('stepperInterface_static_0060',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperInterface0060 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let text1: Component = await driver.findComponent(ON.text('0')) as Component;
      await driver.delayMs(1000);
      console.info('text11111111');
      console.info(JSON.stringify(text1));
      await driver.assertComponentExist(ON.text('0'));
      let button: Component = await driver.findComponent(ON.text('Next')) as Component;
      await button.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('1'));
      try{
        let button1: Component = await driver.findComponent(ON.text('Previous')) as Component;
        await button1.click();
      }catch(err) {
        err = err as BusinessError ;
        expect(err).assertFail()
      }
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('0'));
      done();
    });
  })
}
