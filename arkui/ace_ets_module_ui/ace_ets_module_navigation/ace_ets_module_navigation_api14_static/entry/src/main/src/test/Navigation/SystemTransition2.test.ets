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
export default function SystemTransition2() {
  describe('SystemTransition2', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('SystemTransition2 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/SystemTransition2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SystemTransition2 state pages:' + JSON.stringify(pages));
        if (!('SystemTransition2' == pages.name)) {
          console.info('get SystemTransition2 pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push SystemTransition2 page error:' + err);
      }
      console.info('SystemTransition2 beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SystemTransition2 after each called');
    });


    /**
     * @tc.number    SystemTransition2_static_0100
     * @tc.name      SystemTransition2_static_0100
     * @tc.desc      Test SystemTransition2 and NavigationSystemTransitionType.DEFAULT
     * @tc.level     Level 2
     */
    it('SystemTransition2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SystemTransition2_static_0100 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await (driver.findComponent(ON.id('pushOneId')) as Promise<Component>);
      await btn1.click()
      console.info('[SystemTransition2_static_0100] btn1 click');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('pageOneId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SystemTransition2_static_0100] component obj is: ' + JSON.stringify(obj));
      console.log('[SystemTransition2_static_0100] systemTransition is: ' + JSON.stringify(obj.getElement('$attrs').getString('systemTransition')));
      expect(obj.getElement('$attrs').getString('systemTransition')).assertEqual('NavigationSystemTransitionType.DEFAULT');


      let btn2 = await (driver.findComponent(ON.id('popId')) as Promise<Component>);
      await btn2.click()
      console.info('[SystemTransition2_static_0100] btn2 click');
      await CommonFunc.sleep(1000);
      console.info('SystemTransition2_static_0100 END');
      done();
    });

    /**
     * @tc.number    SystemTransition2_static_0200
     * @tc.name      SystemTransition2_static_0200
     * @tc.desc      Test SystemTransition2 and NavigationSystemTransitionType.NONE
     * @tc.level     Level 2
     */
    it('SystemTransition2_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SystemTransition2_static_0200 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await btn1.click()
      console.info('[SystemTransition2_static_0200] btn1 click');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('pageTwoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SystemTransition2_static_0200] component obj is: ' + JSON.stringify(obj));
      console.log('[SystemTransition2_static_0200] systemTransition is: ' + JSON.stringify(obj.getElement('$attrs').getString('systemTransition')));
      expect(obj.getElement('$attrs').getString('systemTransition')).assertEqual('NavigationSystemTransitionType.NONE');

      console.info('SystemTransition2_static_0200 END');
      done();
    });

  })
}