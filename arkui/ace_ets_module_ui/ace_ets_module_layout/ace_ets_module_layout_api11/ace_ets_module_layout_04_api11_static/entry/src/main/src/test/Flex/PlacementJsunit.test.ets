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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "../../../../hypium/index"
import router from '@ohos.router';
import Utils from '../Utils';
import events_emitter from '@ohos.events.emitter';
import { Placement } from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function placementJsunit(){
  describe('placementJsunit', () =>{
    beforeAll(() => {
      console.info("placementJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/placement',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get placement state success " + "");
        if (!("placement" == pages.name)) {
          console.info("get placement state success " + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(3000);
          // console.info("push placement page success " + "");
        }
      } catch (err) {
        console.error("push placement page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("placement after each called");
    });

    it('placementTest_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('placementTest_static_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("placementTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.['placement']).assertEqual(Placement.TopLeft);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 157,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("placementTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("placementTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button',10,"")));
      await Utils.sleep(1500);
      console.info("placementTest_static_0100 clickOne result is: " + JSON.stringify(inspector.sendEventByKey('image',10,"")));
      console.info('placementTest_static_0100 END');
    });

    it('placementTest_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('placementTest_static_0200 START');
      await Utils.sleep(1500);
      let callbackOne = (indexEventOne: events_emitter.EventData) => {
        console.info("placementTest_static_0200 get state result is: " + JSON.stringify(indexEventOne));
        expect(indexEventOne.data?.['placement']).assertEqual(Placement.TopRight);
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 158,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callbackOne);
      } catch (err) {
        console.info("placementTest_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("placementTest_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button1',10,"")));
      await Utils.sleep(1500);
      console.info("placementTest_static_0200 clickOne result is: " + JSON.stringify(inspector.sendEventByKey('image1',10,"")));
      console.info('placementTest_static_0200 END');
      done();
    });

    it('placementTest_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('placementTest_static_0300 START');
      await Utils.sleep(1500);
      let callbackTwo = (indexEventTwo: events_emitter.EventData) => {
        console.info("placementTest_static_0300 get state result is: " + JSON.stringify(indexEventTwo));
        expect(indexEventTwo.data?.['placement']).assertEqual(Placement.BottomLeft);
      }
      let indexEventTwo: events_emitter.InnerEvent = {
        eventId: 159,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventTwo, callbackTwo);
      } catch (err) {
        console.info("placementTest_static_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("placementTest_static_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('button2',10,"")));
      await Utils.sleep(1500);
      console.info("placementTest_static_0300 clickOne result is: " + JSON.stringify(inspector.sendEventByKey('image2',10,"")));
      console.info('placementTest_static_0300 END');
      done();
    });

    it('placementTest_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('placementTest_static_0400 START');
      await Utils.sleep(1500);
      let callbackThree = (indexEventThree: events_emitter.EventData) => {
        console.info("placementTest_static_0400 get state result is: " + JSON.stringify(indexEventThree));
        expect(indexEventThree.data?.['placement']).assertEqual(Placement.BottomRight);
      }
      let indexEventThree: events_emitter.InnerEvent = {
        eventId: 160,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventThree, callbackThree);
      } catch (err) {
        console.info("placementTest_static_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("placementTest_static_0400 click result is: " + JSON.stringify(inspector.sendEventByKey('button3',10,"")));
      await Utils.sleep(1500);
      console.info("placementTest_static_0400 clickOne result is: " + JSON.stringify(inspector.sendEventByKey('image3',10,"")));
      console.info('placementTest_static_0400 END');
      done();
    });
  })
}