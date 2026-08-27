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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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


export default function customDialogControllerJsunit() {
  describe('customDialogControllerTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/customDialogController',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get customDialogController state pages: " + JSON.stringify(pages));
        if (!("customDialogController" == pages.name)) {
          console.info("get customDialogController state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push customDialogController success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customDialogController page error " + err);
      }

    });

    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('CustomDialogControllerJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info("customDialogControllers after each called");
    });


    
    
/**
     * @tc.number   testCustomDialogControllers_static_100
     * @tc.name     testCustomDialogControllers_static_100
     * @tc.desc     testCustomDialogControllers_static_100
     * @tc.level    Level.LEVEL2
     */
it('testCustomDialogControllers_static_100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testCustomDialogControllers_static_100] START');
      let driver = Driver.create()
      let callback = (eventData: emitter.EventData) => {
        console.info("[testClickEvent001] get event state result is: " + JSON.stringify(eventData));
        expect(((eventData.data) as Record<String,RecordData>)?.['ACTION']).assertEqual(true)
        done();
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: 236,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testClickEvent001] on emitter err : " + JSON.stringify(err));
      }
      console.info('[testClickEvent001] sendEventByKey ' +
      JSON.stringify(inspector.sendEventByKey('dialogController', 10, "")));
      try {
        await Utils.sleep(1000)
      } catch (err) {
        console.info('CustomDialogControllerJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
        await driver.pressBack();
      } catch (err) {
        console.info('CustomDialogControllerJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info('[testClickEvent001] testSendTouchEvent END');
    });

  })
}
