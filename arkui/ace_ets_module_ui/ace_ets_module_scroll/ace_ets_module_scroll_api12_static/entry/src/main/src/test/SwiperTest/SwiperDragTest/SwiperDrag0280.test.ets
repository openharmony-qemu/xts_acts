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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
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
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
export default function SwiperDrag0280() {
  describe('SwiperDrag0280', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SwiperDrag0280 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperDrag0280 state pages:" + JSON.stringify(pages));
        if (!("SwiperDrag0280" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperDrag/SwiperDrag0280'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperDrag0280 page result:");
        }
      } catch (err) {
        console.error("push SwiperDrag0280 page error:" + err);
      }
      console.info("SwiperDrag0280 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperDrag0280 after each called");
    });

    
      
  
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0280
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0280
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0280
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0280', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0280 START");
      await CommonFunc.sleep(1000)
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('UIComponentScrollSwiperDrag0280_button'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strSwiper: string = inspector.getInspectorByKey('UIComponentScrollSwiperDrag0280_swiper')
      let jsonSwiperCure = JSON.parseJsonElement(strSwiper).getElement('$attrs').getString('curve');
      let jsonSwiperIndicator = JSON.parseJsonElement(strSwiper).getElement('$attrs').getString('indicator');
      expect(jsonSwiperCure).assertEqual('Curves.LinearOutSlowIn')
      expect(jsonSwiperIndicator).assertEqual('true')
      await CommonFunc.sleep(1000);
      let strIndex: string = inspector.getInspectorByKey('UIComponentScrollSwiperDrag0280_text')
      let jsonIndex = JSON.parseJsonElement(strIndex).getElement('$attrs').getString('content');
      expect(jsonIndex).assertEqual('1')
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_static_0280 END');
      done();
    });
  })
}