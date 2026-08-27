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
export default function typeNodeListItemTest() {
  describe('typeNodeListItemTest', () => {
    beforeEach(async () : Promise<void> => {
      console.info("typeNodeListItemTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/typeNode/ListItem",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get typeNodeListItemTest state pages: " + JSON.stringify(pages));
        if (!("ListItem" == pages.name)) {
          console.info("get typeNodeListItemTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push typeNodeListItemTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push typeNodeListItemTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    
    



    /**
     * @tc.number   ListItemTest_static_0100
     * @tc.name     ListItemTest_static_0100
     * @tc.desc     ListItemTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ListItemTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ListItemTest_0100 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button: Component|null = await driver.findComponent(ON.id('TypeNode_ListItem'));
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
      let strJson: string = inspector.getInspectorByKey('TypeNode_ListItem');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListItemTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('ListItem');
      console.info('[ListItemTest_0100] END');
      done();
    });
  })
}