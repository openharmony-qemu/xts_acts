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
export default function setMarkNodeGroupTest() {
  describe('setMarkNodeGroupTest', () => {
    beforeEach(async () : Promise<void> => {
      console.info("setMarkNodeGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/renderNode/setMarkNodeGroup",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get setMarkNodeGroupTest state pages: " + JSON.stringify(pages));
        if (!("setMarkNodeGroup" == pages.name)) {
          console.info("get setMarkNodeGroupTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push setMarkNodeGroupTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setMarkNodeGroupTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    
    



    /**
     * @tc.number   setMarkNodeGroupTest_static_0010
     * @tc.name     setMarkNodeGroupTest_static_0010
     * @tc.desc     setMarkNodeGroupTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('setMarkNodeGroupTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('setMarkNodeGroupTest_0010 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(500);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('SetMarkNodeGroup_id'));
      try {
      await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('SetMarkNodeGroup_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[setMarkNodeGroupTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('true');
      console.info('[setMarkNodeGroupTest_0010] END');
      done();
    }); 
  })
}