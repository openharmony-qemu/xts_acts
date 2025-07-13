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
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Component, Driver, Component, ON } from '@ohos.UiTest'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textTimer() {
  describe('textTimerTest', () => {
    beforeAll(() => {
      console.info("textTimer beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/textTimer",
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

    /**
     * @tc.number textTimerJsunit_0100
     * @tc.name Test the properties of components
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0100] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      console.info('textTimerJsunit_static_0100 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0200
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0200 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0200] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFC0CB');
      console.info('textTimerJsunit_static_0200 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0300
     * @tc.name Test the properties of components
     * @tc.desc Set format values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0300 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0300] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('format')).assertEqual('mm:ss.SS');
      console.info('textTimerJsunit_static_0300 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0400
     * @tc.name Test the properties of components
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0400 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0400] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('textTimerJsunit_static_0400 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0500
     * @tc.name Test the properties of components
     * @tc.desc Set fontStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0500 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0500] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      console.info('textTimerJsunit_static_0500 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0600
     * @tc.name Test the properties of components
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0600 START');
      let strJson =inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0600] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      console.info('textTimerJsunit_static_0600 END');
      done();
    });
    /**
     * @tc.number textTimerJsunit_0601
     * @tc.name Test the properties of components
     * @tc.desc Change fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_static_0601', 0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0601 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000)
      let strJsonNew = inspector.getInspectorByKey('TextTimerKey1'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("textTimerJsunit_static_0601 component  is: " + JSON.stringifyJsonElement(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('fontSize')).assertEqual('5.00fp'); //
      console.info('textTimerJsunit_static_0601 END');
      done();
    });
  })
}
