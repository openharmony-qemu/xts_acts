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

export default function idScrollEvent() {
  describe('idScrollEvent', () => {
    beforeEach(async (): Promise<void> => {
      console.info("idScrollEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/idScrollEvent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get idScrollEvent state pages:" + JSON.stringify(pages));
        if (!("idScrollEvent" == pages.name)) {
          console.info("get idScrollEvent pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push idScrollEvent page error:" + err);
      }
      console.info("idScrollEvent beforeEach end");
    });



/**
     * @tc.number   idScrollEvent_static_0100
     * @tc.name     idScrollEvent_static_0100
     * @tc.desc     idScrollEvent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('idScrollEvent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[idScrollEvent_0100] START');
      try {
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let btn1 = await driver.findComponent(ON.id('scroll_observer_on'));
        await CommonFunc.sleep(500);
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        let swipeScroll = CommonFunc.getComponentRectOnScreen('testScroll');
        let top = swipeScroll.top;
        let right = swipeScroll.right;
        let left = swipeScroll.left;
        let bottom = swipeScroll.bottom;
        console.info("idScrollEvent_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom -top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        await (driver.swipe(Math.round(left + width/2).toInt(),Math.round(top + height*0.8).toInt() ,Math.round(left + width/2).toInt() ,Math.round(top + height*0.2).toInt()) as Promise<void>);
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('scroll_observer_id');
        console.info("[scrollSourceDrag_0100] content1: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('id: testScroll');

        let strJson2 = inspector.getInspectorByKey('scroll_observer_uniqueId');
        console.info("[scrollSourceDrag_0100] content2: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content') != 'uniqueId: 0').assertTrue();

        let strJson3 = inspector.getInspectorByKey('scroll_observer_scrollEvent');
        console.info("[scrollSourceDrag_0100] content3: " + JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')));
        expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('scrollEvent: 1');

        let strJson4 = inspector.getInspectorByKey('scroll_observer_offset');
        console.info("[scrollSourceDrag_0100] content4: " + JSON.stringify(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')));
        expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content') != 'offset: 0').assertTrue();
        await CommonFunc.sleep(1000);
        let btn2 = await driver.findComponent(ON.id('scroll_observer_off'));
        await (btn2?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('idScrollEvent_0100 err: ' + JSON.stringify(err));
      }
      console.info('[idScrollEvent_0100] END');
      done();
    });
  })
}
