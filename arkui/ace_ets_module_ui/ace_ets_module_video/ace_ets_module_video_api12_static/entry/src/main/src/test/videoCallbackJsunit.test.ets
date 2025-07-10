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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function videoCallbackJsunit() {
  describe('videoCallbackJsunit', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("videoCallbackJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/videoCallback',
      }
      try {
        const videoCallback = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        videoCallback.clear();
        let pages = videoCallback.getState();
        console.info("get videoCallbackJsunit state pages: " + JSON.stringify(pages));
        if (!("VideoCallback" == pages.name)) {
          console.info("get VideoCallbackJsunit state pages.name: " + JSON.stringify(pages.name));
          // let result = await videoCallback.pushUrl(options);
          videoCallback.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push VideoCallbackJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoCallbackJsunit page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_ACE_ARKUI_VIDEO_OnStop_CALLBACK_0500
     * @tc.name      : VideoOnStopCallback_0500
     * @tc.desc      : Video onStop Callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : level 0
     */
    it('videoCallbackJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.['action']).assertEqual('onStart');
        console.info('videoCallbackJsunit_static_0500 event: ' + event.data?.['action']);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 50101,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let button = await driver.findComponent(ON.id('start'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(5000);

      let callback2 = (event: events_emitter.EventData) => {
        expect(event.data?.['action']).assertEqual('onStop');
        console.info('videoCallbackJsunit_static_0500 event: ' + event.data?.['action']);
      }
      let event2: events_emitter.InnerEvent = {
        eventId: 50102,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event2, callback2);
      let button2 = await driver.findComponent(ON.id('stop'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number    : SUB_ACE_ARKUI_VIDEO_OnStop_CALLBACK_0501
     * @tc.name      : VideoOnStopCallback_0501
     * @tc.desc      : Video onStop Callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : level 0
     */
    it('videoCallbackJsunit_static_0501', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.['action']).assertEqual('onStart');
        console.info('videoCallbackJsunit_static_0501 event: ' + event.data?.['action']);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 50101,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let button = await driver.findComponent(ON.id('start'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(5000);

      let button3 = await driver.findComponent(ON.id('pause'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(5000);

      let callback2 = (event: events_emitter.EventData) => {
        expect(event.data?.['action']).assertEqual('onStop');
        console.info('videoCallbackJsunit_static_0501 event: ' + event.data?.['action']);
      }
      let event2: events_emitter.InnerEvent = {
        eventId: 50102,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event2, callback2);
      let button2 = await driver.findComponent(ON.id('stop'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      await driver.pressBack();
      done();
    });
  })
}