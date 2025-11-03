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


import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Point
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function button3Jsunit() {
  describe('button3Jsunit', () => {
    beforeAll(async () => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("button beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/button3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get button state pages:" + JSON.stringify(pages));
        if (!("button3" == pages.name)) {
          console.info("get button pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }

      } catch (err:Error) {
        console.error("push button page error: " + err);
      }

    });

    beforeEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("button before each called");
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("button after each called");
    })
    
/*
     * @tc.number   testButton_static_01
     * @tc.name     testButton_static_01
     * @tc.desc     testButton_static_01
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_01', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('button');
      console.info("[testButton_static_01] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement("$type").asString()).assertEqual('Button');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("type")).assertEqual('ButtonType.Normal');
      done();
    });
    
    
/*
     * @tc.number   testButton_static_02
     * @tc.name     testButton_static_02
     * @tc.desc     testButton_static_02
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_02', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_02] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('button1');
      console.info("[testButton_static_02] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement("$type").asString()).assertEqual('Button');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("type")).assertEqual('ButtonType.Normal');
      done();
    });
    
    
/*
     * @tc.number   testButton_static_03
     * @tc.name     testButton_static_03
     * @tc.desc     testButton_static_03
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_03', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_03] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('button2');
      console.info("[testButton_static_03] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("fontSize")).assertEqual('20.00px');
      done();
    });
    
    
/*
     * @tc.number   testButton_static_04
     * @tc.name     testButton_static_04
     * @tc.desc     testButton_static_04
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_04', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_04] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('button3');
      console.info("[testButton_static_04] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("borderColor")).assertEqual('#FF000000');
      done();
    });

    
/*
     * @tc.number   testButton_static_05
     * @tc.name     testButton_static_05
     * @tc.desc     testButton_static_05
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_05', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_05] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "buttonTypeValue": "ButtonType.Capsule",
          } as Record<string, undefined|null|Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton_static_05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testButton_static_05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButton_static_05] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("type")).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      done();
    });

    
/*
     * @tc.number   testButton_static_06
     * @tc.name     testButton_static_06
     * @tc.desc     testButton_static_06
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_06', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_06] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": '30px',
          } as Record<string, undefined|null|Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton_static_06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testButton_static_06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('button2');

      console.info("[testButton_static_05] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("fontSize")).assertEqual('30.00px');
      done();
    });
    
/*
     * @tc.number   testButton_static_07
     * @tc.name     testButton_static_07
     * @tc.desc     testButton_static_07
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_07', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_07] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": -1,
          } as Record<string, undefined|null|Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton_static_07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testButton_static_07] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('button2');
    
      //let resourceSize = this.getUIContext().getHostContext().resourceManager.getNumber($r('sys.float.ohos_id_text_size_body1').id)
      //console.info("[TextInputPageJsunit_0200] size: " + px2fp(resourceSize));
      console.info("[testButton_static_07] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      //expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("fontSize")).assertEqual('' + px2fp(resourceSize) + '.00fp');
      done();
    });

    
/*
     * @tc.number   testButton_static_08
     * @tc.name     testButton_static_08
     * @tc.desc     testButton_static_08
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_08', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_08] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "121212121px",
          } as Record<string, undefined|null|Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton_static_08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testButton_static_08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('button2');

      console.info("[testButton_static_08] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("fontSize")).assertEqual('121212121.00px');
      done();
    });

    
/*
     * @tc.number   testButton_static_09
     * @tc.name     testButton_static_09
     * @tc.desc     testButton_static_09
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_09', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_09] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "121212121px",
          } as Record<string, undefined|null|Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton_static_09] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testButton_static_09] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('button2');

      console.info("[testButton_static_09] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("fontSize")).assertEqual('121212121.00px');
      done();
    });
    
/*
     * @tc.number   testButton_static_10
     * @tc.name     testButton_static_10
     * @tc.desc     testButton_static_10
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_10', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_10] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColorValue": Color.Pink
          } as Record<string, undefined|null|Object>
        }
        let indexEventOne: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton_static_10 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err:Error) {
        console.log("testButton_static_10 change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 72,
        priority: events_emitter.EventPriority.LOW
      }
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("testButton_static_10 get state result is: " + JSON.stringify(indexEvent))
        expect((indexEvent.data as ESObject)?.getProperty('fontColorValue').toStaticObject()).assertEqual(Color.Pink)
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err:Error) {
        console.info("testButton_static_10 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton_static_10 click result is: " + JSON.stringify(inspector.sendEventByKey('button3', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('[testButton_static_10] END');
      done();
    });
    
    
/*
     * @tc.number   testButton_static_11
     * @tc.name     testButton_static_11
     * @tc.desc     testButton_static_11
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_11', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_11] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColorValue": 332
          } as Record<string, undefined|null|Object>
        }
        let indexEventOne: events_emitter.InnerEvent = {
          eventId: 70,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton_static_11 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err:Error) {
        console.log("testButton_static_11 change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 71,
        priority: events_emitter.EventPriority.LOW
      }
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("testButton_static_11 get state result is: " + JSON.stringify(indexEvent))
        expect((indexEvent.data as ESObject)?.getProperty('fontColorValue').toNumber()).assertEqual(332)
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err:Error) {
        console.info("testButton_static_11 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton_static_11 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('[testButton_static_11] END');
      done();
    });
    
    
/*
     * @tc.number   testButton_static_12
     * @tc.name     testButton_static_12
     * @tc.desc     testButton_static_12
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_12', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
    
      await CommonFunc.sleep(500);
      let buttonCl = await driver.findComponent(ON.id('buttonClick'));
      await CommonFunc.sleep(500);
      let point = await (buttonCl?.getBoundsCenter() as Promise<Point>);
    
      let density = await driver.getDisplayDensity();
      console.info("[testButton_static_12] getDisplayDensity is: " + JSON.stringify(density));
      await CommonFunc.sleep(500);
      let callback:(eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("[testButton_static_12] get event state result is: " + JSON.stringify(eventData));
        expect((eventData.data as ESObject)?.getProperty('ACTION').toBoolean()).assertEqual(true)
        console.info("[testButton_static_12] get event state result is: " + Math.trunc(JSON.parseJsonElement((eventData.data as ESObject).getProperty('event').toString()).getInteger('screenY')));
        console.info("[testButton_static_12] get event state result is: " + Math.trunc(JSON.parseJsonElement((eventData.data as ESObject).getProperty('event').toString()).getInteger('screenX')));
        console.info("[testButton_static_12] get event state result is: " + Math.trunc(JSON.parseJsonElement((eventData.data as ESObject).getProperty('event').toString()).getInteger('x')));
        console.info("[testButton_static_12] get event state result is: " + Math.trunc(JSON.parseJsonElement((eventData.data as ESObject).getProperty('event').toString()).getInteger('y')));
    
        let ScreenX: number = Number(JSON.parseJsonElement((eventData.data as ESObject).getProperty('event').toString()).getInteger('screenX'))
        let ScreenY: number = Number(JSON.parseJsonElement((eventData.data as ESObject).getProperty('event').toString()).getInteger('screenY'))
        try {
          expect(Math.abs(UIContext.getFocusedUIContext()!.vp2px(ScreenX) - point.x + Number(AppStorage.get<number>("winLeft"))) <= 1).assertTrue()
          expect(Math.abs(UIContext.getFocusedUIContext()!.vp2px(ScreenY) - point.y + Number(AppStorage.get<number>("winTop"))) <= 1).assertTrue()
          expect(Math.trunc(JSON.parseJsonElement((eventData.data as ESObject).getProperty('event').toString()).getInteger('x'))).assertEqual(100)
          expect(Math.trunc(JSON.parseJsonElement((eventData.data as ESObject).getProperty('event').toString()).getInteger('y'))).assertEqual(50)
        } catch (err:Error) {
          console.info("[testButton_static_12_] expection err : " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 4,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err:Error) {
        console.info("[testButton_static_12] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testButton_static_12] sendEventByKey ' + JSON.stringify(inspector.sendEventByKey('buttonClick', 10, "")));
      await CommonFunc.sleep(1000)
      console.info('[testButton_static_12] testSendTouchEvent END');
      done();
    });

    
/*
     * @tc.number   testButton_static_13
     * @tc.name     testButton_static_13
     * @tc.desc     testButton_static_13
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_13', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_13] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "buttonTypeValue": "qaq",
          } as Record<string, undefined|null|Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 74,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton_static_13] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testButton_static_13] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButton_static_13] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString("type")));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("type")).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      done();
    });

    
/*
     * @tc.number   testButton_static_14
     * @tc.name     testButton_static_14
     * @tc.desc     testButton_static_14
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_14', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_14] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "buttonTypeValue": 41961,
          } as Record<string, undefined|null|Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 75,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton_static_14] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testButton_static_14] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('button');

      console.info("[testButton_static_14] component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString("type")));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("type")).assertEqual('');
      done();
    });

    
/*
     * @tc.number   testButton_static_15
     * @tc.name     testButton_static_15
     * @tc.desc     testButton_static_15
     * @tc.level    Level.LEVEL1
     */
it('testButton_static_15', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testButton_static_15] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColorValue": "ab996"
          }as Record<string, undefined|null|Object>
        }
        let indexEventOne: events_emitter.InnerEvent = {
          eventId: 76,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testButton_static_15 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err:Error) {
        console.log("testButton_static_15 change component data error: " + err.message);
      }
      await CommonFunc.sleep(500);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 77996,
        priority: events_emitter.EventPriority.LOW
      }
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("testButton_static_15 get state result is: " + JSON.stringify(indexEvent))
        console.info("testButton_static_15 (indexEvent.data as ESObject)?.getProperty('fontColorValue').toNumber() is: " + (indexEvent.data as ESObject)?.getProperty('fontColorValue').toNumber())
        expect((indexEvent.data as ESObject)?.getProperty('fontColorValue').toString()).assertEqual("ab996")
        console.info('[testButton_static_15] END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err:Error) {
        console.info("testButton_static_15 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testButton_static_15 click result is: " + JSON.stringify(inspector.sendEventByKey('button4', 10, "")));
      done();
    });
  })
}