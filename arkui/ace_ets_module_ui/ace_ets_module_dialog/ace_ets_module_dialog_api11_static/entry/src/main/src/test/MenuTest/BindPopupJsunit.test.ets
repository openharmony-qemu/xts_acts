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
import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
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
  PointerMatrix
} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { RecordData } from '@ohos.base';


export default function bindPopupTest() {
  describe('bindPopupTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/bindPopup',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get bindPopup state pages: " + JSON.stringify(pages));
        if (!("bindPopup" == pages.name)) {
          console.info("get bindPopup state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info("push bindPopup success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindPopup page error: " + err);
      }

    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info("bindPopup after each called");
    });


    
    
/**
     * @tc.number   bindPopupTest_static_0100
     * @tc.name     bindPopupTest_static_0100
     * @tc.desc     bindPopupTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('bindPopupTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupTest_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      let callback = (indexEvent: emitter.EventData) => {
        console.info("bindPopupTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(((indexEvent.data) as Record<String,RecordData>)?.['enableArrow']).assertEqual(true);
        expect(((indexEvent.data) as Record<String,RecordData>)?.['maskColor']).assertEqual(0x33000000);
        done();
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 67,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("bindPopupTest_static_0100 on emitter err : " + JSON.stringify(err));
      }
      console.info("bindPopupTest_static_0100 click result is: " +
      JSON.stringify(inspector.sendEventByKey('bindPopup' + '_button', 10, "")));
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info("bindPopupTest_static_0100 click Two result is: " +
      JSON.stringify(inspector.sendEventByKey('image', 10, "")));
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await driver.triggerKey(2070)
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info('bindPopupTest_static_0100 END');
    });


    
    
/**
     * @tc.number   bindPopupTest_static_0200
     * @tc.name     bindPopupTest_static_0200
     * @tc.desc     bindPopupTest_static_0200
     * @tc.level    Level.LEVEL2
     */
it('bindPopupTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupTest_static_0200 START');
      let driver = Driver.create()
      try {
        let eventData: emitter.EventData = {
          data: {
            "enableArrow": false,
            "maskColor": 0x33000009
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 68,
          priority: emitter.EventPriority.LOW
        }
        console.info("bindPopupTest_static_0200 start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("bindPopupTest_static_0200 change component data error: " + err.message);
      }
      try {
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      let callbackOne = (indexEventOne: emitter.EventData) => {
        console.info("bindPopupTest_static_0200 get state result is: " + JSON.stringify(indexEventOne));
        expect(((indexEventOne.data) as Record<String,RecordData>)?.['enableArrow']).assertEqual(false);
        expect(((indexEventOne.data) as Record<String,RecordData>)?.['maskColor']).assertEqual(0x33000009);
      }
      let indexEventOne: emitter.InnerEvent = {
        eventId: 66,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEventOne, callbackOne);
      } catch (err) {
        console.info("bindPopupTest_static_0200 on emitter err : " + JSON.stringify(err));
      }
      console.info("bindPopupTest_static_0200 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await driver.triggerKey(2070)
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info('bindPopupTest_static_0200 END');
      done();
    });


    
    
/**
     * @tc.number   bindPopupTest_static_0300
     * @tc.name     bindPopupTest_static_0300
     * @tc.desc     bindPopupTest_static_0300
     * @tc.level    Level.LEVEL2
     */
it('bindPopupTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupTest_static_0300 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      let callback = (indexEvent: emitter.EventData) => {
        console.info("bindPopupTest_static_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(((indexEvent.data) as Record<String,RecordData>)?.['placementOnTop']).assertEqual(false);
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 65,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("bindPopupTest_static_0300 on emitter err : " + JSON.stringify(err));
      }
      console.info("bindPopupTest_static_0300 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await driver.triggerKey(2070)
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindPopupJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info('bindPopupTest_static_0300 END');
      done();
    });
  })
}
