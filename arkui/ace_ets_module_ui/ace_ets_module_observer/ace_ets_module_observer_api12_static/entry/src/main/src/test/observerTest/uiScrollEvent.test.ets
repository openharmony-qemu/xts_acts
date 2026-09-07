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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function uiScrollEvent() {
  describe('uiScrollEvent', () => {
    beforeEach(async (): Promise<void> => {
      console.info("uiScrollEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/uiScrollEvent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get uiScrollEvent state pages:" + JSON.stringify(pages));
        if (!("uiScrollEvent" == pages.name)) {
          console.info("get uiScrollEvent pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push uiScrollEvent page error:" + err);
      }
      console.info("uiScrollEvent beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('uiScrollEvent afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("uiScrollEvent after each called");
    });



/**
     * @tc.number   uiScrollEvent_static_0100
     * @tc.name     uiScrollEvent_static_0100
     * @tc.desc     uiScrollEvent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('uiScrollEvent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('uiScrollEvent_0100 START');
      try {
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let btn = await driver.findComponent(ON.id('scrollEvent_uiId_on'));
        await CommonFunc.sleep(500);
        await (btn?.click() as Promise<void>);
        console.log('uiScrollEvent_0100 000')
        await CommonFunc.sleep(1000);
        let swipeAnimation = CommonFunc.getComponentRectOnScreen('testId_uiScroll');
        let top = swipeAnimation.top;
        let right = swipeAnimation.right;
        let left = swipeAnimation.left;
        let bottom = swipeAnimation.bottom;
        console.info("uiScrollEvent_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom -top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        await (driver.swipe(Math.round(left + width*0.2).toInt() ,Math.round(bottom - height/5).toInt() ,Math.round(left + width*0.2).toInt() ,Math.round(bottom - height/2).toInt() ) as Promise<void>);
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('scrollEvent_ui2');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[uiScrollEvent_0100] component obj is: " + JSON.stringify(obj));
        expect(obj.getElement('$attrs').getString('content')).assertEqual('message2:scrollEvent');
        let btn1 = await driver.findComponent(ON.id('scrollEvent_uiId_off'));
        await CommonFunc.sleep(500);
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('uiScrollEvent_0100 err: ' + JSON.stringify(err));
      }
      console.info('[uiScrollEvent_0100] END');
      done();
    });
  })
}
