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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "../../../../hypium/index"
import router from '@ohos.router';
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

export default function ObjectLinkSet() {
  describe('ObjectLinkSet', () => {
    beforeAll(() => {
      console.info("ObjectLinkSet beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ObjectLinkSet beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/ObjectLinkSet',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<common.Context>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObjectLinkSet state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ObjectLinkSet pages.name:" + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObjectLinkSet page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkSet page error:" + err);
      }
      console.info("ObjectLinkSet beforeEach end");
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_ObjectLinkSet_static_0010
    * @tc.name  : ObjectLinkSet_static_0100
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ObjectLinkSet_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('ObjectLinkSet_static_0100 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('ObtLinkSet_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ObtLinkSet_set'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ObtLinkSet_value_5');
      console.info("[ObjectLinkSet_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ObjectLinkSet_static_0100] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('5,5');
      console.info('[ObjectLinkSet_static_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_ObjectLinkSet_static_0020
    * @tc.name  : ObjectLinkSet_static_0200
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ObjectLinkSet_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('ObjectLinkSet_static_0200 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('ObtLinkSet_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ObtLinkSet_clear'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ObtLinkSet_value_0');
      console.info("[ObjectLinkSet_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ObjectLinkSet_static_0200] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('0,0');
      console.info('[ObjectLinkSet_static_0200] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_ObjectLinkSet_static_0030
    * @tc.name  : ObjectLinkSet_static_0300
    * @tc.desc  : Test if the state decorator supports SET types.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('ObjectLinkSet_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('ObjectLinkSet_static_0300 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('ObtLinkSet_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ObtLinkSet_delete'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ObtLinkSet_value_2');
      console.info("[ObjectLinkSet_static_0300] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ObjectLinkSet_static_0300] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('2,2');
      console.info('[ObjectLinkSet_static_0300] END');
      done();
    });
  })
}