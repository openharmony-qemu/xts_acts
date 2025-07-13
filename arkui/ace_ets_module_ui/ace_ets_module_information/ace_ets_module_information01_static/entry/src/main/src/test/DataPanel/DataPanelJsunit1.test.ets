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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Button,
  ButtonAttribute,
  ClickEvent,
  UserView,
  Image,
  ImageFit,
  Scroller,
} from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function datapanelJsunit1() {
  describe('dataPanelTest', (): void => {

    beforeAll(() => {
      console.info("dataPanelTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/dataPanel",
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
          await Utils.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    /**
     * @tc.number testDataPanel_static_01
     * @tc.name Test the properties of components
     * @tc.desc Set trackShadow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel_static_01 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius'))
        .assertEqual("6.000000")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX'))
        .assertEqual("2.000000")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY'))
        .assertEqual("1.000000")
      console.info('testDataPanel_static_01 END');
      done();
    });

    /**
     * @tc.number testDataPanel_static_02
     * @tc.name Test the properties of components
     * @tc.desc Set strokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel_static_02 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth')).assertEqual("25.00vp")
      console.info('testDataPanel_static_02 END');
      done();
    });

    /**
     * @tc.number testDataPanel_static_03
     * @tc.name Test the properties of components
     * @tc.desc Set trackBackgroundColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel_static_03 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackBackgroundColor'))
        .assertEqual("#08182431")
      console.info('testDataPanel_static_03 END');
      done();
    });

    /**
     * @tc.number testDataPanel_static_04
     * @tc.name Test the properties of components
     * @tc.desc Set valueColors values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel_static_04 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('valueColors')))
        .assertEqual('[[{"color":"#FF123456","offset":"0.000000"},{"color":"#FF123456","offset":"1.000000"}],[{"color":"#FF654321","offset":"0.000000"},{"color":"#FF654321","offset":"1.000000"}]]')
      console.info('testDataPanel_static_04 END');
      done();
    });

    /**
     * @tc.number testDataPanel_static_05
     * @tc.name Test the properties of components
     * @tc.desc Set closeEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel_static_05 START');
      let strJson = inspector.getInspectorByKey('DataPanelKey1');

      console.log("cd DataPanel JSON.parse(strJson)" +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('closeEffect')).assertEqual("true")
      console.info('testDataPanel_static_05 END');
      done();
    });

    /**
     * @tc.number testDataPanel_static_06
     * @tc.name Test the properties of components
     * @tc.desc Change strokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDataPanel_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDataPanel_static_06 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton')) as Component;
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = inspector.getInspectorByKey('DataPanelKey1'); //测试组件的key名称
      console.info("testDataPanel_static_06 component  is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('5.00vp'); //
      console.info('testDataPanel_static_06 END');
      done();
    });

  })
}