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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import { Color } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';



export default function marqueeJsunit() {
  describe('marqueeTest', () => {
    beforeAll(() => {
      console.info("marqueeJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("marqueeTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/marqueeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get marqueeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get marqueeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push marqueeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push marqueeTest page error:" + err);
      }
      console.info("marqueeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("marquee after each called");
    });
    
    it('testMarquee_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_0100 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testMarquee_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['start']).assertEqual(true);
        done()
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 130,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("testMarquee_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("testMarquee_static_0100 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.['fontColor']).assertEqual(Color.Blue);
        done()
      }
      let innerEventOne: events_emitter.InnerEvent = {
        eventId: 127,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventOne, callback1);
      } catch (err: Error) {
        console.info("testMarquee_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_static_0100 END');

    });

    it('testMarquee_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_0200 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testMarquee_static_0200 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['start']).assertEqual(true);
        done()
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 130,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("testMarquee_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("testMarquee_static_0200 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.['fontSize']).assertEqual(50);
        done()
      }
      let innerEventOne: events_emitter.InnerEvent = {
        eventId: 128,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventOne, callback1)
      } catch (err: Error) {
        console.info("testMarquee_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_static_0200 END');
    });

    it('testMarquee_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_0300 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testMarquee_static_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['start']).assertEqual(true);
        done()
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 130,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("testMarquee_static_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_static_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("testMarquee_static_0300 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.['ACTION']).assertEqual(true);
        done()
      }
      let innerEventOne: events_emitter.InnerEvent = {
        eventId: 129,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventOne, callback1)
      } catch (err: Error) {
        console.info("testMarquee_static_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_static_0300 END');
    });
  })
}