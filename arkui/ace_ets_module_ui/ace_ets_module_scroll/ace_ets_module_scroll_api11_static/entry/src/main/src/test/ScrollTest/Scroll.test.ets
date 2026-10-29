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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

let displayID: number = AppStorage.get<number>('displayID') ? AppStorage.get<number>('displayID') as number : 0;
export default function ScrollTest() {
  describe('ScrollTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ScrollTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/Scroll',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get ScrollTest state pages: " + JSON.stringify(pages));
        if (!("Scroll" == pages.name)) {
          console.info("get ScrollTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ScrollTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollTest page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   ScrollTest_static_001
     * @tc.name     ScrollTest_static_001
     * @tc.desc     ScrollTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ScrollTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ScrollTest_static_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info("[ScrollTest_static_001] uiContext is : " + uiContext);
      let scrollComp = await driver.findComponent(ON.id('scrollText'));
      let scrollRect = await scrollComp!.getBounds();
      let scrollDisplayId = await scrollComp!.getDisplayId();
      await driver.swipeBetween(
        { x: (Math.round(scrollRect.left + uiContext.vp2px(67))).toInt(),
          y: (Math.round(scrollRect.top + uiContext.vp2px(200))).toInt(), displayId: scrollDisplayId },
        { x: (Math.round(scrollRect.left + uiContext.vp2px(67))).toInt(),
          y: (Math.round(scrollRect.top + uiContext.vp2px(133))).toInt(), displayId: scrollDisplayId }
      );
      await CommonFunc.sleep(1000);
      console.info("[ScrollTest_static_001] swipe success");
      let strJson1 = inspector.getInspectorByKey('scrollText');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[ScrollTest_static_001] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('true');

      console.info('[ScrollTest_static_001] END');
      done();
    });
  })
}
