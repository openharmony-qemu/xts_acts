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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
export default function RouterRecoverable() {
  describe('RouterRecoverable', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("RouterRecoverable beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/RouterRecoverable',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RouterRecoverable state pages:" + JSON.stringify(pages));
        if (!("RouterRecoverable" == pages.name)) {
          console.info("get RouterRecoverable pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RouterRecoverable page error:" + err);
      }
      console.info("RouterRecoverable beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("RouterRecoverable after each called");
    });


    /**
     * @tc.number    RouterRecoverable_static_0100
     * @tc.name      RouterRecoverable_static_0100
     * @tc.desc      Test RouterRecoverable
     * @tc.level     Level 2
     */
    it('RouterRecoverable_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RouterRecoverable_static_0100 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('routerBtnId1')) as Promise<Component>);
      await btn1.click()
      console.info('[ReplaceDestination1_0100] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('RouterPage2Id');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RouterRecoverable_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[RouterRecoverable_static_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('routerPage2');

      console.info('RouterRecoverable_static_0100 END');
      done();
    });

  })
}
