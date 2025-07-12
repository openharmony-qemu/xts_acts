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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

class ScaleValue {
  x: number = 0
  y: number = 0
}

class Matrix {
  x: number = 0
}

export default function ohosMatrix4Jsunit() {
  describe('appInfoTest_five_1', () => {
    beforeAll(() => {
      console.info("ohosMatrix4Jsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ohosMatrix4Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/image/ohosMatrix4",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ohosMatrix4Jsunit state pages:" + JSON.stringify(pages));
        if (!("ohosMatrix4" == pages.name)) {
          console.info("get ohosMatrix4Jsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ohosMatrix4Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ohosMatrix4Jsunit page error:" + err);
      }
      console.info("ohosMatrix4Jsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("OhosMatrix4 each called");
    });

    it('test_OhosMatrix4_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rotate7');
      console.info("[test_OhosMatrix4_001] component strJson:" + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Image');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('type'))
        .assertEqual('matrix')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('matrix'))
        .assertEqual('assertNotNull');
      done();
    });

    it('test_OhosMatrix4_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_002] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rotate8');
      console.info("[test_OhosMatrix4_001] component strJson:" + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Image');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('type'))
        .assertEqual('matrix')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('matrix'))
        .assertEqual('5.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,-200.000000,0.000000,0.000000,1.000000,')
      done();
    });

    it('test_OhosMatrix4_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_003] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rotate9');
      console.info("[test_OhosMatrix4_003] component strJson:" + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Image');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('type'))
        .assertEqual('matrix')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('matrix'))
        .assertEqual('1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,100.000000,200.000000,30.000000,1.000000,')
      done();
    });

    it('test_OhosMatrix4_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_004] START');
      await CommonFunc.sleep(1000);
      let scaleValue: ScaleValue = {
        x: 1, y: 1
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scaleValue": JSON.stringify(scaleValue)
          } as Record<String, Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 140,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_OhosMatrix4_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[test_OhosMatrix4_004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('rotate3');
      console.info("[test_OhosMatrix4_004] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('scale').getString('x'))
        .assertEqual('1.000000');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('scale').getString('y'))
        .assertEqual('1.000000');
      done();
    });

    it('test_OhosMatrix4_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[test_OhosMatrix4_005] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.['matrix1']).assertEqual("[100, 10]")
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 141,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[test_OhosMatrix4_005] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_OhosMatrix4_005] sendEventByKey ' +
      JSON.stringify(inspector.sendEventByKey('rotate5', 10, "")));
      await CommonFunc.sleep(1000)
      console.info('[test_OhosMatrix4_005] testSendTouchEvent END');
      done();
    });

    it('test_OhosMatrix4_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_006] START');
      await CommonFunc.sleep(1000);
      let matrix2: Matrix = {
        x: 400
      }
      let matrix3: Matrix = {
        x: 2
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "matrix2": JSON.stringify(matrix2),
            "matrix3": JSON.stringify(matrix3)
          } as Record<String, Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 140,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_OhosMatrix4_006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[test_OhosMatrix4_006] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('rotate6');
      console.info("[test_OhosMatrix4_006] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info("[test_OhosMatrix4_006] component transform is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('transform')));
      expect(JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('transform')))
        .assertEqual('{"type":"matrix","matrix":"3.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,900.000000,0.000000,0.000000,1.000000,"}');
      done();
    });
  })
}




