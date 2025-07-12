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
import events_emitter from '@ohos.events.emitter'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { MessageManager, Message } from '../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import curves from '@ohos.curves';
import {PlayMode} from '@ohos.arkui.component'
import { FinishCallbackType } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../test/Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface DataI {
  duration: number
  curve: string
  iterations: number
  tempo: number
  playmode: string
  iteration: number
  finishCallbackType: FinishCallbackType
}
class Msg {
  name: string = ''
  value: number
  constructor(name: string,value: number){
    this.name = name
    this.value = value
  }
}
interface ParamName {
  name: string, message: MessageManager<number>
}
interface ParamName1 {
  name: string, message: MessageManager<string>
}
interface ParamName2 {
  name: string, message: MessageManager<PlayMode>
}
const waitUiReadyMs = 1000;

export default function animateToTest() {
  describe('animateToTest', () => {

    beforeAll(() => {
      console.info("playModeReverseTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.animation.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("playModeReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/animateto",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get playModeReverseTest state pages:" + JSON.stringify(pages));
        if (!("animateto" == pages.name)) {
          console.info("get playModeReverseTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push playModeReverseTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push playModeReverseTest page error:" + err);
      }
      console.info("playModeReverseTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      console.info("animate after each called");
    });
    it('animateTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_0100 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 51,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0100 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.duration == 100).assertTrue();
        } catch (err) {
          console.info("animateTest_static_0100 get state result is err: " + JSON.stringify(err));
        }
        console.info('animateTest_static_0100 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
    });

    it('animateTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_0200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 52,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0200 get state result is: " + JSON.stringify(indexEvent))
        let eventData: DataI = indexEvent.data as DataI
        expect(eventData?.curve).assertEqual('Ease')
        console.info('animateTest_static_0200 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
    });
    it('animateTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_0300 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 53,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0300 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.iterations == 1).assertTrue();
        } catch (err) {
          console.info("animateTest_static_0300 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_0300 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('button3', 10, "")));
    });
    it('animateTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_0400 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 54,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0400 get state result is: " + JSON.stringify(indexEvent))
        let eventData: DataI = indexEvent.data as DataI
        expect(eventData?.tempo).assertEqual(1000)
        console.info('animateTest_static_0400 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0400 click result is: " + JSON.stringify(inspector.sendEventByKey('button4', 10, "")));
    });
    it('animateTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_0500 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 55,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0500 get state result is: " + JSON.stringify(indexEvent))
        let eventData: DataI = indexEvent.data as DataI
        expect(eventData?.playmode).assertEqual('normal')
        console.info('animateTest_static_0500 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0500 click result is: " + JSON.stringify(inspector.sendEventByKey('button5', 10, "")));
    });
    it('animateTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(10);
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'duration', value: 2000
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 151,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0600 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.duration == 2000).assertTrue();
        } catch (err) {
          console.info("animateTest_static_0600 get state result err is: " + JSON.stringify(err));
        }
        console.info('animateTest_static_0600 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0600 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0600 click result is: " + JSON.stringify(inspector.sendEventByKey('button11', 10, "")));
    });
    it('animateTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_0700 START');
      const animate = AppStorage.get<ParamName1>("value", Type.from<ParamName1>())
      let msg: Message<string> = {
        name: 'curve', value: 'Linear'
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 152,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0700 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.curve).assertEqual('Linear');
        } catch (err) {
          console.info("animateTest_static_0700 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_0700 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0700 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0700 click result is: " + JSON.stringify(inspector.sendEventByKey('button12', 10, "")));
    });
    it('animateTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_0800 START');
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'iteration', value: 2
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 153,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0800 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.iterations).assertEqual(2)
        } catch (err) {
          console.info("animateTest_static_0800 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_0800 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0800 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0800 click result is: " + JSON.stringify(inspector.sendEventByKey('button13', 10, "")));
    });
    it('animateTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_0900 START');
      const animate = AppStorage.get<ParamName1>("value", Type.from<ParamName1>())
      let msg: Message<string> = {
        name: 'tempo', value: "20000"
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 154,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_0900 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.tempo).assertEqual('20000');
        } catch (err) {
          console.info("animateTest_static_0900 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_0900 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_0900 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_0900 click result is: " + JSON.stringify(inspector.sendEventByKey('button14', 10, "")));
    });
    it('animateTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1000 START');
      const animate = AppStorage.get<ParamName2>("value", Type.from<ParamName2>())
      let msg: Message<PlayMode> = {
        name: 'playmode', value: PlayMode.Alternate
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 155,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1000 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.playmode).assertEqual('alternate');
        } catch (err) {
          console.info("animateTest_static_1000 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1000 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1000 click result is: " + JSON.stringify(inspector.sendEventByKey('button15', 10, "")));
    });
    it('animateTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1100 START');
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'duration', value: -1000
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1001,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1100 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.duration).assertEqual(-1000);
        } catch (err) {
          console.info("animateTest_static_1100 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1100 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1100 click result is: " + JSON.stringify(inspector.sendEventByKey('button6', 10, "")));
    });
    it('animateTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1200 START');
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'duration', value: 100000000
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1002,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1200 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.duration).assertEqual(100000000);
        } catch (err) {
          console.info("animateTest_static_1200 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1200 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1200 click result is: " + JSON.stringify(inspector.sendEventByKey('button7', 10, "")));
    });
    it('animateTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1300 START');
      const animate = AppStorage.get<ParamName1>("value", Type.from<ParamName1>())
      let msg: Message<string> = {
        name: 'curve', value: '123'
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1003,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1300 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.curve).assertEqual('123');
        } catch (err) {
          console.info("animateTest_static_1300 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1300 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1300 click result is: " + JSON.stringify(inspector.sendEventByKey('button8', 10, "")));
    });
    it('animateTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1400 START');
      const animate = AppStorage.get<ParamName1>("value", Type.from<ParamName1>())
      let msg: Message<string> = {
        name: 'curve', value: 'abc'
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1004,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1400 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.curve).assertEqual('abc')
        } catch (err) {
          console.info("animateTest_static_1400 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1400 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1400 click result is: " + JSON.stringify(inspector.sendEventByKey('button9', 10, "")));
    });
    it('animateTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1500 START');
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'iteration', value: 121
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1005,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1500 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.iteration).assertEqual(121);
        } catch (err) {
          console.info("animateTest_static_1500 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1500 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1500 click result is: " + JSON.stringify(inspector.sendEventByKey('button10', 10, "")));
    });
    it('animateTest_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1600 START');
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'iteration', value: -5
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1006,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1600 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.iteration).assertEqual(-5);
        } catch (err) {
          console.info("animateTest_static_1600 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1600 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1600 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1600 click result is: " + JSON.stringify(inspector.sendEventByKey('button111', 10, "")));
    });
    it('animateTest_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1700 START');
      const animate = AppStorage.get<ParamName1>("value", Type.from<ParamName1>())
      let msg: Message<string> = {
        name: 'tempo', value: "12121212121212"
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1007,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1700 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.tempo).assertEqual('12121212121212');
        } catch (err) {
          console.info("animateTest_static_1700 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1700 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1700 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1700 click result is: " + JSON.stringify(inspector.sendEventByKey('button121', 10, "")));
    });
    it('animateTest_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1800 START');
      const animate = AppStorage.get<ParamName1>("value", Type.from<ParamName1>())
      let msg: Message<string> = {
        name: 'tempo', value: "-5"
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1008,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1800 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.tempo).assertEqual('-5')
        } catch (err) {
          console.info("animateTest_static_1800 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1800 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1800 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1800 click result is: " + JSON.stringify(inspector.sendEventByKey('button131', 10, "")));
    });
    it('animateTest_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_1900 START');
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'playmode', value: -6
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1009,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_1900 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.playmode).assertEqual(-6);
        } catch (err) {
          console.info("animateTest_static_1900 get state result err is: " + JSON.stringify(err))
        }
        console.info('animateTest_static_1900 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_1900 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_1900 click result is: " + JSON.stringify(inspector.sendEventByKey('button141', 10, "")));
    });
    it('animateTest_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_2000 START');
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'playmode', value: 123456
      }
      animate?.message.notify(msg);
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1010,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_2000 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.playmode).assertEqual(123456);
        } catch (err) {
          console.info("animateTest_static_2000 get state result err is: " + JSON.stringify(err));
        }
        console.info('animateTest_static_2000 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_2000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_2000 click result is: " + JSON.stringify(inspector.sendEventByKey('button151', 10, "")));
    });
    /* *
      * @tc.number: SUB_ACE_FUNCTION_SR000S6E08_001
      * @tc.name  : animateTest_static_2100
      * @tc.desc  : finishCallbackType Property not set
      * @tc.level : Level 3
    */
    it('animateTest_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_2100 START');
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1011,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_2100 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.finishCallbackType).assertEqual(FinishCallbackType.REMOVED);
        } catch (err) {
          console.info("animateTest_static_2100 get state result err is: " + JSON.stringify(err));
        }
        console.info('animateTest_static_2100 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_2100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_2100 click result is: " + JSON.stringify(inspector.sendEventByKey('button161', 10, "")));
    });
    /* *
      * @tc.number: SUB_ACE_FUNCTION_SR000S6E08_002
      * @tc.name  : animateTest_static_2200
      * @tc.desc  : finishCallbackType Property set FinishCallbackType.REMOVED
      * @tc.level : Level 3
    */
    it('animateTest_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_2200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1012,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_2200 get state result is: " + JSON.stringify(indexEvent))
        let eventData: DataI = indexEvent.data as DataI
        expect(eventData?.finishCallbackType).assertEqual(FinishCallbackType.REMOVED)
        console.info('animateTest_static_2200 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_2200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_2200 click result is: " + JSON.stringify(inspector.sendEventByKey('button171', 10, "")));
    });
    /* *
      * @tc.number: SUB_ACE_FUNCTION_SR000S6E08_003
      * @tc.name  : animateTest_static_2300
      * @tc.desc  : finishCallbackType Property set FinishCallbackType.LOGICALLY
      * @tc.level : Level 3
    */
    it('animateTest_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_static_2300 START');
      const animate = AppStorage.get<ParamName>("value", Type.from<ParamName>())
      let msg: Message<number> = {
        name: 'finishCallbackType', value: 1
      }
      animate?.message.notify(msg);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1013,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_static_2300 get state result is: " + JSON.stringify(indexEvent))
        try {
          let eventData: DataI = indexEvent.data as DataI
          expect(eventData?.finishCallbackType).assertEqual(FinishCallbackType.LOGICALLY);
        } catch (err) {
          console.info("animateTest_static_2300 get state result err is: " + JSON.stringify(err));
        }
        console.info('animateTest_static_2300 END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_static_2300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_static_2300 click result is: " + JSON.stringify(inspector.sendEventByKey('button181', 10, "")));
    });
  })
}