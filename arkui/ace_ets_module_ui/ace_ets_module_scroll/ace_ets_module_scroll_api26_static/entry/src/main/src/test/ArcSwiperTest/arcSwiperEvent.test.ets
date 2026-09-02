'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  describe,
  it,
  expect,
  Level,
  beforeEach,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, Component, UiWindow, ON, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function arcSwiperEvent() {
  describe('arcSwiperEvent', () => {
    beforeEach(async (): Promise<void> => {
      console.info('arcSwiperEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcSwiper/arcSwiperEvent',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get arcSwiperEvent state pages:' + JSON.stringify(pages));
        if (!('arcSwiperEvent' == pages.name)) {
          console.info('get arcSwiperEvent pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push arcSwiperEvent page error:' + err);
      }
      console.info('arcSwiperEvent beforeEach end');
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_EVENT_0100
     * @tc.number SUB_ARKUI_ARCSWIPER_EVENT_0100
     * @tc.desc   Set the sliding switch function of disabled components.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_EVENT_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperEvent_0100] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let arc2 = await driver.findComponent(ON.id('arcSwiper_eventChange'));
      let swipeTabs = await (arc2?.getBounds() as Promise<Rect>);
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      let height = bottom - top;
      let width = right - left;
      await driver.drag(Math.round(left + width * 0.8).toInt(), Math.round(top + height / 2).toInt(),
        Math.round(left + width * 0.2).toInt(), Math.round(top + height / 2).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('arcSwiper_onChange');
      console.info('[arcSwiperEvent_0100] content: ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onChange: -1');

      let strJson1 = inspector.getInspectorByKey('arcSwiper_onAnimationStart');
      console.info('[arcSwiperEvent_0100] content1: ' +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual('onAnimationStart: -1');

      let strJson2 = inspector.getInspectorByKey('arcSwiper_onAnimationEnd');
      console.info('[arcSwiperEvent_0100] content2: ' +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
        .assertEqual('onAnimationEnd: -1');

      let strJson3 = inspector.getInspectorByKey('arcSwiper_finishAnimation');
      console.info('[arcSwiperEvent_0100] content3: ' +
      JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('finishText: 0');
      console.info('[arcSwiperEvent_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_EVENT_0200
     * @tc.number SUB_ARKUI_ARCSWIPER_EVENT_0200
     * @tc.desc   During the sliding process of the page, trigger callback events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_EVENT_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperEvent_0200] START');
      let driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('arcSwiper_disableSwipe')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      let arc3 = await driver.findComponent(ON.id('arcSwiper_eventChange'));
      let swipeTabs = await (arc3?.getBounds() as Promise<Rect>);
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      let height = bottom - top;
      let width = right - left;
      await driver.drag(Math.round(left + width * 0.8).toInt(), Math.round(top + height / 2).toInt(),
        Math.round(left + width * 0.2).toInt(), Math.round(top + height / 2).toInt());
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('arcSwiper_onGestureSwipe');
      console.info('[arcSwiperEvent_0200] component obj1 is: ' + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info('[arcSwiperEvent_0200] content1: ' +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual('onGestureSwipe success');

      let strJson2 = inspector.getInspectorByKey('arcSwiper_onChange');
      console.info('[arcSwiperEvent_0200] content2: ' +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onChange: 1');

      let strJson3 = inspector.getInspectorByKey('arcSwiper_onAnimationStart');
      console.info('[arcSwiperEvent_0200] content3: ' +
      JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
        .assertEqual('onAnimationStart: 0');

      let strJson4 = inspector.getInspectorByKey('arcSwiper_onAnimationEnd');
      console.info('[arcSwiperEvent_0200] content4: ' +
      JSON.stringify(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
        .assertEqual('onAnimationEnd: 1');

      let strJson5 = inspector.getInspectorByKey('arcSwiper_finishAnimation');
      console.info('[arcSwiperEvent_0200] content5: ' +
      JSON.stringify(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')).assertEqual('finishText: 1');

      console.info('[arcSwiperEvent_0200] END');
      done();
    });
  })
}
