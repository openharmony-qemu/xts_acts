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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function overLayJsunit() {
  describe('overLayJsunit', () => {
    beforeAll(() => {
      console.info("overLayJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("overLayJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/overlay/overlayUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get overLayJsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get overLayJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push overLayJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push overLayJsunit page error:" + err);
      }
      console.info("overLayJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    it('overLayJsunit_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0100] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getString('title')).assertEqual("old title");
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.Bottom");
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('y')).assertEqual('-15.00vp');
      console.info('[overLayJsunit_0100] END');
      done();
    });

    it('overLayJsunit_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0200] START');
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
        console.info("[overLayJsunit_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0200] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getString('title')).assertEqual("new title");
      console.info('overLayJsunit_0200 END');
      done();
    });

    it('overLayJsunit_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0300] START');
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
        console.info("[overLayJsunit_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0300] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('30.00vp');
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('y')).assertEqual('-30.00vp');
      console.info('overLayJsunit_0300 END');
      done();
    });

    it('overLayJsunit_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0400] START');
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
        console.info("[overLayJsunit_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0400] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_0400 END');
      done();
    });

    it('overLayJsunit_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align":'-1'
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0500] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.Center");
      console.info('overLayJsunit_0500 END');
      done();
    });

    it('overLayJsunit_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0600] START');
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
        console.info("[overLayJsunit_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0600] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('-30.00vp');
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('y')).assertEqual('30.00vp');
      console.info('overLayJsunit_0600 END');
      done();
    });

    it('overLayJsunit_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0700] START');
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
        console.info("[overLayJsunit_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0700] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('1111111111.00vp');
      console.info('overLayJsunit_0700 END');
      done();
    });

    it('overLayJsunit_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0800] START');
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
        console.info("[overLayJsunit_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0800] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getElement('offset').getString('x')).assertEqual('1111111111.00vp');
      console.info('overLayJsunit_0800 END');
      done();
    });

    it('overLayJsunit_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0900] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.Top"
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1110,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0900] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_0900 END');
      done();
    });

    it('overLayJsunit_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1000] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.TopEnd"
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1000] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1000 END');
      done();
    });

    it('overLayJsunit_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1100] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.Start"
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1100] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1100 END');
      done();
    });

    it('overLayJsunit_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1200] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.End"
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1200] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1200 END');
      done();
    });

    it('overLayJsunit_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1300] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.BottomEnd"
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1300] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1300 END');
      done();
    });

    it('overLayJsunit_static_1400', 0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1400] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "align": "Alignment.BottomStart"
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 143,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[overLayJsunit_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1400] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align')).assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1400 END');
      done();
    });

  })
}
