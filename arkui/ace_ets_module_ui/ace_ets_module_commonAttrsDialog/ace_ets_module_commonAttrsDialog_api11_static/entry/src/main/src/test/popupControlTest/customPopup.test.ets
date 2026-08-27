'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import { RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';
import events_emitter from '@ohos.events.emitter';

export default function customPopup() {
  describe('customPopup', () => {
    beforeEach(async (): Promise<void> => {
      console.info("customPopup beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/customPopup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get customPopup state pages:" + JSON.stringify(pages));
        if (!("customPopup" == pages.name)) {
          console.info("get customPopup pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info("push customPopup page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customPopup page error:" + err);
      }
      console.info("customPopup beforeEach end");
    });


    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('customPopup after each sleep err: ' + JSON.stringify(err));
      }
      console.info("customPopup after each called");
    });
    
    
    /**
     * @tc.number   customPopup_static_0100
     * @tc.name     customPopup_static_0100
     * @tc.desc     customPopup_static_0100
     * @tc.level    Level.LEVEL0
     */
it('customPopup_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('customPopup_0100 START');
      try {
        await Utils.sleep(1500);
      } catch (err) {
        console.info('customPopup_0100 sleep err: ' + JSON.stringify(err));
      }
      let callback = (indexEvent:events_emitter.EventData) => {
        console.info("customPopup_0100 get state result is: " + JSON.stringify(indexEvent));
        const data = indexEvent.data as Record<String,RecordData>
        const event = data['arrowPointPosition'] as Record<String,RecordData>
        expect(event).assertEqual('Start');
        done();
      }
      let indexEvent:events_emitter.InnerEvent = {
        eventId: 67,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("customPopup_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("customPopup_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('custom1', 10, "")));
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('customPopup_0100 sleep err: ' + JSON.stringify(err));
      }
      console.info("customPopup_0100 click Two result is: " + JSON.stringify(inspector.sendEventByKey('image', 10, "")));
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('customPopup_0100 sleep err: ' + JSON.stringify(err));
      }
      console.info('customPopup_0100 END');
      done();
    });
  })
}