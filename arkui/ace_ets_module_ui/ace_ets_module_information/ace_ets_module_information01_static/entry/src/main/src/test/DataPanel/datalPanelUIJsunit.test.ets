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
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, MatchPattern, DisplayRotation, ResizeDirection, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
import config from '@ohos.accessibility.config';
import { AppStorage } from '@ohos.arkui.stateManagement';
import accessibility from '@ohos.accessibility';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { DataPanelType } from '@ohos.arkui.component';
import { PatternLockPage1 } from "../../../ets/MainAbility/pages/DataPanel/DatalPanelUI";
import inspector from '@ohos.arkui.inspector'
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

export default function datalPanelUIJsunit() {
  describe('datalPanelUIJsunit', () => {
    beforeAll(() => {
      console.info("datalPanelUIJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DataPanel/DatalPanelUI",
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

    it('datalPanelUIJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("datalPanelUIJsunit_static_0100'] component obj is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('values')));
      let valus: string = obj.getElement('$attrs').getString('values');
      let expectV: string = [25, 1].toString();
      expect(valus == expectV).assertTrue();
      expect(obj.getElement('$attrs').getString('max')).assertEqual('26.000000');
      expect(obj.getElement('$attrs').getElement('type')).assertEqual('DataPanelType.Line');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('DataPanelType.Line');

    });

    it('datalPanelUIJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      let patternLockPage1 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage1.message.notify({
        name: 'message', value: 'hello 0'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_static_0200'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('type')).assertEqual('DataPanelType.Line');

    });

    it('datalPanelUIJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
      let patternLockPage2 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage2.message.notify({
        name: 'dataPanelType', value: '3'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_static_0300'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('type')).assertEqual('DataPanelType.Circle');
    });

    it('datalPanelUIJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      let patternLockPage3 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage3.message.notify({
        name: 'values', value: '[10,10,10,10,10,10,10,10,10]'
      })
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("datalPanelUIJsunit_static_0400'] component obj is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('values')));
      let valus: string = obj.getElement('$attrs').getString('values');
      let expectV: string = [10, 10, 10, 10, 10, 10, 10, 10, 10].toString();
      expect(valus == expectV).assertTrue();
      done();
    });

    it('datalPanelUIJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_static_0500 START');
      await CommonFunc.sleep(1000);
      let patternLockPage4 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage4.message.notify({
        name: 'values', value: '[-50,33,1,22,33,33,333,21,31,10]'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("datalPanelUIJsunit_static_0500'] component obj is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('values')));
      let valus: string = obj.getElement('$attrs').getString('values');
      let expectV: string = [0, 33, 1, 22, 33, 33, 333, 21, 31].toString();
      expect(valus == expectV).assertTrue();
      expect(obj.getElement('$attrs').getString('max')).assertEqual('507.000000');
      done();
    });

    it('datalPanelUIJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      let patternLockPage5 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage5.message.notify({
        name: 'maxValue', value: '27'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_static_0600'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('max')).assertEqual('27.000000');
      done();
    });

    it('datalPanelUIJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_static_0700 START');
      await CommonFunc.sleep(1000);
      let patternLockPage6 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage6.message.notify({
        name: 'values', value: '[-3,10,10,10,10,10,10,10,10,90]'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage7 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage7.message.notify({
        name: 'maxValue', value: '-30'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_static_0700'] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getElement('options')));
      expect(obj.getElement('$attrs').getString('max')).assertEqual('80.000000');
      done();
    });

    it('datalPanelUIJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('datalPanelUIJsunit_static_0800 START');
      await CommonFunc.sleep(1000);
      let patternLockPage8 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage8.message.notify({
        name: 'values', value: '[10,10,10,10,10,10,10,10,10]'
      })
      await CommonFunc.sleep(2000);
      let patternLockPage9 = AppStorage.get<PatternLockPage1>("DataPanelExample", Type.from<PatternLockPage1>()) as PatternLockPage1
      patternLockPage9.message.notify({
        name: 'maxValue', value: '0'
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('dp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[datalPanelUIJsunit_static_0800'] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getElement('max')));
      expect(obj.getElement('$attrs').getString('max')).assertEqual('90.000000');
      done();
    });
  })
}