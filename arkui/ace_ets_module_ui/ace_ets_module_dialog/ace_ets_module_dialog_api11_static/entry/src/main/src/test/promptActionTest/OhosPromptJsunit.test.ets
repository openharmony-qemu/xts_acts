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


export default function ohosPromptJsunit() {
  describe('appInfoTest_four_3', () => {
    beforeEach(async (): Promise<void> => {
      console.info("OhosPrompt beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/ohosPrompt',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get OhosPrompt state pages: " + JSON.stringify(pages));
        if (!("OhosPrompt" == pages.name)) {
          console.info("get OhosPrompt state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push OhosPrompt success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OhosPrompt  page error:" + err);
      }

    });

    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('OhosPromptJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info("OhosPrompt each called");
    });


    
    
/**
     * @tc.number   test_OhosPrompt_static_001
     * @tc.name     test_OhosPrompt_static_001
     * @tc.desc     test_OhosPrompt_static_001
     * @tc.level    Level.LEVEL2
     */
it('test_OhosPrompt_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(1000)
      } catch (err) {
        console.info('OhosPromptJsunitTest await err: ' + JSON.stringify(err));
      }
      let callback = (eventData: emitter.EventData) => {
        waitForCompletion(async () => {
          console.info("[test_OhosPrompt_static_001] get event state result is: " + JSON.stringify(eventData));
          try {
            await Utils.sleep(500)
          } catch (err) {
            console.info('OhosPromptJsunitTest await err: ' + JSON.stringify(err));
          }
          expect(((eventData.data) as Record<String,RecordData>)['matrix1']).assertEqual("[100, 10]")
        })
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: 142,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[test_OhosPrompt_static_001] on emitter err : " + JSON.stringify(err));
      }
      console.info('[test_OhosPrompt_static_001] sendEventByKey ' +
      JSON.stringify(inspector.sendEventByKey('rotate5', 10, "")));
      try {
        await Utils.sleep(1000)
      } catch (err) {
        console.info('OhosPromptJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info('[test_OhosPrompt_static_001] testSendTouchEvent END');
      done();
    });
  })
}

