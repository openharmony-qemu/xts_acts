/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,TestType,Size,Level} from "../../../../hypium/index"
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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function persistenceV2() {
  describe('persistenceV2', () => {
    beforeAll(() => {
      console.info("persistenceV2 beforeEach start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("persistenceV2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Storage/persistenceV2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get persistenceV2 state pages:" + JSON.stringify(pages));
        if (!("persistenceV2" == pages.name)) {
          console.info("get persistenceV2 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push persistenceV2 page error:" + err);
      }
      console.info("persistenceV2 beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("persistenceV2 after each called");
    });

    
    /*
     * @tc.number   persistenceV2_static_0100
     * @tc.name     persistenceV2_static_0100
     * @tc.desc     persistenceV2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('persistenceV2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[persistenceV2_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('persistenceV2_static_keys');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[persistenceV2_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertContain('keys in PersistenceV2: PerSample');
      console.info('[persistenceV2_static_0100] END');
      done();
    });

    
    /*
     * @tc.number   persistenceV2_static_0200
     * @tc.name     persistenceV2_static_0200
     * @tc.desc     persistenceV2_static_0200
     * @tc.level    Level.LEVEL0
     */
it('persistenceV2_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[persistenceV2_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component|null = await (driver.findComponent(ON.id("persistenceV2_static_p1")) as Promise<Component>);
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('persistenceV2_static_p1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[persistenceV2_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[persistenceV2_static_0200] content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('prop.p1: 2');

      let btn2: Component|null = await (driver.findComponent(ON.id("router_appStorageV2")) as Promise<Component>);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let btn3: Component|null = await (driver.findComponent(ON.id("router_persistenceV2")) as Promise<Component>);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('persistenceV2_static_p1');
      let obj2= JSON.parseJsonElement(strJson2);
      console.info("[persistenceV2_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[persistenceV2_static_0200] content2: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('prop.p1: 2');
      console.info('[persistenceV2_static_0200] END');
      done();
    });

    
    /*
     * @tc.number   persistenceV2_static_0300
     * @tc.name     persistenceV2_static_0300
     * @tc.desc     persistenceV2_static_0300
     * @tc.level    Level.LEVEL0
     */
it('persistenceV2_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[persistenceV2_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component|null = await (driver.findComponent(ON.id("persistenceV2_static_p2")) as Promise<Component>);
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('persistenceV2_static_p2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[persistenceV2_static_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[persistenceV2_static_0300] content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('prop.p2: 11a: 2');

      let btn2: Component|null = await (driver.findComponent(ON.id("persistenceV2_static_remove")) as Promise<Component>);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3: Component|null = await (driver.findComponent(ON.id("persistenceV2_static_connect")) as Promise<Component>);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('persistenceV2_static_p2');
      let obj2= JSON.parseJsonElement(strJson2);
      console.info("[persistenceV2_static_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[persistenceV2_static_0300] content2: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('prop.p2: 10a: 2');
      let btn6: Component|null = await (driver.findComponent(ON.id("btnPersistenceV2ClearKeys")) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await (btn6?.click() as Promise<void>);
      console.info('[persistenceV2_static_0300] END');
      done();
    });
  })
}
