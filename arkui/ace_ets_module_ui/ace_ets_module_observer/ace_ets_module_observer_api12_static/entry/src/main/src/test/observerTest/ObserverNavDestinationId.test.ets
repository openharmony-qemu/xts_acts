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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function ObserverNavDestinationId() {
  describe('ObserverNavDestinationId', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ObserverNavDestinationId beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/ObserverNavDestinationId',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObserverNavDestinationId state success " + JSON.stringify(pages));
        if (!("ObserverNavDestinationId" == pages.name)) {
          console.info("get ObserverNavDestinationId state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ObserverNavDestinationId page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ObserverNavDestinationId afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("ObserverNavDestinationId after each called");
    });



/**
     * @tc.number   ObserverNavDestinationId_static_0100
     * @tc.name     ObserverNavDestinationId_static_0100
     * @tc.desc     ObserverNavDestinationId_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ObserverNavDestinationId_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ObserverNavDestinationId_0100] START');
      try {
        await CommonFunc.sleep(1000);

        let driver = Driver.create();
        await CommonFunc.sleep(1000);

        let btn1 = await driver.findComponent(ON.id('ObserverNavDestinationId_pageOne'));
        await (btn1?.click() as Promise<void>)
        await CommonFunc.sleep(1000);

        let strJson1 = inspector.getInspectorByKey('ObserverNavDestinationId_text1');
        let obj1 = JSON.parseJsonElement(strJson1);
        await CommonFunc.sleep(1000);
        console.info("[ObserverNavDestinationId_0100] obj1 is: " + JSON.stringify(obj1));

        let strJson2 = inspector.getInspectorByKey('ObserverNavDestinationId_text2');
        let obj2 = JSON.parseJsonElement(strJson2);
        await CommonFunc.sleep(1000);
        console.info("[ObserverNavDestinationId_0100] obj2 is: " + JSON.stringify(obj2));

        expect(obj1.getElement('$attrs').getString('content')).assertEqual(obj2.getElement('$attrs').getString('content'));
      } catch (err) {
        console.info('ObserverNavDestinationId_0100 err: ' + JSON.stringify(err));
      }

      console.info('[ObserverNavDestinationId_0100] END');
      done();
    });
  })
}
