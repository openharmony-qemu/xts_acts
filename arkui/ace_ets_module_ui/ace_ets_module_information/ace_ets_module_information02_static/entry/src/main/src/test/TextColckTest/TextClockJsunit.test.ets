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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import CommonFunc from '../../../ets/MainAbility/common/Common'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { MessageManager, Callback } from '../../../ets/MainAbility/utils/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { TextClockPageMessage } from "../../../ets/MainAbility/pages/TextClock/TextClockPage";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function TextClockJsunit() {
  describe('TextClockJsunit', () => {

    beforeAll(() => {
      console.info("TextClockJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextClock/TextClockPage",
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

    /* *
    * @tc.number: TextClock_0100
    * @tc.name  : TextClock_static_0100
    * @tc.desc  :
    * @tc.level : Level 2
    * @tc.type
    * @tc.size
    */
    it('TextClock_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of TextClock component
      console.info('[TextClock_static_0100] START');
      let strJson = inspector.getInspectorByKey('textClock');

      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('timeZoneOffset')).assertEqual('-8.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('hms');

      // Get the content of buttons
      let driver = Driver.create()
      let operation = await driver.findComponent(ON.id('operation'));
      let textOperation= await operation!.getText();
      expect(textOperation).assertEqual('run success');
      let change = await driver.findComponent(ON.id('change'));
      let textChange = await change!.getText();
      expect(textChange).assertEqual('change success');
      console.info('[TextClock_static_0100] END');
      done();
    });

    /* *
    * @tc.number: TextClock_0200
    * @tc.name  : TextClock_static_0200
    * @tc.desc  :
    * @tc.level : Level 2
    * @tc.type
    * @tc.size
    */
    it('TextClock_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the attribute of TextClock component
      console.info('[TextClock_static_0200] START');
      let textClockPageMessage = AppStorage.get<TextClockPageMessage>("TextClockPage", Type.from<TextClockPageMessage>()) as TextClockPageMessage
      textClockPageMessage.message.notify({name:'timeZoneOffset',value:8})
      await CommonFunc.sleep(1000);
      textClockPageMessage.message.notify({name:'format',value:'yyyyMMddHms'})
      await CommonFunc.sleep(1000);
      // Get the attribute of TextClock component
      let strJson = inspector.getInspectorByKey('textClock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_static_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('timeZoneOffset')).assertEqual('8.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('yyyyMMddHms');
      console.info('[TextClock_static_0200] END');
      done();
    });


    /* *
    * @tc.number: TextClock_0300
    * @tc.name  : TextClock_static_0300
    * @tc.desc  :
    * @tc.level : Level 2
    * @tc.type
    * @tc.size
    */
    it('TextClock_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify the functions of the button of start
      console.info('[TextClock_static_0300] START');

      // Click start button
      let driver = Driver.create()
      let startButton = await driver.findComponent(ON.text('start TextClock'));
      await (startButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let accumulateTime1 = await driver.findComponent(ON.id('accumulateTime'));
      let text1= await accumulateTime1!.getText();
      await CommonFunc.sleep(2000);
      let accumulateTime2 = await driver.findComponent(ON.id('accumulateTime'));
      let text2 = await accumulateTime2!.getText();
      expect(text1 == text2).assertFalse();
      console.info("[TextClock_static_0300] text1 and text2 not equal !");

      let change = await driver.findComponent(ON.id('change'));
      let textChange= await change!.getText();
      expect(textChange).assertEqual('change success');
      console.info("[TextClock_static_0300] change success !");

      let operation = await driver.findComponent(ON.id('operation'));
      let textOperation= await operation!.getText();
      expect(textOperation).assertEqual('start success');
      console.info("[TextClock_static_0300] start success !");
      console.info('[TextClock_static_0300] END');
      done();
    });

  })
}
