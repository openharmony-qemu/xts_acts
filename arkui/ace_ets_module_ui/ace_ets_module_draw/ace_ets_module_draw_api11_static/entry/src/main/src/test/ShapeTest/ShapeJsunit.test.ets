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
import { LineCapStyle, LineJoinStyle } from '@ohos.arkui.component'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function shapeJsunit() {
  describe('shapeJsunit', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Shape/shape3',
      }
      try {
        const shape = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        shape.clear();
        let pages = shape.getState();
        console.info("get shape state success " + JSON.stringify(pages));
        if (!("shape3" == pages.name)) {
          console.info("get shape state success " + JSON.stringify(pages.name));
          // let result = await shape.pushUrl(options);
          shape.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info("push shape page success " + JSON.stringify(result));
        }
      } catch (err: BusinessError) {
        console.error("push shape page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("shape after each called");
    });

    it('shapeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeDashOffset')).assertEqual('0.00vp');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineCap')).assertEqual('LineCapStyle.Butt');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin')).assertEqual('LineJoinStyle.Miter');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0400 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')).assertEqual('4.000000');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0500 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0500 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeOpacity')).assertEqual('1.000000');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0600 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0600 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('0.000000');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0700 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0700 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('antiAlias')).assertEqual('true');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0800 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0800 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[0]).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0900 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0900 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[1]).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1000 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "antiAlias": "false",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1000 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1000 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_1000 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('antiAlias')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('antiAlias')).assertEqual('false');
      done();
    });

    it('shapeTest_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1100 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "antiAlias": 'undefined',
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1100 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');
      console.info("shapeTest_1100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('antiAlias')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('antiAlias')).assertEqual('false');
      done();
    });

    it('shapeTest_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1200 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "antiAlias": -0.1,
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1200 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1200 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');
      console.info("shapeTest_1200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('antiAlias')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('antiAlias')).assertEqual('false');
      done();
    });

    it('shapeTest_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineCap": LineCapStyle.Round,
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1300 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_1300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineCap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineCap')).assertEqual('LineCapStyle.Round');
      done();
    });

    it('shapeTest_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1400 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineCap": 'string'
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1400 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1400 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_1400 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineCap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineCap')).assertEqual('LineCapStyle.Butt');
      done();
    });

    it('shapeTest_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1500 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineCap": '-0.2'
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1500 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_1500 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineCap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineCap')).assertEqual('LineCapStyle.Butt');
      done();
    });

    it('shapeTest_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1600 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineJoin": LineJoinStyle.Round,
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1600 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_1600 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineJoin')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin')).assertEqual('LineJoinStyle.Round');
      done();
    });

    it('shapeTest_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1700 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineJoin": 'nothing',
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1700 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_1700 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineJoin')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin')).assertEqual('LineJoinStyle.Miter');
      done();
    });

    it('shapeTest_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1800 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineJoin": 0.11111,
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1800 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_1800 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineJoin')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin')).assertEqual('LineJoinStyle.Miter');
      done();
    });

    it('shapeTest_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2100 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": "-0.11111",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2100 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(parseInt(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit'))).assertEqual(4);
      done();
    });

    it('shapeTest_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_3200 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": 1,
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_3200 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_3200 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_3200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(parseInt(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit'))).assertEqual(1);
      done();
    });

    it('shapeTest_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_3300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": 0.5,
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_3300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_3300 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_3300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(parseInt(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit'))).assertEqual(1);
      done();
    });

    it('shapeTest_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": '11111',
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2200 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2200 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(parseInt(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit'))).assertEqual(11111);
      done();
    });

    it('shapeTest_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1900 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": "5",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_1900 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1900 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_1900 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')).assertEqual('5.000000');
      done();
    });

    it('shapeTest_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2000 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeMiterLimit": "string",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2000 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2000 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2000 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')).assertEqual('4.000000');
      done();
    });


    it('shapeTest_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fillOpacity": "1",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2300 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('fillOpacity')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('1.000000');
      done();
    });

    it('shapeTest_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2400 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fillOpacity": "-1",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2400 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2400 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2400 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('fillOpacity')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('0.000000');
      done();
    });

    it('shapeTest_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2500 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fillOpacity": "aaaaaaa",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2500 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2500 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('fillOpacity')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('nan');
      done();
    });

    it('shapeTest_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2600 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fillOpacity": "aa12345",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2600 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2600 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('fillOpacity')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('nan');
      done();
    });

    it('shapeTest_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2700 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeDashArrayOne": "4",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2700 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2700 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('strokeDashArray')[0]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[0]).assertEqual('4.00vp');
      done();
    });

    it('shapeTest_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2800 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeDashArrayTwo": "4",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2800 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2800 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('strokeDashArray')[1]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[1]).assertEqual('4.00vp');
      done();
    });

    it('shapeTest_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_2900 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeDashArrayThree": "4",
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_2900 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_2900 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_2900 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('strokeDashArray')[1]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[2]).assertEqual('4.00vp');
      done();
    });

    it('shapeTest_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_3000 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_3000 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stroke')).assertEqual('#FF000000');
      await CommonFunc.sleep(1000);
      done();
    });

    it('shapeTest_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_3100 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeLineJoin": LineJoinStyle.Bevel,
          } as Record<String,Object>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 192,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("shapeTest_3100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_3100 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_3100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineJoin')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin')).assertEqual('LineJoinStyle.Bevel');
      done();
    });
  })
}

