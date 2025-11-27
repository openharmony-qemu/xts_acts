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

export default function stepperLayout002() {
  describe('stepperLayout002', () => {
    beforeAll(() => {
      console.info("stepperLayout002 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
              let driver: Driver = Driver.create();
  let size = await driver.getDisplaySize();
  if (size.x != 466 && size.y != 466) {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperLayout/stepperLayout002',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stepperLayout002 state success " + JSON.stringify(pages));
        if (!("stepperLayout002" == pages.name)) {
          console.info("get stepperLayout002 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push stepperLayout002 page error: " + err);
      }
  }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperLayout002 after each called");
    });


    
/*
     * @tc.number   stepperLayout_static_0020
     * @tc.name     stepperLayout_static_0020
     * @tc.desc     stepperLayout_static_0020
     * @tc.level    Level.LEVEL0
     */
    it('stepperLayout_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperLayout0020 START');
      await Utils.sleep(2000);
      let stepperJson: string = inspector.getInspectorByKey('stepper2');
      let flexJson: string = inspector.getInspectorByKey('flex');
      console.info("[stepperLayout0020] component status stepperJson:" + stepperJson);
      expect(JSON.parseJsonElement(stepperJson).getString('$type')).assertEqual('Stepper');
      expect(JSON.parseJsonElement(flexJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(stepperJson).getElement('$attrs').getString('width')).assertEqual(JSON.parseJsonElement(flexJson).getElement('$attrs').getString('width'));
      expect(JSON.parseJsonElement(stepperJson).getElement('$attrs').getString('height')).assertEqual(JSON.parseJsonElement(flexJson).getElement('$attrs').getString('height'));
      done();
    });
  })
}
