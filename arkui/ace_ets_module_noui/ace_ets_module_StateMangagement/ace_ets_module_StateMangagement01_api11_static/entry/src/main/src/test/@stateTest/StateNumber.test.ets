/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "../../../../hypium/index"
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function StateNumber() {
  describe('StateNumber', () => {
    beforeAll(() => {
      console.info("StateNumber beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement01.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("StateNumber beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/@state/StateNumber",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<common.Context>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateNumber state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get StateNumber pages.name:" + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateNumber page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateNumber page error:" + err);
      }
      console.info("StateNumber beforeEach end");
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0010
    * @tc.name  : StateNumber_static_0100
    * @tc.desc  : To test that the State decorator supports union types.
    * @tc.level : Level 2
    */
    it('StateNumber_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('StateNumber_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('StateNumber');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumber_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumber_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Number]" number is 10');
      console.info('[StateNumber_static_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0020
    * @tc.name  : StateNumber_static_0200
    * @tc.desc  : To test that the State decorator supports union types.
    * @tc.level : Level 2
    */
    it('StateNumber_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('StateNumber_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('StateNumber');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumber_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumber_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Object]" number is {"pages":20}');
      console.info('[StateNumber_static_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0030
    * @tc.name  : StateNumber_static_0300
    * @tc.desc  : To test that the State decorator supports union types.
    * @tc.level : Level 2
    */
    it('StateNumber_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('StateNumber_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('StateNumber');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumber_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumber_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object String]" number is "30"');
      console.info('[StateNumber_static_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0040
    * @tc.name  : StateNumber_static_0400
    * @tc.desc  : To test that the State decorator supports union types.
    * @tc.level : Level 2
    */
    it('StateNumber_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('StateNumber_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('StateNumber');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumber_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumber_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Date]" number is "2021-08-08T00:00:00.000Z"');
      console.info('[StateNumber_static_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0050
    * @tc.name  : StateNumber_static_0500
    * @tc.desc  : To test that the State decorator supports union types.
    * @tc.level : Level 2
    */
    it('StateNumber_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('StateNumber_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('StateNumber');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumber_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumber_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Boolean]" number is true');
      console.info('[StateNumber_static_0100] END');
      done();
    })

  })
}

