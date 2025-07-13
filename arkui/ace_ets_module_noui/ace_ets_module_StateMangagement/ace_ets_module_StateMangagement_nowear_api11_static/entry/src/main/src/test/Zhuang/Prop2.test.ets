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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
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

export default function Prop2() {
  describe('Prop2', () => {
    beforeAll(() => {
      console.info("Prop2 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("Prop2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Zhuang/Prop2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<common.Context>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Prop2 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Prop2 pages.name:" + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Prop2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Prop2 page error:" + err);
      }
      console.info("Prop2 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const prop2 = AppStorage.get<Router>("prop2", Type.from<common.Context>()) as Router;
      prop2.back()
    });
    /**
     * @tc.number    SUB_ACE_Prop2_static_0100
     * @tc.name      Prop2_static_0100
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('Prop2_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('Prop2_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prop2Btn1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prop2Btn1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prop2_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[Prop2_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      console.info('[Prop2_static_0100] END');
      done();

    });
    /**
     * @tc.number    SUB_ACE_Prop2_static_0200
     * @tc.name      Prop2_static_0200
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('Prop2_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('Prop2_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prop2Btn2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prop2Btn2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prop2_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[Prop2_static_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      console.info('[Prop2_static_0200] END');
      done();

    });

    /**
     * @tc.number    SUB_ACE_Prop2_static_0300
     * @tc.name      Prop2_static_0300
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('Prop2_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('Prop2_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prop2Btn3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prop2Btn3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prop2_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[Prop2_static_0300] title: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      console.info('[Prop2_static_0300] END');
      done();

    });
    /**
     * @tc.number    SUB_ACE_Prop2_static_0400
     * @tc.name      Prop2_static_0400
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('Prop2_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('Prop2_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prop2Btn4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prop2Btn4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prop2_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[Prop2_static_0400] title: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      console.info('[Prop2_static_0400] END');
      done();

    });

    /**
     * @tc.number    SUB_ACE_Prop2_static_0500
     * @tc.name      Prop2_static_0500
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('Prop2_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('Prop2_static_0500 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('ziProp2Btn1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ziProp2Btn1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prop2_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[Prop2_static_0500] title: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      console.info('[Prop2_static_0500] END');
      done();

    });
    /**
     * @tc.number    SUB_ACE_Prop2_static_0600
     * @tc.name      Prop2_static_0600
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('Prop2_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info('Prop2_static_0600 START');
      let driver = Driver.create()
      // await driver.swipe(100,500,100,100)
      // await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ziProp2Btn2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ziProp2Btn2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prop2_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[Prop2_static_0600] title: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      console.info('[Prop2_static_0600] END');
      done();

    });

    /**
     * @tc.number    SUB_ACE_Prop2_static_0700
     * @tc.name      Prop2_static_0700
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('Prop2_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info('Prop2_static_0700 START');
      let driver = Driver.create()
      // await driver.swipe(100,500,100,100)
      // await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ziProp2Btn3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ziProp2Btn3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prop2_static_0700] component obj is: " + JSON.stringify(obj));
      console.info("[Prop2_static_0700] title: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      console.info('[Prop2_static_0700] END');
      done();

    });
    /**
     * @tc.number    SUB_ACE_Prop2_static_0800
     * @tc.name      Prop2_static_0800
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('Prop2_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info('Prop2_static_0800 START');
      let driver = Driver.create()
      // await driver.swipe(100,500,100,100)
      // await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ziProp2Btn4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ziProp2Btn4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prop2_static_0800] component obj is: " + JSON.stringify(obj));
      console.info("[Prop2_static_0800] title: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      console.info('[Prop2_static_0800] END');
      done();

    });


  })
}

