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


import events_emitter from '@ohos.events.emitter';
import {Color,$r,ItemState} from '@ohos.arkui.component'
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

// function sleep(time: number) {
//   return new Promise<void>((resolve, reject) => {
//     setTimeout(() => {
//       resolve();
//     }, time * 1000);
//   }).then(() => {
//     console.info(`sleep ${time} over...`);
//   })
// }


export default function stepperJsunit1() {


  describe('stepperTest', () => {
    beforeAll(() => {
      console.info("stepperTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[stepperTest] after each called');
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      await UtilsTest.msSleep(1000)
    });



    
/**
     * @tc.number   testStepper_static_010
     * @tc.name     testStepper_static_010
     * @tc.desc     testStepper_static_010
     * @tc.level    Level.LEVEL0
     */
    it('testStepper_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testStepper010 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/Stepper1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("push stepper page error " + JSON.stringify(err));
      }
      await UtilsTest.msSleep(1000)
      let strJson: string = inspector.getInspectorByKey('stepper');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[stepper] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Stepper');
      expect(obj.getElement('$attrs').getString('index')).assertEqual('0');
      console.info('testStepper010 End');
      done();
    });
  })
}
