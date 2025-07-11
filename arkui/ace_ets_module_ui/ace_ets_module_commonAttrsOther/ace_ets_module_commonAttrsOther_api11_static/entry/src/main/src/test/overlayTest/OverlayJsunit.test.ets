
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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, Point,Rect, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import  display   from '@ohos.display'
import {
  $r
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

const uiContext = new UIContext();


export default function overLayJsunit() {
  describe('overLayTest', () => {
    beforeAll(() => {
      console.info("overLayJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("overLayTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/overlay/overlay',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get overLayTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get overLayTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push overLayTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push overLayTest page error:" + err);
      }
      console.info("overLayTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    it('testOverlay_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('overlay');

      console.info("[testOverlay01] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('overlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getString('title')).assertEqual("old title");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.Bottom");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('0.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('y')).assertEqual('-15.00vp');
      console.info('[testOverlay01] END');
      done()
    });

    it('testOverlay_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "title": "new title"
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testOverlay02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('overlay');

      console.info("[testOverlay02] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getString('title')).assertEqual("new title");
      console.info('testOverlay02 END');
      done()
    });

    it('testOverlay_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.TopStart",
            "x": 30,
            "y": -30
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testOverlay03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('overlay');

      console.info("[testOverlay03] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('30.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('y')).assertEqual('-30.00vp');
      console.info('testOverlay03 END');
      done()
    });

    it('testOverlay_static_04', 0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay04] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.Center"
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testOverlay04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('overlay');

      console.info("[testOverlay04] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      console.info('testOverlay04 END');
      done()
    });

    it('testOverlay_static_05', 0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": '-1'
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testOverlay05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('overlay');

      console.info("[testOverlay05] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.Center");
      console.info('testOverlay05 END');
      done()
    });

    it('testOverlay_static_06', 0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay06] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "x": -30,
            "y": 30
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testOverlay06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('overlay');

      console.info("[testOverlay06] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('-30.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('y')).assertEqual('30.00vp');
      console.info('testOverlay06 END');
      done()
    });

    it('testOverlay_static_07', 0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay07] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "x": 1111111111
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testOverlay07] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('overlay');

      console.info("[testOverlay07] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('1111111111.00vp');
      console.info('testOverlay07 END');
      done()
    });

    it('testOverlay_static_08', 0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay08] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "y": 1111111111
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testOverlay08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('overlay');
      console.info("[testOverlay08] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('1111111111.00vp');
      console.info('testOverlay08 END');
      done()
    });
  })
}
