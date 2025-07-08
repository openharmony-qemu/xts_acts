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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import { vp2px } from '@ohos.arkui.component';
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function interceptSwiperTest() {
  describe('interceptSwiperTest', () => {
    beforeAll(() => {
      console.info("interceptSwiperTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll15.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("interceptSwiperTest beforeEach start");
      const interceptSwiperTest = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/interceptSwiper",
      }
      try {
        interceptSwiperTest.clear();
        let pages = interceptSwiperTest.getState();
        console.info("get interceptSwiperTest state pages:" + JSON.stringify(pages));
        if (!("interceptSwiper" == pages.name)) {
          console.info("get interceptSwiperTest pages.name:" + JSON.stringify(pages.name));
          let result = await interceptSwiperTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push interceptSwiperTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push interceptSwiperTest page error:" + err);
      }
      console.info("interceptSwiperTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("interceptSwiperTest after each called");
    });

    /**
     * @tc.number    interceptSwiperTest_static_001
     * @tc.name      interceptSwiperTest_static_0100
     * @tc.desc      Intercept the behavior of sliding and flipping pages backwards.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('interceptSwiperTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[interceptSwiperTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let swiperList = CommonFunc.getComponentRectOnScreen('swiper_intercept');
      let top = swiperList.top;
      let right = swiperList.right;
      let left = swiperList.left;
      let bottom = swiperList.bottom;
      let height = bottom -top;
      console.info("interceptSwiperTest_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let driver = Driver.create()
      await driver.swipe(Math.round(right - vp2px(20)),Math.round(top + height/2),Math.round(left + vp2px(20)),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let swiperContent = await driver.findComponent(ON.id('swiper_intercept_text'));
      let text1 = await (swiperContent?.getText() as Promise<string>);
      expect(text1).assertEqual('2');
      console.info('[interceptSwiperTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    interceptSwiperTest_static_002
     * @tc.name      interceptSwiperTest_static_0200
     * @tc.desc      Do not intercept the behavior of sliding forward to flip pages.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('interceptSwiperTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[interceptSwiperTest_static_0200] START');
      await CommonFunc.sleep(1000);
      let swiperList = CommonFunc.getComponentRectOnScreen('swiper_intercept');
      let top = swiperList.top;
      let right = swiperList.right;
      let left = swiperList.left;
      let bottom = swiperList.bottom;
      let height = bottom -top;
      console.info("interceptSwiperTest_static_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let driver = Driver.create()
      await driver.swipe(Math.round(left + vp2px(20)),Math.round(top + height/2),Math.round(right - vp2px(20)),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let swiperContent = await driver.findComponent(ON.id('swiper_intercept_text'));
      let text1 = await (swiperContent?.getText() as Promise<string>);
      expect(text1).assertEqual('1');
      console.info('[interceptSwiperTest_static_0200] END');
      done();
    });
  })
}