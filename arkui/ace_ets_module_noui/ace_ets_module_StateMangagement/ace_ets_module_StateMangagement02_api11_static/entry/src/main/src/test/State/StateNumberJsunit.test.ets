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


export default function StateNumberJsunit() {
  describe('StateNumberJsunit', () => {
    beforeAll(() => {
      console.info("StateNumberJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("StateNumberJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateNumber',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<common.Context>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateNumberJsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get StateNumberJsunit pages.name:" + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateNumberJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateNumberJsunit page error:" + err);
      }
      console.info("StateNumberJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const StateNumber = AppStorage.get<Router>("StateNumber", Type.from<common.Context>()) as Router
      StateNumber.back({
        url: "MainAbility/pages/index/index"
      });
    });

    it('StateNumberJsunit_static_0100', 0, async (done: () => void): Promise<void> => {

      console.info('StateNumberJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('state_string');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumberJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_static_0100] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("string: hello");
      console.info('[StateNumberJsunit_static_0100] END');
      done();
    });

    it('StateNumberJsunit_static_0200', 0, async (done: () => void): Promise<void> => {

      console.info('StateNumberJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('state_string'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('state_string');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumberJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_static_0200] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("string: world");
      console.info('[StateNumberJsunit_static_0200] END');
      done();
    });

    it('StateNumberJsunit_static_0300', 0, async (done: () => void): Promise<void> => {

      console.info('StateNumberJsunit_static_0300 START');
      let strJson = inspector.getInspectorByKey('state_number');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumberJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_static_0300] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("number: 0");
      console.info('[StateNumberJsunit_static_0300] END');
      done();
    });

    it('StateNumberJsunit_static_0400', 0, async (done: () => void): Promise<void> => {

      console.info('StateNumberJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('state_number'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('state_number');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumberJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_static_0400] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("number: 8");
      console.info('[StateNumberJsunit_static_0400] END');
      done();
    });

    it('StateNumberJsunit_static_0500', 0, async (done: () => void): Promise<void> => {

      console.info('StateNumberJsunit_static_0500 START');
      let strJson = inspector.getInspectorByKey('state_Boolean');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumberJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_static_0500] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("Boolean: true");
      console.info('[StateNumberJsunit_static_0500] END');
      done();
    });

    it('StateNumberJsunit_static_0600', 0, async (done: () => void): Promise<void> => {

      console.info('StateNumberJsunit_static_0600 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('state_Boolean'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('state_Boolean');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumberJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_static_0600] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("Boolean: false");
      console.info('[StateNumberJsunit_static_0600] END');
      done();
    });

    it('StateNumberJsunit_static_0700', 0, async (done: () => void): Promise<void> => {

      console.info('StateNumberJsunit_static_0700 START');
      let strJson = inspector.getInspectorByKey('state_enum');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumberJsunit_static_0700] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_static_0700] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("enum: #ff0000ff");
      console.info('[StateNumberJsunit_static_0700] END');
      done();
    });

    it('StateNumberJsunit_static_0800', 0, async (done: () => void): Promise<void> => {

      console.info('StateNumberJsunit_static_0800 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('state_enum'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('state_enum');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateNumberJsunit_static_0800] component obj is: " + JSON.stringify(obj));
      console.info("[StateNumberJsunit_static_0800] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("enum: #ffff0000");
      console.info('[StateNumberJsunit_static_0800] END');
      done();
    });
  })
}

