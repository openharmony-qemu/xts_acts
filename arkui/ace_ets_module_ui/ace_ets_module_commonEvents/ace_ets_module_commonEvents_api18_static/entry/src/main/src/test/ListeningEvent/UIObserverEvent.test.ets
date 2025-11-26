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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function UIObserverEventTest() {

  describe('UIObserverEventTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListeningEvent/UIObserverEvent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get UIObserverEventTest state pages: " + JSON.stringify(pages));
        if (!("UIObserverEvent" == pages.name)) {
          console.info("get UIObserverEventTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push UIObserverEventTest page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("UIObserverEventTest after each called");
    });


    
    /*
     * @tc.number   UIObserverEventTest_static_0100
     * @tc.name     UIObserverEventTest_static_0100
     * @tc.desc     UIObserverEventTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('UIObserverEventTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('UIObserverEventTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('tap'));
      await CommonFunc.sleep(2000);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('observerGestureEvent');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('tap');
      await CommonFunc.sleep(1000);
      console.info('[UIObserverEventTest_static_0100] END');
      done();
    });


    
    /*
     * @tc.number   UIObserverEventTest_static_0200
     * @tc.name     UIObserverEventTest_static_0200
     * @tc.desc     UIObserverEventTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('UIObserverEventTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('UIObserverEventTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('click'));
      await CommonFunc.sleep(2000);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('observerEvent');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('click');
      await CommonFunc.sleep(1000);
      console.info('[UIObserverEventTest_static_0200] END');
      done();
    });


    
    /*
     * @tc.number   UIObserverEventTest_static_0300
     * @tc.name     UIObserverEventTest_static_0300
     * @tc.desc     UIObserverEventTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('UIObserverEventTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('UIObserverEventTest_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('cancel'));
      await CommonFunc.sleep(2000);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('cancel1');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('cancel');
      await CommonFunc.sleep(1000);
      console.info('[UIObserverEventTest_static_0300] END');
      done();
    });
  })
}
