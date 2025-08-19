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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils.ets';
import events_emitter from '@ohos.events.emitter';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from "../../../ets/MainAbility/common/Common";


export default function customDialogControllerJsunit() {
  describe('customDialogControllerTest', () => {
    beforeAll(() => {
      console.info("customDialogController beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("customDialogController beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/customDialogController',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get customDialogController state pages:" + JSON.stringify(pages));
        if (!("customDialogController" == pages.name)) {
          console.info("get customDialogController pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push customDialogController page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customDialogController page error:" + err);
      }
      console.info("customDialogController beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("customDialogControllers after each called");
    });
    /**
     * @tc.number    testCustomDialogControllers_static_100
     * @tc.name      testCustomDialogControllers_static_100
     * @tc.desc      set api
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */

    it('testCustomDialogControllers_static_100', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[testCustomDialogControllers_static_100] START');
      let driver = Driver.create()
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[testClickEvent001] get event state result is: " + JSON.stringify(eventData));
        expect(((eventData.data) as ESObject)?.getProperty('ACTION')).assertEqual(true)
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 236,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testClickEvent001] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testClickEvent001] sendEventByKey ' + JSON.stringify(inspector.sendEventByKey('dialogController', 10, "")));
      await Utils.sleep(1000)
      await driver.pressBack();
      console.info('[testClickEvent001] testSendTouchEvent END');
    });

  })
}