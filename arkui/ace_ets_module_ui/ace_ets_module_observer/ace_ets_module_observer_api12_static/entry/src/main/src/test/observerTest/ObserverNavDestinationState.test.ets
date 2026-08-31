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


export default function ObserverNavDestinationState() {
    describe('ObserverNavDestinationState', () => {
      beforeEach(async (): Promise<void> => {
        console.info("ObserverNavDestinationState beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/observer/ObserverNavDestinationState',
        }
        try {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.clear();
          let pages = routerInstance.getState();
          console.info("get ObserverNavDestinationState state success " + JSON.stringify(pages));
          if (!("ObserverNavDestinationState" == pages.name)) {
            console.info("get ObserverNavDestinationState state success " + JSON.stringify(pages.name));
            routerInstance.pushUrl(options);
            await CommonFunc.sleep(2000);
          }
        } catch (err) {
          console.error("push ObserverNavDestinationState page error: " + err);
        }
      });

      afterEach(async (): Promise<void> => {
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('ObserverNavDestinationState afterEach sleep err: ' + JSON.stringify(err));
        }
        console.info("ObserverNavDestinationState after each called");
      });



/**
     * @tc.number   ObserverNavDestinationState_static_0100
     * @tc.name     ObserverNavDestinationState_static_0100
     * @tc.desc     ObserverNavDestinationState_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ObserverNavDestinationState_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ObserverNavDestinationState_0100] START');
      try {
        await CommonFunc.sleep(1000);

        let driver = Driver.create();
        await CommonFunc.sleep(1000);

        let btn1 = await driver.findComponent(ON.id('ObserverNavDestinationState_pageOne'));
        await (btn1?.click() as Promise<void>)
        console.info("[ObserverNavDestinationState_0100] btn1");
        await CommonFunc.sleep(1000);

        let btn2 = await driver.findComponent(ON.id('ObserverNavDestinationState_pageTwo'));
        await (btn2?.click() as Promise<void>)
        console.info("[ObserverNavDestinationState_0100] btn2");
        await CommonFunc.sleep(1000);

        await driver.pressBack()
        await CommonFunc.sleep(2000);

        let btn3 = await driver.findComponent(ON.id('ObserverNavDestinationState_get'));
        await (btn3?.click() as Promise<void>)
        console.info("[ObserverNavDestinationState_0100] btn2");
        await CommonFunc.sleep(3000);

        let strJson1 = inspector.getInspectorByKey('ObserverNavDestinationState_text');
        let obj1 = JSON.parseJsonElement(strJson1);
        await CommonFunc.sleep(2000);
        console.info("[ObserverNavDestinationState_0100] obj1 is: " + JSON.stringify(obj1));
        expect(obj1.getElement('$attrs').getString('content')).assertEqual('1ON_WILL_APPEAR;1ON_APPEAR;1ON_WILL_SHOW;1ON_SHOWN;2ON_WILL_APPEAR;1ON_WILL_HIDE;2ON_APPEAR;2ON_WILL_SHOW;1ON_HIDDEN;2ON_SHOWN;2ON_BACKPRESS;2ON_WILL_HIDE;1ON_WILL_SHOW;2ON_HIDDEN;2ON_WILL_DISAPPEAR;1ON_SHOWN;2ON_DISAPPEAR;');
      } catch (err) {
        console.info('ObserverNavDestinationState_0100 err: ' + JSON.stringify(err));
      }

      console.info('[ObserverNavDestinationState_0100] END');
      done();
    });
  })
}
