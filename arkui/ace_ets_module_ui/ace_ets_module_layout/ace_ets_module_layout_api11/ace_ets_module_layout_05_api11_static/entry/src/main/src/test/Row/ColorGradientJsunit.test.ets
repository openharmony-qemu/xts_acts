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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { ResourceColor, GradientDirection } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

class SweepGradientValue {
  center!: [number, number];
  start!: number;
  colors!: Array<[ResourceColor, number]>;
  end!: number;
  repeating!: boolean;
}

class RadialGradientValue {
  center!: [number, number];
  radius!: number | string;
  colors!: Array<[ResourceColor, number]>;
  repeating!: boolean;
}

class LinearGradientValue {
  angle!: number;
  direction!: GradientDirection;
  colors!: Array<[ResourceColor, number]>;
  repeating!: boolean;
}
interface AttrContent {
  linearGradient: LinearGradientValue;
  sweepGradient: SweepGradientValue;
  radialGradient: RadialGradientValue;
}
export default function colorGradientJsunit() {
  describe('borderTest_five_2', () => {
    beforeAll(() => {
      console.info("colorGradientJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("colorGradientJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/colorGradient',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get colorGradientJsunit state pages: " + JSON.stringify(pages));
        if (!("blank3" == pages.name)) {
          console.info("get colorGradientJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push colorGradientJsunit page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("colorGradient after each called");
    });
    /**
     * @tc.number testColorGradient001_static_001
     * @tc.name testColorGradient001_static_001
     * @tc.level 0
     */
    it('testColorGradient001_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('[testColorGradient001_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('linearGradient');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testColorGradient001_static_001] component JSON.parse(strJson) is: " + JSON.stringify(obj.getElement('$attrs').getElement('linearGradient')));
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('angle')).assertEqual('90.00px');
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('direction')).assertEqual('GradientDirection.Left');
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('repeating')).assertEqual('true');
      console.info('[testColorGradient001_static_001] END');
      done();
    });
    /**
     * @tc.number testColorGradient002_static_02
     * @tc.name testColorGradient002_static_02
     * @tc.level 0
     */
    it('testColorGradient002_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('[testColorGradient002_static_02] START');
      await CommonFunc.sleep(1000);
      let linearGradientValue: LinearGradientValue = {
        angle: 80,
        direction: GradientDirection.Top,
        colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
        repeating: false
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "linearGradientValue": JSON.stringify(linearGradientValue)
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 5,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testColorGradient002_static_02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testColorGradient002_static_02] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('linearGradient');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testColorGradient002_static_02] component JSON.parse(strJsonNew) is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('angle')).assertEqual('80.00px');
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('direction')).assertEqual('GradientDirection.Top');
      expect(obj.getElement('$attrs').getElement('linearGradient').getString('repeating')).assertEqual('false');
      console.info('[testColorGradient002_static_02] END');
      done();
    });
    /**
     * @tc.number testColorGradient003_static_03
     * @tc.name testColorGradient003_static_03
     * @tc.level 0
     */
    it('testColorGradient003_static_03', 0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      console.info('[testColorGradient003_static_03] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('sweepGradient');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testColorGradient003_static_03] component JSON.parse(strJson) is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('sweepGradient').getString('end')).assertEqual('359.00px');
      expect(obj.getElement('$attrs').getElement('sweepGradient').getString('start')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('sweepGradient').getString('repeating')).assertEqual('true');
      console.info('[testColorGradient003_static_03] END');
      done();
    });
    /**
     * @tc.number testColorGradient004_static_04
     * @tc.name testColorGradient004_static_04
     * @tc.level 0
     */
    it('testColorGradient004_static_04', 0, async (done: () => void): Promise<void> => {
      console.info('[testColorGradient004_static_04] START');
      await CommonFunc.sleep(1000);
      let sweepGradientValue: SweepGradientValue = {
        center: [50, 50],
        start: 10,
        end: 356,
        colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
        repeating: false
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "sweepGradientValue": JSON.stringify(sweepGradientValue)
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testColorGradient004_static_04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testColorGradient004_static_04] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('sweepGradient');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testColorGradient004_static_04] component JSON.parse(strJsonNew) is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('sweepGradient').getString('end')).assertEqual('356.00px');
      expect(obj.getElement('$attrs').getElement('sweepGradient').getString('start')).assertEqual('10.00px');
      expect(obj.getElement('$attrs').getElement('sweepGradient').getString('repeating')).assertEqual('false');
      console.info('[testColorGradient004_static_04] END');
      done();
    });
    /**
     * @tc.number testColorGradient005_static_05
     * @tc.name testColorGradient005_static_05
     * @tc.level 0
     */
    it('testColorGradient005_static_05', 0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      console.info('[testColorGradient005_static_05] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('radialGradient');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testColorGradient005_static_05] component JSON.parse(strJson) is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('radialGradient').getString('radius')).assertEqual('60.00vp');
      expect(obj.getElement('$attrs').getElement('radialGradient').getArray('center')[0]).assertEqual('50.00vp');
      expect(obj.getElement('$attrs').getElement('radialGradient').getArray('center')[1]).assertEqual('50.00vp');
      expect(obj.getElement('$attrs').getElement('radialGradient').getString('repeating')).assertEqual('true');
      console.info('[testColorGradient005_static_05] END');
      done();
    });
    /**
     * @tc.number testColorGradient006_static_06
     * @tc.name testColorGradient006_static_06
     * @tc.level 0
     */
    it('testColorGradient006_static_06', 0, async (done: () => void): Promise<void> => {
      console.info('[testColorGradient006_static_06] START');
      await CommonFunc.sleep(1000);
      let radialGradientValue: RadialGradientValue = {
        center: [60, 60],
        radius: 70,
        colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
        repeating: false
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "radialGradientValue": JSON.stringify(radialGradientValue)
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 7,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testColorGradient006_static_06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testColorGradient006_static_06] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('radialGradient');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testColorGradient006_static_06] component JSON.parse(strJsonNew) is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('radialGradient').getString('radius')).assertEqual('70.00vp');
      expect(obj.getElement('$attrs').getElement('radialGradient').getArray('center')[0]).assertEqual('60.00vp');
      expect(obj.getElement('$attrs').getElement('radialGradient').getArray('center')[1]).assertEqual('60.00vp');
      expect(obj.getElement('$attrs').getElement('radialGradient').getString('repeating')).assertEqual('false');
      console.info('[testColorGradient006_static_06] END');
      done();
    });
  })
}