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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function arcSwiperEvent() {
  describe('arcSwiperEvent', () => {
    beforeAll(() => {
      console.info("arcSwiperEvent beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.arcScroll_api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("arcSwiperEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcSwiper/arcSwiperEvent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get arcSwiperEvent state pages:" + JSON.stringify(pages));
        if (!("arcSwiperEvent" == pages.name)) {
          console.info("get arcSwiperEvent pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push arcSwiperEvent page error:" + err);
      }
      console.info("arcSwiperEvent beforeEach end");
    });

    
    /*
     * @tc.number   arcSwiperEvent_static_0100
     * @tc.name     arcSwiperEvent_static_0100
     * @tc.desc     arcSwiperEvent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('arcSwiperEvent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperEvent_static_0100] START');
      let driver = Driver.create()
      let swipeTabs = CommonFunc.getComponentRectOnScreen('arcSwiper_eventChange');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("arcSwiperEvent value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await (driver.drag((Math.round(left + width*0.8) as Int),(Math.round(top + height/2) as Int),(Math.round(left + width*0.2) as Int),(Math.round(top + height/2) as Int)) as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('arcSwiper_onChange');
      console.info("[arcSwiperEvent_static_0100] getString('getString('content')'): " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onChange: -1');

      let strJson1 = inspector.getInspectorByKey('arcSwiper_onAnimationStart');
      console.info("[arcSwiperEvent_static_0100] content1: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onAnimationStart: -1');

      let strJson2 = inspector.getInspectorByKey('arcSwiper_onAnimationEnd');
      console.info("[arcSwiperEvent_static_0100] content2: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onAnimationEnd: -1');

      let strJson3 = inspector.getInspectorByKey('arcSwiper_finishAnimation');
      console.info("[arcSwiperEvent_static_0100] content3: " + JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('finishText: 0');
      console.info('[arcSwiperEvent_static_0100] END');
      done();
    });

    
    /*
     * @tc.number   arcSwiperEvent_static_0200
     * @tc.name     arcSwiperEvent_static_0200
     * @tc.desc     arcSwiperEvent_static_0200
     * @tc.level    Level.LEVEL0
     */
it('arcSwiperEvent_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperEvent_static_0200] START');
      let driver = Driver.create()
      let btn1 = await driver.findComponent(ON.id('arcSwiper_disableSwipe'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let swipeTabs = CommonFunc.getComponentRectOnScreen('arcSwiper_eventChange');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("arcSwiperEvent value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await (driver.drag((Math.round(left + width*0.8) as Int),(Math.round(top + height/2) as Int),(Math.round(left + width*0.2) as Int),(Math.round(top + height/2) as Int)) as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('arcSwiper_onGestureSwipe');
      console.info("[arcSwiperEvent_static_0200] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[arcSwiperEvent_static_0200] content1: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onGestureSwipe success');

      let strJson2 = inspector.getInspectorByKey('arcSwiper_onChange');
      console.info("[arcSwiperEvent_static_0200] content2: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onChange: 1');

      let strJson3 = inspector.getInspectorByKey('arcSwiper_onAnimationStart');
      console.info("[arcSwiperEvent_static_0200] content3: " + JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('onAnimationStart: 0');

      let strJson4 = inspector.getInspectorByKey('arcSwiper_onAnimationEnd');
      console.info("[arcSwiperEvent_static_0200] content4: " + JSON.stringify(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')).assertEqual('onAnimationEnd: 1');

      let strJson5 = inspector.getInspectorByKey('arcSwiper_finishAnimation');
      console.info("[arcSwiperEvent_static_0200] content5: " + JSON.stringify(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')).assertEqual('finishText: 1');
      console.info('[arcSwiperEvent_static_0200] END');
      done();
    });
  })
}
