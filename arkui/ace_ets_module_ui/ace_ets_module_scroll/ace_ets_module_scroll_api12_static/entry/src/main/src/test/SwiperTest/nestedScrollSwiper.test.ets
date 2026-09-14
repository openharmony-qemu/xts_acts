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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function nestedScrollSwiper() {
  describe('nestedScrollSwiper', () => {
    beforeEach(async (): Promise<void> => {
      console.info("nestedScrollSwiper beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/nestedScrollSwiper",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get nestedScrollSwiper state pages:" + JSON.stringify(pages));
        if (!("nestedScrollSwiper" == pages.name)) {
          console.info("get nestedScrollSwiper pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push nestedScrollSwiper page error:" + err);
      }
      console.info("nestedScrollSwiper beforeEach end");
    });

    
      
  
/**
     * @tc.number   nestedScrollSwiper_static_0100
     * @tc.name     nestedScrollSwiper_static_0100
     * @tc.desc     nestedScrollSwiper_static_0100
     * @tc.level    Level.LEVEL0
     */
it('nestedScrollSwiper_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[nestedScrollSwiper_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiper_nestedScroll_1');
      console.info("[nestedScrollSwiper_static_0100] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[nestedScrollSwiper_static_0100] nestedScroll: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('nestedScroll')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      await (driver?.assertComponentExist(ON.text('2')) as Promise<void>);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')).assertEqual('false');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('nestedScroll'))
        .assertEqual('SwiperNestedScrollMode.SELF_ONLY');

      let swiperScroll = CommonFunc.getComponentRectOnScreen('swiper_nestedScroll_1');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("nestedScrollSwiper_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width * 0.8)).toInt(), (Math.round(top + height / 2)).toInt(),
        (Math.round(left + width * 0.1)).toInt(), (Math.round(top + height / 2)).toInt());
      await CommonFunc.sleep(2000);
      await (driver?.assertComponentExist(ON.text('3')) as Promise<void>);

      console.info('[nestedScrollSwiper_static_0100] END');
      done();
    });

    
      
  
/**
     * @tc.number   nestedScrollSwiper_static_0200
     * @tc.name     nestedScrollSwiper_static_0200
     * @tc.desc     nestedScrollSwiper_static_0200
     * @tc.level    Level.LEVEL0
     */
it('nestedScrollSwiper_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[nestedScrollSwiper_static_0200] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('swiper_nestedScroll_2');
        console.info("[nestedScrollSwiper_static_0200] component obj is: " +
        JSON.stringify(JSON.parseJsonElement(strJson)));
        console.info("[nestedScrollSwiper_static_0200] nestedScroll: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('nestedScroll')));
        await CommonFunc.sleep(1000);
        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
        await (driver?.assertComponentExist(ON.text('2')) as Promise<void>);
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')).assertEqual('false');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('nestedScroll'))
          .assertEqual('SwiperNestedScrollMode.SELF_FIRST');

        let swiperScroll = CommonFunc.getComponentRectOnScreen('swiper_nestedScroll_2');
        let top = swiperScroll.top;
        let right = swiperScroll.right;
        let left = swiperScroll.left;
        let bottom = swiperScroll.bottom;
        console.info("nestedScrollSwiper_static_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom - top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        await (driver?.swipe((Math.round(left + width * 0.8)).toInt(), (Math.round(top + height / 2)).toInt(),
          (Math.round(left + width * 0.1)).toInt(), (Math.round(top + height / 2)).toInt()) as Promise<void>);
        await CommonFunc.sleep(2000);
        await (driver?.assertComponentExist(ON.text('3')) as Promise<void>);

        console.info('[nestedScrollSwiper_static_0200] END');
        done();
      } catch (error) {
        console.error('[nestedScrollSwiper_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
