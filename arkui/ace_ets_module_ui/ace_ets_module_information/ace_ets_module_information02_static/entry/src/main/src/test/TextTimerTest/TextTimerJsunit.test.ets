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
import inspector from '@ohos.arkui.inspector'
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from "../../../../hypium/index.ets";
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { TextTimerPageMessage } from "../../../ets/MainAbility/pages/TextTimer/TextTimerPage";
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function TextTimerJsunit() {
  describe('TextTimerJsunit', () => {
    beforeAll(() => {
      console.info("TextTimerApiTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextTimer/TextTimerPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    it('TextTimerJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of TextTimer component
      console.info('[TextTimerJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('textTimer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextTimerJsunit_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[TextTimerJsunit_static_0100] isCountDown: " + obj.getElement('$attrs').getString('isCountDown'));
      console.info("[TextTimerJsunit_static_0100] count: " + obj.getElement('$attrs').getString('count'));
      console.info("[TextTimerJsunit_static_0100] format: " + obj.getElement('$attrs').getString('format'));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('isCountDown')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('count')).assertEqual('50000.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('mm:ss.SS');

      // Get default attributes of TextTimer component
      let strJson1 = inspector.getInspectorByKey('default');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[TextTimerJsunit_static_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[TextTimerJsunit_static_0100] isCountDown1: " + obj1.getElement('$attrs').getString('isCountDown'));
      console.info("[TextTimerJsunit_static_0100] count1: " + obj1.getElement('$attrs').getString('count'));
      console.info("[TextTimerJsunit_static_0100] format1: " + obj1.getElement('$attrs').getString('format'));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('isCountDown')).assertEqual('false');
      expect(obj1.getElement('$attrs').getString('count')).assertEqual('60000.000000');
      expect(obj1.getElement('$attrs').getString('format')).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_static_0100] END');
      done();
    });

    it('TextTimerJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the attribute of TextTimer component
      console.info('[TextTimerJsunit_static_0200] START');
      let textTimerPageMessage = AppStorage.get<TextTimerPageMessage>("TextTimerPage", Type.from<TextTimerPageMessage>()) as TextTimerPageMessage
      textTimerPageMessage.message.notify({name:'isCountDown',value:'false'})
      await CommonFunc.sleep(1000);
      textTimerPageMessage.message.notify({name:'count',value:30000})
      await CommonFunc.sleep(1000);
      textTimerPageMessage.message.notify({name:'format',value:'HH:mm:ss.SS'})
      await CommonFunc.sleep(2000);

      // Get the attribute of TextTimer component
      let strJson = inspector.getInspectorByKey('textTimer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextTimerJsunit_static_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[TextTimerJsunit_static_0200] isCountDown: " + obj.getElement('$attrs').getString('isCountDown'));
      console.info("[TextTimerJsunit_static_0200] count: " + obj.getElement('$attrs').getString('count'));
      console.info("[TextTimerJsunit_static_0200] format: " + obj.getElement('$attrs').getString('format'));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('isCountDown')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('count')).assertEqual('30000.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_static_0200] END');
      done();
    });

    it('TextTimerJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify start function of TextTimer component
      console.info('[TextTimerJsunit_static_0300] START');
      let driver = Driver.create()
      let utc = await driver.findComponent(ON.id('utcNum'));
      let utcText = await utc!.getText();
      console.info("[TextTimerJsunit_static_0300] utcText: " + utcText);

      let startButton = await driver.findComponent(ON.text('start'));
      await (startButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let utcText1 = await utc!.getText();
      console.info("[TextTimerJsunit_static_0300] utcText1: " + utcText1);
      expect(Number(utcText) < Number(utcText1)).assertTrue();

      let elapsedTime = await driver.findComponent(ON.id('elapsedTime'));
      let time = await elapsedTime!.getText();
      console.info("[TextTimerJsunit_static_0300] time: " + time);
      expect(Number(time) > 100).assertTrue();

      let start = await driver.findComponent(ON.id('start'));
      let startText = await start!.getText();
      console.info("[TextTimerJsunit_static_0300] startText: " + startText);
      expect(startText).assertEqual('start:succ');
      console.info('[TextTimerJsunit_static_0300] END');
      done();
    });

    it('TextTimerJsunit_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify pause function of TextTimer component
      console.info('[TextTimerJsunit_static_0400] START');
      let driver = Driver.create()
      let pauseButton = await driver.findComponent(ON.text('pause'));
      await (pauseButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let utc = await driver!.findComponent(ON.id('utcNum'));
      let utcText = await utc!.getText();
      console.info("[TextTimerJsunit_static_0400] utcText: " + utcText);

      let elapsedTime = await driver.findComponent(ON.id('elapsedTime'));
      let time = await elapsedTime!.getText();
      console.info("[TextTimerJsunit_static_0400] time: " + time);
      await CommonFunc.sleep(1000);

      let utcText1 = await utc!.getText();
      console.info("[TextTimerJsunit_static_0400] utcText1: " + utcText1);
      expect(utcText == utcText1).assertTrue();

      let time1 = await elapsedTime!.getText();
      console.info("[TextTimerJsunit_static_0400] time1: " + time1);
      expect(time == time1).assertTrue();

      let startButton = await driver.findComponent(ON.text('start'));
      await (startButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let utcText2 = await utc!.getText();
      console.info("[TextTimerJsunit_static_0400] utcText2: " + utcText2);
      expect(Number(utcText1) < Number(utcText2)).assertTrue();

      let pause = await driver.findComponent(ON.id('pause'));
      let pauseText = await pause!.getText();
      console.info("[TextTimerJsunit_static_0400] pauseText: " + pauseText);
      expect(pauseText).assertEqual('pause:succ');
      console.info('[TextTimerJsunit_static_0400] END');
      done();
    });

    it('TextTimerJsunit_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify reset function of TextTimer component
      console.info('[TextTimerJsunit_static_0500] START');
      let driver = Driver.create()
      let utc = await driver!.findComponent(ON.id('utcNum'));
      let utcText = await utc!.getText();
      console.info("[TextTimerJsunit_static_0300] utcText: " + utcText);
      await CommonFunc.sleep(1000);

      let resetButton = await driver!.findComponent(ON.text('reset'));
      await (resetButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver!.findComponent(ON.id('reset'));
      let resetText = await button!.getText();
      console.info("[TextTimerJsunit_static_0500] resetText: " + resetText);
      expect(resetText).assertEqual('reset:succ');

      let utcText1 = await utc!.getText();
      console.info("[TextTimerJsunit_static_0300] utcText1: " + utcText1);
      expect(Number(utcText) < Number(utcText1)).assertTrue();

      let elapsedTime = await driver!.findComponent(ON.id('elapsedTime'));
      let time1 = await elapsedTime!.getText();
      console.info("[TextTimerJsunit_static_0300] time1: " + time1);
      await CommonFunc.sleep(1000);
      let utcText2 = await utc!.getText();
      console.info("[TextTimerJsunit_static_0300] utcText2: " + utcText2);
      expect(utcText1 == utcText2).assertTrue();

      let time2 = await elapsedTime!.getText();
      console.info("[TextTimerJsunit_static_0300] time2: " + time2);
      expect(time1 == time2).assertTrue();
      console.info('[TextTimerJsunit_static_0500] END');
      done();
    });

    it('TextTimerJsunit_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Illegal modification of properties of TextTimer component
      console.info('[TextTimerJsunit_static_0600] START');
      let textTimerPageMessage = AppStorage.get<TextTimerPageMessage>("TextTimerPage", Type.from<TextTimerPageMessage>()) as TextTimerPageMessage
      textTimerPageMessage.message.notify({name:'isCountDown',value:123})
      await CommonFunc.sleep(1000);
      textTimerPageMessage.message.notify({name:'count',value:'abc'})
      await CommonFunc.sleep(1000);
      textTimerPageMessage.message.notify({name:'format',value:123})
      await CommonFunc.sleep(2000);

      // Get the attribute of TextTimer component
      let strJson = inspector.getInspectorByKey('textTimer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextTimerJsunit_static_0600] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[TextTimerJsunit_static_0600] isCountDown: " + obj.getElement('$attrs').getString('isCountDown'));
      console.info("[TextTimerJsunit_static_0600] count: " + obj.getElement('$attrs').getString('count'));
      console.info("[TextTimerJsunit_static_0600] format: " + obj.getElement('$attrs').getString('format'));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('isCountDown')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('count')).assertEqual('50000.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_static_0600] END');
      done();
    });
  })
}
