'use static';
/**
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

import events_emitter from '@ohos.events.emitter';
import {Color,$r} from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function StepperTest1() {
  describe('StepperTest1', () => {
    beforeAll(() => {
      console.info("StepperTest1 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear12.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("StepperTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stepper/StepperTest1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StepperTest1 state success " + JSON.stringify(pages));
        if (!("StepperTest1" == pages.name)) {
          console.info("get StepperTest1 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push StepperTest1 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StepperTest1 after each called");
    });

    
    
/**
     * @tc.number   StepperTest1_static_0100
     * @tc.name     StepperTest1_static_0100
     * @tc.desc     StepperTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('StepperTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StepperTest1_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let text:Component = await driver.findComponent(ON.text('下一步')) as Component;
      await text.click()
      console.info('[StepperTest1_0100] text click');
      await CommonFunc.sleep(2000);

      let text2:Component = await driver.findComponent(ON.text('跳过')) as Component;
      await text2.click()
      console.info('[StepperTest1_0100] text2 click');
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('StepperTest1_text');
      await CommonFunc.sleep(1000);
      console.info("[StepperTest1_0100] obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('PageFour');

      console.info('[StepperTest1_0100] END');
      done();
    });
  })
}

