
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ellipseJsunit() {
  describe('ellipseTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    
    beforeEach(async (): Promise<void> => {
      console.info("ellipse beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Ellipse/ellipse',
      }
      try {
        const ellipse = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        ellipse.clear();
        let pages: router.RouterState = ellipse.getState();
        console.info("get ellipse state pages:" + JSON.stringify(pages));
        if (!("ellipse" == pages.name)) {
          console.info("get ellipse state pages.name:" + JSON.stringify(pages.name));
          // let result = await ellipse.pushUrl(options);
          ellipse.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ellipse page result:" + JSON.stringify(result));
        }
      } catch (err: BusinessError) {
        console.error("push ellipse page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ellipse after each called");
    });

    it('testEllipse01_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse02] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('200.00px');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('200.00px');
      console.info('testEllipse02 END');
      done()
    });

    it('testEllipse02_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '100px'
          } as Record<string,object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 92,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[testEllipse02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testEllipse02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse02] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('100.00px');
      console.info('testEllipse02 END');
      done()
    });

    it('testEllipse03_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "height": '500px'
          } as Record<string,object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 92,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[testEllipse03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testEllipse03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse03] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('500.00px');
      console.info('testEllipse03 END');
      done()
    });

    it('testEllipse04_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '1111111111111.00px'
          } as Record<string,object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 907,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[testEllipse04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testEllipse04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse04] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('1111111111111.00px');
      console.info('testEllipse04 END');
      done()
    });

    it('testEllipse05_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "height": '12111111111111.00px'
          } as Record<string,object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 907,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[testEllipse05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testEllipse05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse05] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('12111111111111.00px');
      console.info('testEllipse05 END');
      done()
    });

    it('testEllipse06_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse06] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "height": '-40.00px'
          } as Record<string,object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 908,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[testEllipse06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testEllipse06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse06] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('0.00px');
      console.info('testEllipse06 END');
      done()
    });

    it('testEllipse07_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse07] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '-10.00px'
          } as Record<string,object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 908,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[testEllipse07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("[testEllipse07] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testEllipse07] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('0.00px');
      console.info('testEllipse07 END');
      done()
    });
  })
}
