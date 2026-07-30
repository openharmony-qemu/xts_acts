'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
import { UIUtils } from '@kit.ArkUI';

export default function SVDeepListenObservedBuiltInTest(): void {
  describe('SVDeepListenObservedBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/stateVariableDeepListen/SVDeepListenObservedBuiltIn",
      }
      try {
        const svDeepListenTest = AppStorage.get<Router>("router") as Router;
        svDeepListenTest.clear();
        let pages: router.RouterState = svDeepListenTest.getState();
        if (!("SVDeepListenObservedBuiltIn" == pages.name)) {
          svDeepListenTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SVDeepListenObservedBuiltIn page error:" + err);
      }
    });

    beforeEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0100
     * @tc.number SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0100
     * @tc.desc   Test ObservedArray API observable - verify push and reverse operations trigger UI update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0100] START');

      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);

      // Step1: Verify initial state - ObservedArray shows [0, 1, 2]
      let strJson = inspector.getInspectorByKey('arrayText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0,1,2');

      // Step2: Click pushButton to add element, UI should refresh
      let button = await driver.findComponent(ON.id('pushButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('arrayText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0,1,2,3');

      // Step3: Click reverseButton to reverse array, UI should refresh
      button = await driver.findComponent(ON.id('reverseButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('arrayText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3,2,1,0');

      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0200
     * @tc.number SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0200
     * @tc.desc   Test ObservedMap API observable - verify set and delete operations trigger UI update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0200] START');

      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);

      // Step1: Click setButton to add new key-value pair, UI should refresh
      let button = await driver.findComponent(ON.id('setButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('mapText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0: a');


      // Step2: Click deleteButton to delete key=0 entry, UI should refresh
      button = await driver.findComponent(ON.id('deleteButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('mapText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('1: b');

      done();
    });

    /**
     * @tc.name   SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0300
     * @tc.number SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0300
     * @tc.desc   Test ObservedSet API observable - verify add and delete operations trigger UI update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0300] START');

      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);

      // Step1: Click addButton to add element, UI should refresh
      let button = await driver.findComponent(ON.id('addButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('setText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');

      // Step2: Click deleteSetButton to delete element 0, UI should refresh
      button = await driver.findComponent(ON.id('deleteSetButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('setText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('1');


      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0400
     * @tc.number SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0400
     * @tc.desc   Test ObservedDate API observable - verify setFullYear and setMonth operations trigger UI update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0400] START');

      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);

      // Step1: Verify initial state - date is 2026-05-01
      let strJson = inspector.getInspectorByKey('dateText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2026-05-01');
      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0400] Step1: Initial state verified - date is 2026-05-01');

      // Step2: Click increaseYearButton to increase year by 1, UI should refresh
      let button = await driver.findComponent(ON.id('increaseYearButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('dateText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2027-05-01');
      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0400] Step2: After click increaseYearButton - year increased to 2027');

      // Step3: Click increaseMonthButton to increase month by 1, UI should refresh
      button = await driver.findComponent(ON.id('increaseMonthButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('dateText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2027-06-01');
      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0400] Step3: After click increaseMonthButton - month increased to 06');

      console.info('[SUB_ARUI_SVDeepListenObservedBuiltInTest_static_0400] END');
      done();
    });
  });
}