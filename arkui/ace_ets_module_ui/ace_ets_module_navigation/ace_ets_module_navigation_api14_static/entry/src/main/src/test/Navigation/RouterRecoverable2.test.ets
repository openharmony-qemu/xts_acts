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
export default function RouterRecoverable2() {
  describe('RouterRecoverable2', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("RouterRecoverable2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/RouterRecoverable',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RouterRecoverable2 state pages:" + JSON.stringify(pages));
        if (!("RouterRecoverable2" == pages.name)) {
          console.info("get RouterRecoverable2 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RouterRecoverable2 page error:" + err);
      }
      console.info("RouterRecoverable2 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("RouterRecoverable2 after each called");
    });


    /**
     * @tc.number    RouterRecoverable2_static_0100
     * @tc.name      RouterRecoverable2_static_0100
     * @tc.desc      Test RouterRecoverable2
     * @tc.level     Level 2
     */
    it('RouterRecoverable2_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RouterRecoverable2_static_0100 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('routerBtnId2')) as Promise<Component>);
      await btn1.click()
      console.info('[RouterRecoverable2_static_0100] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('RouterPage2Id');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RouterRecoverable2_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[RouterRecoverable2_static_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('routerPage2');

      console.info('ReplaceDestination1_0100 END');
      console.info('RouterRecoverable2_static_0100 END');
      done();
    });
  })
}