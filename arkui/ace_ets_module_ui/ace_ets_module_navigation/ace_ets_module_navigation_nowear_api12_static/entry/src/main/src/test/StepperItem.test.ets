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
import {Color,$r} from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function stepperItem() {
    describe('stepperItemJsunit', () => {
      beforeAll(() => {
        console.info("StepperTest1 beforeAll start");
        await UtilsTest.startAbility("com.arkui.ace.navigationnowear12.static", "EntryAbility")
        await UtilsTest.msSleep(4000)
      });
      beforeEach(async () => {
        console.info("stepperItemJsunit beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/stepperItem',
        }
        try {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.clear();
          let pages = routerInstance.getState();
          console.info("get stepperItem state pages: " + JSON.stringify(pages));
          if (!("stepperItem" == pages.name)) {
            console.info("get stepperItem state pages.name: " + JSON.stringify(pages.name));
            routerInstance.pushUrl(options);
            await CommonFunc.sleep(2000);
          }
        } catch (err) {
          console.error("push stepperItem page error: " + err);
        }
      })

    
    
/*
     * @tc.number   sArkUX_Stage_StepperItem_static_0100
     * @tc.name     sArkUX_Stage_StepperItem_static_0100
     * @tc.desc     sArkUX_Stage_StepperItem_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('sArkUX_Stage_StepperItem_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[sArkUX_Stage_StepperItem_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('nextLabel1');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----sArkUX_Stage_StepperItem_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('nextLabel')));
          expect(obj.getElement('$attrs').getString('nextLabel')).assertEqual("textLabel");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('sArkUX_Stage_StepperItem_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })
  })
}
