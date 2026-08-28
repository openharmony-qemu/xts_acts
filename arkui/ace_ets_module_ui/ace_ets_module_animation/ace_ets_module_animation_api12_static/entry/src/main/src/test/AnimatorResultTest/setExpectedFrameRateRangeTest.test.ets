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
import { Component, Driver, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function setExpectedFrameRateRangeTest() {
  describe('setExpectedFrameRateRangeTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("setExpectedFrameRateRangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AnimatorResult/setExpectedFrameRateRange",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setExpectedFrameRateRangeTest state pages:" + JSON.stringify(pages));
        if (!("setExpectedFrameRateRange" == pages.name)) {
          console.info("get setExpectedFrameRateRangeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setExpectedFrameRateRangeTest page error:" + err);
      }
      console.info("setExpectedFrameRateRangeTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      console.info("setExpectedFrameRateRangeTest after each called");
    });


/**
     * @tc.number   setExpectedFrameRateRangeTest_static_001
     * @tc.name     setExpectedFrameRateRangeTest_static_001
     * @tc.desc     setExpectedFrameRateRangeTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('setExpectedFrameRateRangeTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[setExpectedFrameRateRangeTest_001] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let create: Component | null;
      try {
        create = await (scrollBar?.scrollSearch(ON.id('create')) as Promise<Component>);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      try {
        await (create?.click() as Promise<void>);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      let play: Component | null;
      try {
        play = await (scrollBar?.scrollSearch(ON.id('play')) as Promise<Component>);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      try {
        await (play?.click() as Promise<void>);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(3500);
      } catch (err) {
        console.info('setExpectedFrameRateRangeTest err: ' + JSON.stringify(err));
      }
      let min = inspector.getInspectorByKey('min');
      let max = inspector.getInspectorByKey('max');
      let strJsonMin = JSON.parseJsonElement(min)
      let strJsonMax = JSON.parseJsonElement(max)
      console.info('min: ' + strJsonMin.getElement('$attrs').getString('content'));
      console.info('max: ' + strJsonMax.getElement('$attrs').getString('content'));
      expect(strJsonMin.getElement('$attrs').getString('content')).assertEqual('0');
      expect(strJsonMax.getElement('$attrs').getString('content')).assertEqual('120');
      console.info('[setExpectedFrameRateRangeTest_001] END');
      done();
    });
  })
}
