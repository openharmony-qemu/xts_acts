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
export default function SystemTransition() {
  describe('SystemTransition', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('SystemTransition beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/SystemTransition2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SystemTransition state pages:' + JSON.stringify(pages));
        if (!('SystemTransition' == pages.name)) {
          console.info('get SystemTransition pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push SystemTransition page error:' + err);
      }
      console.info('SystemTransition beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SystemTransition after each called');
    });


    /**
     * @tc.number    SystemTransition_static_0100
     * @tc.name      SystemTransition_static_0100
     * @tc.desc      Test systemTransition and NavigationSystemTransitionType.FADE
     * @tc.level     Level 2
     */
    it('SystemTransition_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SystemTransition_static_0100 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await (driver.findComponent(ON.id('btnOneId')) as Promise<Component>);
      await btn1.click()
      console.info('[SystemTransition_static_0100] btn1 click');
      await CommonFunc.sleep(200);


      let strJson = inspector.getInspectorByKey('text1Id');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SystemTransition_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SystemTransition_static_0100] systemTransition obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('one');

      let popBtn = await (driver.findComponent(ON.id('pop1Id')) as Promise<Component>);
      await popBtn.click()
      console.info('[SystemTransition_static_0100] popBtn click');

      console.info('SystemTransition_static_0100 END');
      done();
    });

    /**
     * @tc.number    SystemTransition_static_0200
     * @tc.name      SystemTransition_static_0200
     * @tc.desc      Test systemTransition and NavigationSystemTransitionType.EXPLODE
     * @tc.level     Level 2
     */
    it('SystemTransition_static_0200',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SystemTransition_static_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn2 = await (driver.findComponent(ON.id('btnTwoId')) as Promise<Component>);
      await btn2.click()
      console.info('[SystemTransition_static_0200] btn2 click');
      await CommonFunc.sleep(200);


      let strJson = inspector.getInspectorByKey('text2Id');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SystemTransition_static_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[SystemTransition_static_0200] systemTransition obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('two');

      let popBtn = await (driver.findComponent(ON.id('pop2Id')) as Promise<Component>);
      await popBtn.click()
      console.info('[SystemTransition_static_0200] popBtn click');

      console.info('SystemTransition_static_0200 END');
      done();
    });

    /**
     * @tc.number    SystemTransition_0300
     * @tc.name      SystemTransition_0300
     * @tc.desc      Test systemTransition and NavigationSystemTransitionType.SLIDE_RIGHT
     * @tc.level     Level 2
     */
    it('SystemTransition_static_0300',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SystemTransition_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn2 = await (driver.findComponent(ON.id('btnThreeId')) as Promise<Component>);
      await btn2.click()
      console.info('[SystemTransition_0300] btn2 click');
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('text3Id');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SystemTransition_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[SystemTransition_0300] systemTransition obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('three');

      let popBtn = await (driver.findComponent(ON.id('pop3Id')) as Promise<Component>);
      await popBtn.click()
      console.info('[SystemTransition_0300] popBtn click');
      await CommonFunc.sleep(200);

      console.info('SystemTransition_0300 END');
      done();
    });

    /**
     * @tc.number    SystemTransition_0400
     * @tc.name      SystemTransition_0400
     * @tc.desc      Test systemTransition and NavigationSystemTransitionType.SLIDE_BOTTOM
     * @tc.level     Level 2
     */
    it('SystemTransition_static_0400',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SystemTransition_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn2 = await (driver.findComponent(ON.id('btnFourId')) as Promise<Component>);
      await btn2.click()
      console.info('[SystemTransition_0400] btn2 click');
      await CommonFunc.sleep(200);


      let strJson = inspector.getInspectorByKey('text4Id');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SystemTransition_0400] component obj is: ' + JSON.stringify(obj));
      console.info('[SystemTransition_0400] systemTransition obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('four');

      console.info('SystemTransition_0400 END');
      done();
    });
  })
}