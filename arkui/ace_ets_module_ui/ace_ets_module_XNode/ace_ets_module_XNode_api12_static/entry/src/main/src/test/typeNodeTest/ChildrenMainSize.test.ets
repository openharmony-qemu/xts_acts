'use static';
/*
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
import { describe, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function typeNodechildrenMainSizeTest() {
  describe('typeNodechildrenMainSizeTest', () => {
    beforeEach(async () : Promise<void> => {
      console.info("typeNodechildrenMainSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/typeNode/ChildrenMainSize",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get typeNodechildrenMainSizeTest state pages: " + JSON.stringify(pages));
        if (!("ChildrenMainSize" == pages.name)) {
          console.info("get typeNodechildrenMainSizeTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push typeNodechildrenMainSizeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push typeNodechildrenMainSizeTest page error: " + err);
           expect().assertFail();
      }
      //done();
    });

    
    



    /**
     * @tc.number   childrenMainSizeTest_static_0100
     * @tc.name     childrenMainSizeTest_static_0100
     * @tc.desc     childrenMainSizeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('childrenMainSizeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('childrenMainSizeTest_0100 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button1: Component|null = await driver.findComponent(ON.id('ChildernMainSize_1'));
      try {
      await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button2: Component|null = await driver.findComponent(ON.id('ChildernMainSize_'));
      try {
      await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('ChildernMainSize_');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[childrenMainSizeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('100');
      console.info('[childrenMainSizeTest_0100] END');
      done();
    });
    
    



    /**
     * @tc.number   childrenMainSizeTest_static_0200
     * @tc.name     childrenMainSizeTest_static_0200
     * @tc.desc     childrenMainSizeTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('childrenMainSizeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('childrenMainSizeTest_0100 START');
      let driver =  Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button1 = await driver.findComponent(ON.id('ChildernMainSize_2'));
      try {
      await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button2 = await driver.findComponent(ON.id('ChildernMainSize_1'));
      try {
      await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('ChildernMainSize_');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[childrenMainSizeTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[childrenMainSizeTest_0100] component obj.label is: " + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('100');
      console.info('[childrenMainSizeTest_0100] END');
      done();
    });
  })
}