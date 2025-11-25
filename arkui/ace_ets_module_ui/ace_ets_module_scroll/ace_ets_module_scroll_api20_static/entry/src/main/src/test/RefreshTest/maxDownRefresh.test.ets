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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
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

export default function maxDownRefresh() {
  describe('maxDownRefresh', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("maxDownRefresh beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Refresh/maxDownRefresh",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get maxDownRefresh state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/Refresh/maxDownRefresh" == pages.name)) {
          console.info("get maxDownRefresh pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push maxDownRefresh page error:" + err);
      }
      console.info("maxDownRefresh beforeEach end");
    });

    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });

    
    /*
     * @tc.number   maxDownRefresh_static_0100
     * @tc.name     maxDownRefresh_static_0100
     * @tc.desc     maxDownRefresh_static_0100
     * @tc.level    Level.LEVEL0
     */
it('maxDownRefresh_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxDownRefresh_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_64 = await driver.findComponent(ON.id('maxPull_text_z')) as Component;
      await btn_64.click();
      await CommonFunc.sleep(1500);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('maxPull_down_refresh');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("maxDownRefresh_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height / 6)).toInt(),
        (Math.round(left + width / 2)).toInt(), (Math.round(bottom - height / 6)).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onState_text');
      console.info("[maxDownRefresh_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[maxDownRefresh_static_0100] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onRefreshing');
      let btn_reset = await driver.findComponent(ON.id('maxPull_text_reset')) as Component;
      await btn_reset.click();
      await CommonFunc.sleep(1500);
      console.info('[maxDownRefresh_static_0100] END');
      done();
    });

    
    /*
     * @tc.number   maxDownRefresh_static_0200
     * @tc.name     maxDownRefresh_static_0200
     * @tc.desc     maxDownRefresh_static_0200
     * @tc.level    Level.LEVEL0
     */
it('maxDownRefresh_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxDownRefresh_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_out = await driver.findComponent(ON.id('maxPull_text_fu')) as Component;
      await btn_out.click();
      await CommonFunc.sleep(1500);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('maxPull_down_refresh');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("maxDownRefresh_static_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height / 6)).toInt(),
        (Math.round(left + width / 2)).toInt(), (Math.round(bottom - height / 6)).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onState_text');
      console.info("[maxDownRefresh_static_0200] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[maxDownRefresh_static_0200] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('start');
      let btn_reset = await driver.findComponent(ON.id('maxPull_text_reset')) as Component;
      await btn_reset.click();
      await CommonFunc.sleep(1500);
      console.info('[maxDownRefresh_static_0200] END');
      done();
    });

    
    /*
     * @tc.number   maxDownRefresh_static_0300
     * @tc.name     maxDownRefresh_static_0300
     * @tc.desc     maxDownRefresh_static_0300
     * @tc.level    Level.LEVEL0
     */
it('maxDownRefresh_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxDownRefresh_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_64 = await driver.findComponent(ON.id('maxPull_text_null')) as Component;
      await btn_64.click();
      await CommonFunc.sleep(1500);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('maxPull_down_refresh');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("maxDownRefresh_static_0300 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height / 6)).toInt(),
        (Math.round(left + width / 2)).toInt(), (Math.round(bottom - height / 6)).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onState_text');
      console.info("[maxDownRefresh_static_0300] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[maxDownRefresh_static_0300] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onRefreshing');
      let btn_reset = await driver.findComponent(ON.id('maxPull_text_reset')) as Component;
      await btn_reset.click();
      await CommonFunc.sleep(1500);
      console.info('[maxDownRefresh_static_0300] END');
      done();
    });

    
    /*
     * @tc.number   maxDownRefresh_static_0400
     * @tc.name     maxDownRefresh_static_0400
     * @tc.desc     maxDownRefresh_static_0400
     * @tc.level    Level.LEVEL0
     */
it('maxDownRefresh_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxDownRefresh_static_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_64 = await driver.findComponent(ON.id('maxPull_text_ude')) as Component;
      await btn_64.click();
      await CommonFunc.sleep(1500);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('maxPull_down_refresh');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("maxDownRefresh_static_0400 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.swipe((Math.round(left + width / 2)).toInt(), (Math.round(top + height / 6)).toInt(),
        (Math.round(left + width / 2)).toInt(), (Math.round(bottom - height / 6)).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onState_text');
      console.info("[maxDownRefresh_static_0400] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[maxDownRefresh_static_0400] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onRefreshing');
      let btn_reset = await driver.findComponent(ON.id('maxPull_text_reset')) as Component;
      await btn_reset.click();
      await CommonFunc.sleep(1500);
      console.info('[maxDownRefresh_static_0400] END');
      done();
    });
  })
}
