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
import { AnimationStatus } from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';

export default function imageAnimatorJsunitt() {
  describe('imageAnimatorJsunitt', () => {
    beforeAll(() => {
      console.info("imageAnimatorJsunitt beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageAnimator beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/imageAnimator2',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get imageAnimator state pages: " + JSON.stringify(pages));
        if (!("imageAnimator2" == pages.name)) {
          console.info("get imageAnimator state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push imageAnimator page success");
        }
      } catch (err) {
        console.error("push imageAnimator page error: " + err);
      }
      // done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("imageAnimator after each called");
    })

    it('imageAnimatorTest_static_0100', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAnimatorTest_static_0100 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0100 get state result is: " + JSON.stringify(indexEvent.data?.['state']));
        expect(indexEvent.data?.['state']).assertEqual(AnimationStatus.Running);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1150,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0100 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button_0', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0100 END');
    });

    it('imageAnimatorTest_static_0200', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAnimatorTest_static_0200 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0200 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['state']).assertEqual(AnimationStatus.Paused);
        expect(indexEvent.data?.['fixedSize']).assertEqual(false);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 116,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0200 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0200 END');
    });

    it('imageAnimatorTest_static_0300', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAnimatorTest_static_0300 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['state']).assertEqual(AnimationStatus.Stopped);
        expect(indexEvent.data?.['preDecode']).assertEqual(0);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 117,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0300 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0300 END');
    });

    it('imageAnimatorTest_static_0400', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAnimatorTest_static_0400 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0400 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['fillMode']).assertEqual(0);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 118,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0400 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button3', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0400 END');
    });

    it('imageAnimatorTest_static_0500', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAnimatorTest_static_0500 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0500 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['iterations']).assertEqual(1);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 119,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0500 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button4', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0500 END');
    });

    it('imageAnimatorTest_static_0600', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAnimatorTest_static_0600 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0600 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['string']).assertEqual('Repeat');
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 114,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0600 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0600 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0600 END');
      done();
    });

    it('imageAnimatorTest_static_0700', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAnimatorTest_static_0700 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "preDecode": 2,
          } as Record<String, Object>
        } as events_emitter.EventData
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 121,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("imageAnimatorTest_static_0700 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("imageAnimatorTest_static_0700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(1500);
      let callbackOne = (indexEventOne: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0700 get state result is: " + JSON.stringify(indexEventOne));
        expect(indexEventOne.data?.['preDecode']).assertEqual(2);
        done();
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 120,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callbackOne);
      } catch (err) {
        console.info("imageAnimatorTest_static_0700 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0700 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button5', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0700 END');
    });
  })
}