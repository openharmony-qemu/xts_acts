'use static';
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
import events_emitter from '@ohos.events.emitter';
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import { $r } from '@ohos.arkui.component'


export default function callbackTest() {
  describe('callbackTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("callbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/callback/callback",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get callbackTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get callbackTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push callbackTest page error:" + err);
      }
      console.info("callbackTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.back();
    })

    
    
/**
     * @tc.number   callbackTest_static_0100
     * @tc.name     callbackTest_static_0100
     * @tc.desc     callbackTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('callbackTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('callbackTest_0100 START');

      let driver = Driver.create()
      let button = await (driver?.findComponent(ON.id('callback_get')) as Promise<Component | null>);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('callback_age');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[callbackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[callbackTest_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('age: 30');
      console.info('[callbackTest_0100] END');
      done();
    });

  })
}
