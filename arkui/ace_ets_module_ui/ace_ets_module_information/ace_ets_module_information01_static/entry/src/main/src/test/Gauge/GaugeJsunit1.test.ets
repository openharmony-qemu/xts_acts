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
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
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

export default function gaugeJsunit1() {
  describe('gaugeTest', () => {
    beforeAll(() => {
      console.info("gaugeJsunit1 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gauge/gauge",
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

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("gauge after each called");
    });

    it('testGauge_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('gauge');
      console.info("[testGauge_static_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$type')).assertEqual('Gauge');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth')).assertEqual('20.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('20.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('20.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual('50.00');
      done()
    });

    it('testGauge_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "gaugeValue": 10
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_002] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');
      console.info("[testGauge_static_002] component JSON.parse(strJsonNew) i " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('value')).assertEqual('10.00');

      done()
    });

    it('testGauge_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_003] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthValue": "30",
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_003] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');
      console.info("[testGauge_static_003] component JSON.parse(strJsonNew) i " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('30.00vp');
      done()
    });

    it('testGauge_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startAngleValue": 200
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_004] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('gauge');

      console.info("[testGauge_static_004] component JSON.parse(strJsonNew) i " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('startAngle')).assertEqual('200.00');
      done()
    });

    it('testGauge_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endAngleValue": 200
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_005] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');

      console.info("[testGauge_static_005] component JSON.parse(strJsonNew) i " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('endAngle')).assertEqual('200.00');
      done()
    });

    it('testGauge_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          // data: {
          // "colorValues": JSON.stringifyJsonElement([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1]])
          // } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 103,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_006] change component data error: " + (err as BusinessError).message);
      }
      done()
    });

    it('testGauge_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_007] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "gaugeValue": -10
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 904,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_007] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');

      console.info("[testGauge_static_007] component JSON.parse(strJsonNew) i " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('value')).assertEqual('-10.00');
      done()
    });

    it('testGauge_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_008] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthValue": "-30",
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 904,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_008] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_008] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');

      console.info("[testGauge_static_008] component JSON.parse(strJsonNew) i " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('-30.00vp');
      done()
    });

    it('testGauge_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_009] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startAngleValue": -10
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 905,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_009] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_009] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');

      console.info("[testGauge_static_009] component JSON.parse(strJsonNew) i " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('startAngle')).assertEqual('-10.00');
      done()
    });

    it('testGauge_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_010] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endAngleValue": -10
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 906,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_010] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_010] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');
      console.info("[testGauge_static_010] component JSON.parse(strJsonNew) i " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('endAngle')).assertEqual('-10.00');
      done()
    });

    it('testGauge_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge_static_011] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthValue": "121111111"
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 905,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge_static_011] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge_static_011] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('gauge');
      console.info("[testGauge_static_011] component JSON.parse(strJsonNew) i " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth'))
        .assertEqual('121111111.00vp');
      done()
    });
  })
}
