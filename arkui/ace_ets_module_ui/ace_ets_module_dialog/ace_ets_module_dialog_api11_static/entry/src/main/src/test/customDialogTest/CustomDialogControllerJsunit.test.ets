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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function customDialogControllerJsunit() {
  describe('customDialogControllerTest', () => {
    beforeAll(() => {
      console.info("customDialogControllerTest beforeAll start")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
      console.info("customDialogControllerTest  beforeAll end")
    })
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
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push customDialogController page error " + err);
      }

    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("customDialogControllers after each called");
    });


    /*
         * @tc.number   testCustomDialogControllers_static_100
         * @tc.name     testCustomDialogControllers_static_100
         * @tc.desc     testCustomDialogControllers_static_100
         * @tc.level    Level.LEVEL2
         */
    it('testCustomDialogControllers_static_100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[testCustomDialogControllers_static_100] START');
      let driver = Driver.create()
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[testClickEvent001] get event state result is: " + JSON.stringify(eventData));
        expect(((eventData.data) as Record<string, RecordData>)?.['ACTION']).assertEqual(true)
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
      console.info('[testClickEvent001] sendEventByKey ' +
      JSON.stringify(inspector.sendEventByKey('dialogController', 10, "")));
      await Utils.sleep(1000)
      await driver.pressBack();
      console.info('[testClickEvent001] testSendTouchEvent END');
    });

  })
}