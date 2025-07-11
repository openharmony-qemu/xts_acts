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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import { Component, Driver, ON, MatchPattern, DisplayRotation } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import { PatternLockPage1 } from "../../../ets/MainAbility/pages/Gauge/gauge3";
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';
const waitUiReadyMs = 1000;

export default function gauge3Jsunit() {
  describe('gauge3Jsunit', () => {
    beforeAll(() => {
      console.info("gauge3Jsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gauge/gauge3",
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


    it('gauge3Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      // get the gauge component and test attribute
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_static_0100 component obj is:' + JSON.stringifyJsonElement(obj));
      console.info("gauge3Jsunit_static_0100 component obj startAngle is:" +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('startAngle')));
      console.info("gauge3Jsunit_static_0100 component obj startAngle is:" +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('endAngle')));
      console.info("gauge3Jsunit_static_0100 component obj startAngle is:" +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('strokeWidth')));
      console.info("gauge3Jsunit_static_0100 component obj startAngle is:" +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('colors')));

      expect(obj.getElement('$attrs').getString('startAngle')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('endAngle')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('30.00');
      expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('max')).assertEqual('100.00');
      let colors: string = obj.getElement('$attrs').getString('colors');
      console.info('gauge3Jsunit_static_0100 component obj is: ' + colors);
      expect(colors)
        .assertEqual('[[[["#FF317AF7","0.000000"]],0.10000000149011612],[[["#FF5BA854","0.000000"]],0.20000000298023224],[[["#FFE08C3A","0.000000"]],0.300000011920929],[[["#FF9C554B","0.000000"]],0.40000000596046448]]');
      done();
    });

    it('gauge3Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'startAngle', value: '20'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage2 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage2.message.notify({
        name: 'strokeWidth', value: '30'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage3 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage3.message.notify({
        name: 'endAngle', value: '270'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage4 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage4.message.notify({
        name: 'colors', value: '[[0x317AF6, 0.3], [0x5BA854, 0.3], [0xE08C3A, 0.4], [0x9A554B, 0.4]]'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_static_0200 component obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('startAngle')).assertEqual('20.00');
      expect(obj.getElement('$attrs').getString('endAngle')).assertEqual('270.00');
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('30.00vp');
      let colors: string = obj.getElement('$attrs').getString('colors');
      console.info('gauge3Jsunit_static_0200 component obj is: ' + colors);
      expect(colors)
        .assertEqual('[[[["#FF317AF6","0.000000"]],0.300000011920929],[[["#FF5BA854","0.000000"]],0.300000011920929],[[["#FFE08C3A","0.000000"]],0.40000000596046448],[[["#FF9A554B","0.000000"]],0.40000000596046448]]');
      done();
    });

    it('gauge3Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      let patternLockPage5 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage5.message.notify({
        name: 'value', value: '40'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage6 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage6.message.notify({
        name: 'min', value: '20'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage7 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage7.message.notify({
        name: 'max', value: '90'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('max')).assertEqual('100.00');
      done();
    });


    it('gauge3Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      let patternLockPage8 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage8.message.notify({
        name: 'startAngle', value: '-30'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage9 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage9.message.notify({
        name: 'strokeWidth', value: '-30'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage10 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage10.message.notify({
        name: 'endAngle', value: '450'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage11 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage11.message.notify({
        name: 'colors', value: '[[0x317AF6, 2], [0x5BA, 0.3], [0xE08C3A, 0.4], [0x9A554B, 0.4]]}'
      })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_static_0400 component obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('startAngle')).assertEqual('-30.00');
      expect(obj.getElement('$attrs').getString('endAngle')).assertEqual('450.00');
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('-30.00vp');
      let colors: string = obj.getElement('$attrs').getString('colors');
      console.info('gauge3Jsunit_static_0400 component obj is: ' + colors);
      expect(colors)
        .assertEqual('[[[["#FF317AF6","0.000000"]],2],[[["#FF0005BA","0.000000"]],0.300000011920929],[[["#FFE08C3A","0.000000"]],0.40000000596046448],[[["#FF9A554B","0.000000"]],0.40000000596046448]]');
      done();
    });

    it('gauge3Jsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_static_0500 START');
      await CommonFunc.sleep(1000);
      // test the illegal parameter
      let patternLockPage12 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage12.message.notify({
        name: 'value', value: '-40'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage13 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage13.message.notify({
        name: 'min', value: '-6'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage14 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage14.message.notify({
        name: 'max', value: '-7'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('max')).assertEqual('100.00');
      done();
    });

    it('gauge3Jsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      let patternLockPage15 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage15.message.notify({
        name: 'wth', value: '20'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_static_0600 component obj is: ' + JSON.stringifyJsonElement(obj));

      expect(obj.getElement('$attrs').getString('width')).assertEqual('20.00vp')
      done();
    });

    it('gauge3Jsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_static_0700 START');
      await CommonFunc.sleep(1000);
      let patternLockPage16 = AppStorage.get<PatternLockPage1>("Gauge3Example", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage16.message.notify({
        name: 'wth', value: '-60'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_static_0700 component obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('width')).assertEqual('200.00vp')
      done();
    });

  })
}