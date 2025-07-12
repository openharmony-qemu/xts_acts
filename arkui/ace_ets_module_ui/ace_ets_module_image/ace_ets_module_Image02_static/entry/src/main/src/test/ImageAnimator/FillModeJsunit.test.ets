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
import { FillMode } from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
import inspector from '@ohos.arkui.inspector'

export default function fillModeJsunit() {
  describe('fillModeTest', () => {
    beforeAll(() => {
      console.info("fillModeJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('fillModeTest beforeEach called');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/fillMode',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info('beforeEach get fillMode state pages:' + JSON.stringify(pages));
        if (!('fillMode' == pages.name)) {
          console.info('beforeEach get fillMode state pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('beforeEach push fillMode page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('beforeEach push fillMode page error:' + err);
      }
      // done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('fillMode test after each called');
    });

    it('fillModeTest_static_0100', Level.LEVEL1, async (done: () => void) => {
      console.info('fillModeTest_static_0100 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['fillMode']).assertEqual(FillMode.Backwards);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 94,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("fillModeTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_static_0100 END');
      done();
    });

    it('fillModeTest_static_0200', Level.LEVEL1, async (done: () => void) => {
      console.info('fillModeTest_static_0200 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_static_0200 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['fillMode']).assertEqual(FillMode.Both);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 95,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("fillModeTest_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_static_0200 END');
      done();
    });

    it('fillModeTest_static_0300', Level.LEVEL1, async (done: () => void) => {
      console.info('fillModeTest_static_0300 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_static_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['fillMode']).assertEqual(FillMode.None);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 96,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("fillModeTest_static_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_static_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_static_0300 END');
      done();
    });
  })
}