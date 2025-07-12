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

export default function shapeClippingJsunit() {
  describe('borderTest_five_4', () => {
    beforeAll(() => {
      console.info("shapeClippingJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("shapeClippingJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/image/shapeClipping",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get shapeClippingJsunit state pages:" + JSON.stringify(pages));
        if (!("shapeClipping" == pages.name)) {
          console.info("get shapeClippingJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push shapeClippingJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shapeClippingJsunit page error:" + err);
      }
      console.info("shapeClippingJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("shapeClipping after each called");
    });

    it('testShapeClipping_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testShapeClipping001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('image_clip');
      console.info("[testShapeClipping001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('clip'))
        .getString('shape')).assertEqual('Circle');
      let strJson1: string = inspector.getInspectorByKey('image_clip_true');
      console.info("[testShapeClipping001] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('clip')).assertEqual('true');
      console.info('[testShapeClipping001] END');
      done();
    });

    it('testShapeClipping_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testShapeClipping002] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('image_mask');
      console.info("[testShapeClipping002] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[testShapeClipping002] component mask obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mask')));
      expect(JSON.parseJsonElement(JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('mask'))).getString('shape')).assertEqual('Rect');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('clip')).assertEqual('false');
      console.info('[testShapeClipping002] END');
      done();
    });

    it('testShapeClipping_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testShapeClipping003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maskValue": false
          } as Record<String, Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 32,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testShapeClipping003] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('image_mask');
      console.info("[testShapeClipping003] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info("[testShapeClipping003] component mask obj is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('mask')));
      expect(JSON.parseJsonElement(JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('mask'))).getString('shape')).assertEqual('Circle');
      console.info('[testShapeClipping003] END');
      done();
    });

    it('testShapeClipping_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testShapeClipping004] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clipValue": false
          } as Record<String, Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 33,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testShapeClipping004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('image_clip');
      console.info("[testShapeClipping004] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('clip'))
        .getString('shape')).assertEqual('Rect');
      console.info('[testShapeClipping004] END');
      done();
    });
  })
}