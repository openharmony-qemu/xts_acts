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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

interface Action {
  ACTION: string
}

export default function touchAbleJsunit() {
  describe('touchAbleTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("touchAbleJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/touchable/touchAble",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("touchAble" == pages.name)) {
          console.info("get touchAble state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push touchAbleJsunit page error:" + err);
      }
      console.info("touchAbleJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("touchAble after each called");
    });

    
    /**
     * @tc.number   testTouchAble_static_001
     * @tc.name     testTouchAble_static_001
     * @tc.desc     testTouchAble_static_001
     * @tc.level    Level.LEVEL0
     */
it('testTouchAble_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(1000)
      } catch (err) {
        console.error("testTouchAble_static_001 sleep error:" + err);
      }
      let strJson: string = inspector.getInspectorByKey('ellipse');
      console.info("[testTouchAble001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('focusable')).assertEqual(false);
      done();
    });

    
    /**
     * @tc.number   testTouchAble_static_002
     * @tc.name     testTouchAble_static_002
     * @tc.desc     testTouchAble_static_002
     * @tc.level    Level.LEVEL0
     */
it('testTouchAble_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("testTouchAble_static_002 sleep error:" + err);
      }
      let callbackTwo = (eventData: events_emitter.EventData) => {
        console.info("[testTouchAble002] get event state result is: " + JSON.stringify(eventData));
        // let act = eventData.data as Action
        const data = eventData.data as Record<String,RecordData>
        expect(data['ACTION']).assertEqual('Ellipse Clicked')
        console.info('[testTouchAble002] END');
        done()
      }
      let innerEventTwo: events_emitter.InnerEvent = {
        eventId: 237,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventTwo, callbackTwo)
      } catch (err) {
        console.info("[testTouchAble002] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testClickEvent002 click result is: " + JSON.stringify(inspector.sendEventByKey('ellipse', 10, "")));
    });
  })
}