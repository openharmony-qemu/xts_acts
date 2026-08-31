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
import { Driver, ON, Component, MouseButton, UiWindow, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
const uiContext = new UIContext();


export default function btnClick() {
  describe('btnClick', () => {
    beforeEach(async ():Promise<void> => {
      console.info("btnClick beforeEach start");
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get btnClick state pages:" + JSON.stringify(pages));
        if (!("gestureClick" == pages.name)) {
          console.info("get  btnClick pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl({
          //   url: "MainAbility/pages/customGestureTest/gestureClick"
          // })
          router.pushUrl({
            url: "MainAbility/pages/customGestureTest/gestureClick"
          })
          await CommonFunc.sleep(2000);
          // console.info("push btnClick page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push btnClick page error:" + err);
      }
      console.info("btnClick foreEach end");
      // done();
    });
    afterEach(async () => {
      try {
            await CommonFunc.sleep(1000);
            console.info("btnClick after each called");
      } catch (err) {
        console.error("afterEach error: " + err);
      }
    });

    

    
    
/**
     * @tc.number   btnClick_static_001
     * @tc.name     btnClick_static_001
     * @tc.desc     btnClick_static_001
     * @tc.level    Level.LEVEL0
     */
it('btnClick_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[btnClick_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id("gesture_click_button"));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey("gesture_click_text");
      await CommonFunc.sleep(200);
      console.info("[btnClick_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('点击事件成功响应--GestureType为CLICK');
      await CommonFunc.sleep(1000);
      console.info('[btnClick_001] END');
      done();
    });


  })
}