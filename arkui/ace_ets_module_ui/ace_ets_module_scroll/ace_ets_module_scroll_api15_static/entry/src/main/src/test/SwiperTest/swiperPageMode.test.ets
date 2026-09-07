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
import { describe, beforeEach, afterEach, it, expect, Level, afterAll } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function swiperPageMode() {
  describe('swiperPageMode', () => {
    beforeEach(async (): Promise<void> => {
      console.info("swiperPageMode beforeEach start");
      const swiperPageMode = AppStorage.get<Router>("router") as Router
      swiperPageMode.clear()
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/swiperPageMode",
      }
      try {
        let pages = swiperPageMode.getState();
        console.info("get swiperPageMode state pages:" + JSON.stringify(pages));
        if (!("swiperPageMode" == pages.name)) {
          console.info("get swiperPageMode pages.name:" + JSON.stringify(pages.name));
          swiperPageMode.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push swiperPageMode page error:" + err);
      }
      console.info("swiperPageMode beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        let btn: Component = await driver.findComponent(ON.id('swiper_PageMode_onChange')) as Component;
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('swiperPageMode afterEach err: ' + JSON.stringify(err));
      }
      console.info("swiperPageMode after each called");
    });



    /**
     * @tc.number   swiperPageMode_static_0100
     * @tc.name     swiperPageMode_static_0100
     * @tc.desc     swiperPageMode_static_0100
     * @tc.level    Level.LEVEL1
     */
it('swiperPageMode_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[swiperPageMode_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        let btn: Component = await driver.findComponent(ON.id('swiper_PageMode_single')) as Component;
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        let strJson1 = inspector.getInspectorByKey('swiper_pageFlipMode');
        console.info("[swiperPageMode_static_0100] component obj is: " + strJson1);
        console.info("[swiperPageMode_static_0100] pageFlipMode1: " +
        JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs')));
        await CommonFunc.sleep(1000);
        // expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('pageFlipMode')).assertEqual("PageFlipMode.SINGLE");

        let swiperList = CommonFunc.getComponentRectOnScreen('swiper_pageFlipMode');
        let left = swiperList.left;
        let right = swiperList.right;
        let top = swiperList.top;
        let bottom = swiperList.bottom;
        let width = right - left;
        let height = bottom - top;
        console.info("swiperPageMode_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
        await driver.mouseScroll({ x: (Math.round(left + width / 2)).toInt(), y: (Math.round(top + height / 2)).toInt() },
          true, 1)
        await CommonFunc.sleep(1000);
        let strJson2 = inspector.getInspectorByKey('swiper_PageMode_onChange');
        console.info("[swiperPageMode_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
        // console.info("[swiperPageMode_static_0100]: content: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
        let num1: number = Math.round(Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')))
        expect(num1 <= 2).assertTrue();
        console.info('[swiperPageMode_static_0100] END');
        done();
      } catch (error) {
        console.error('[swiperPageMode_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number   swiperPageMode_static_0200
     * @tc.name     swiperPageMode_static_0200
     * @tc.desc     swiperPageMode_static_0200
     * @tc.level    Level.LEVEL1
     */
it('swiperPageMode_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[swiperPageMode_static_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        let btn: Component = await driver.findComponent(ON.id('swiper_PageMode_continuous')) as Component;
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        let strJson1 = inspector.getInspectorByKey('swiper_pageFlipMode');
        console.info("[swiperPageMode_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
        await CommonFunc.sleep(1000);
        // expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('pageFlipMode')).assertEqual("PageFlipMode.CONTINUOUS");

        let swiperList = CommonFunc.getComponentRectOnScreen('swiper_pageFlipMode');
        let left = swiperList.left;
        let right = swiperList.right;
        let top = swiperList.top;
        let bottom = swiperList.bottom;
        let width = right - left;
        let height = bottom - top;
        console.info("swiperPageMode_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
        await driver.mouseScroll({ x: (Math.round(left + width / 2)).toInt(), y: (Math.round(top + height / 2)).toInt() },
          true, 3)
        await CommonFunc.sleep(5000);

        let strJson2 = inspector.getInspectorByKey('swiper_PageMode_onChange');
        console.info("[swiperPageMode_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
        console.info("[swiperPageMode_static_0200]: content: " +
        JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
        let num1: number = Math.round(Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')))
        expect(num1 > 2).assertTrue();
        console.info('[swiperPageMode_static_0200] END');
        done();
      } catch (error) {
        console.error('[swiperPageMode_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
