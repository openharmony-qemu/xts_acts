'use static';
/*
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
import { describe, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton,Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function commonEventTest1() {
  describe('commonEventTest1', () => {
    beforeEach(async (): Promise<void> => {
      console.info("commonEventTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/commonEventTest1',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get commonEventTest1 state pages:" + JSON.stringify(pages));
        if (!("commonEventTest1" == pages.name)) {
          console.info("get commonEventTest1 pages.name:" + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push commonEventTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonEventTest1 page error:" + err);
      }
      console.info("commonEventTest1 beforeEach end");
      //done();
    });
    afterEach(async () => {
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      console.info("commonEventTest1 after each called");
    });
    
    



    /**
     * @tc.number   commonEventTest1_static_0100
     * @tc.name     commonEventTest1_static_0100
     * @tc.desc     commonEventTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('commonEventTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('commonEventTest1_static_0100 START');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let node: Component | null = await driver.findComponent(ON.id('commonEventTest1_node'));
      let point = await (node?.getBoundsCenter() as Promise<Point>);
      try {
      await driver.mouseClick({x:Math.round(point.x).toInt(), y:Math.round(point.y).toInt()}, MouseButton.MOUSE_BUTTON_LEFT);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let btn1 = await driver.findComponent(ON.id('commonEventTest1_getOnMouse'));
      await (btn1?.click() as Promise<void>)
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('commonEventTest1_text1');
      let obj1 = JSON.parseJsonElement(strJson1);
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      console.info("[commonEventTest1_static_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('setOnMouseFrameNode')
      console.info('commonEventTest1_static_0100 END');
      done();
    });
    
    



    /**
     * @tc.number   commonEventTest1_static_0200
     * @tc.name     commonEventTest1_static_0200
     * @tc.desc     commonEventTest1_static_0200
     * @tc.level    Level.LEVEL0
     */
it('commonEventTest1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('commonEventTest1_static_0200 START');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let btn1 = await driver.findComponent(ON.id('commonEventTest1_changeSize'));
      await (btn1?.click() as Promise<void>)
      console.info("[commonEventTest1_static_0200] btn1");
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let btn2 = await driver.findComponent(ON.id('commonEventTest1_getOnSizeChange'));
      await (btn2?.click() as Promise<void>)
      console.info("[commonEventTest1_static_0200] btn2");
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('commonEventTest1_text2');
      let obj1 = JSON.parseJsonElement(strJson1);
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      console.info("[commonEventTest1_static_0200] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('setOnSizeChangeFrameNode')
      console.info('commonEventTest1_static_0200 END');
      done();
    });
  })
}