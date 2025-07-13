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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { Driver, Component, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function gaugeJsunit() {
  describe('gaugeJsunit', () => {
    beforeAll(() => {
      console.info("gaugeJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gauge",
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
     * @tc.number testGauge_static_0121
     * @tc.name Test the properties of components
     * @tc.desc Set strokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0121', 0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_0121] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      console.info("[testGauge_static_0121] JSON.parse(strJsonNew) testGauge_static_0121JSON.parse(strJsonNew) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('5.00vp');
      console.info('[testGauge_static_0121] END');
      done();
    });

    /**
     * @tc.number testGauge_static_0122
     * @tc.name Test the properties of components
     * @tc.desc Set endAngle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0122', 0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_0122] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      console.info("[testGauge_static_0122] JSON.parse(strJsonNew) testGauge_static_0122JSON.parse(strJsonNew) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('endAngle')).assertEqual('360.00');
      console.info('[testGauge_static_0122] END');
      done();
    });

    /**
     * @tc.number testGauge_static_0123
     * @tc.name Test the properties of components
     * @tc.desc Set startAngle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0123', 0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_0123] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      console.info("[testGauge_static_0123] JSON.parse(strJsonNew) testGauge_static_0123JSON.parse(strJsonNew) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('startAngle')).assertEqual('0.00');
      console.info('[testGauge_static_0123] END');
      done();
    });

    /**
     * @tc.number testGauge_static_0124
     * @tc.name Test the properties of components
     * @tc.desc Set value values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0124', 0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_0124] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      console.info("[testGauge_static_0124] JSON.parse(strJsonNew) testGauge_static_0124JSON.parse(strJsonNew) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('value')).assertEqual('1.00');
      console.info('[testGauge_static_0124] END');
      done();
    });

    /**
     * @tc.number testGauge_static_0125
     * @tc.name Test the properties of components
     * @tc.desc Set colors values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0125', 0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_0125] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      console.info("[testGauge_static_0125] JSON.parse(strJsonNew) testGauge_static_0125JSON.parse(strJsonNew) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('colors'))
        .assertEqual('[[[["#FF123456","0.000000"]],1],[[["#FF654321","0.000000"]],2]]');
      console.info('[testGauge_static_0125] END');
      done();
    });

    /**
     * @tc.number testGauge_static_0126
     * @tc.name Test the properties of components
     * @tc.desc Set indicator values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0126', 0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_0126] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      console.info("[testGauge_static_0126] JSON.parse(strJsonNew) testGauge_static_0126JSON.parse(strJsonNew) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      let indicator = JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('indicator');
      expect(indicator.getString('icon')).assertEqual("abc");
      expect(indicator.getString('space')).assertEqual("15.00px");
      console.info('[testGauge_static_0126] END');
      done();
    });

    /**
     * @tc.number testGauge_static_0127
     * @tc.name Test the properties of components
     * @tc.desc Set shadow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0127', 0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_0127] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGauge_static_0127] JSON.parse(strJsonNew) testGauge_static_0127JSON.parse(strJsonNew) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      let trackShadow = JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('trackShadow');
      expect(Number(trackShadow.getInteger('radius'))).assertEqual(5);
      expect(Number(trackShadow.getInteger('offsetX'))).assertEqual(15);
      expect(Number(trackShadow.getInteger('offsetY'))).assertEqual(15);
      console.info('[testGauge_static_0127] END');
      done();
    });

    /**
     * @tc.number testGauge_static_0128
     * @tc.name Test the properties of components
     * @tc.desc Set shadow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0128', 0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_0128] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGauge_static_0128] JSON.parse(strJsonNew) testGauge_static_0128 is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('description')).assertEqual(undefined);
      console.info('[testGauge_static_0128] END');
      done();
    });

    /**
     * @tc.number testGauge_static_0129
     * @tc.name Test the properties of components
     * @tc.desc Change strokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge_static_0129', 0, async (done: () => void): Promise<void> => {
      console.info('testGauge_static_0129 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>)
      await Utils.sleep(2000)

      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      console.info("[testGauge_static_0129]  component  is:  " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('5.00vp');
      console.info('testGauge_static_0129 END');
      done();
    });
  })
}
