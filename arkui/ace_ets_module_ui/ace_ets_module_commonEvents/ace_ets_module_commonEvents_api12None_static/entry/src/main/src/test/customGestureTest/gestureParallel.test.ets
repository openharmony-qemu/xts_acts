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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
const uiContext = new UIContext();

export default function gestureParallelTest() {
  describe('gestureParallelTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12None.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {

      console.info("gestureParallelTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gestureParallelTest state pages:" + JSON.stringify(pages));
        if (!("gestureParallel" == pages.name)) {
          console.info("get  gestureParallelTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/customGestureTest/gestureParallel"
          })
          await CommonFunc.sleep(2000);
          // console.info("push gestureParallelTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureParallelTest page error:" + err);
      }
      console.info("gestureParallelTest foreEach end");
      //done();
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("gestureParallelTest after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_JUDGE_0250_gestureParallelTest_001
     * @tc.desc gesture Parallel test
     * @tc.level Level 0
     * @tc.type
     */

    it('gestureParallelTest_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[gestureParallelTest_001] START');
      let str1 = inspector.getInspectorByKey("parallelGestureKey");
      let obj: Record<string, Object> = JSON.parse<Object>(str1, Type.of(new String() as Object)) as Record<string, Object>;
      console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
      // get column left and top on screen
      let rectInfo: Array<Array<number>> = JSON.parse<Object>('[' + obj["getElement('$rect')"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      CommonFunc.rect_left =
        Number(Number(rectInfo[0][0] ?? 0) + Number(AppStorage.get<number>("winLeft", Type.from<number>()) ?? 0));
      CommonFunc.rect_top =
        Number(Number(rectInfo[0][1] ?? 0) + Number(AppStorage.get<number>("winTop", Type.from<number>()) ?? 0));
      console.info("rect_left = " + CommonFunc.rect_left + "CommonFunc.rect_top = " + CommonFunc.rect_top);
      let driver = Driver.create();
      await driver.longClick(Math.round(CommonFunc.rect_left + uiContext.vp2px(66.66)), Math.round(CommonFunc.rect_top + uiContext.vp2px(133.33)));
      await driver.doubleClick(Math.round(CommonFunc.rect_left + uiContext.vp2px(66.66)), Math.round(CommonFunc.rect_top + uiContext.vp2px(133.33)));
      let strJson1 = inspector.getInspectorByKey("longPressMsg");
      await CommonFunc.sleep(200);
      console.info("[gestureParallelTest_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('LongPress onActionEnd');
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey("tapGestureMsg");
      await CommonFunc.sleep(200);
      console.info("[gestureParallelTest_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('tapGesture onAction');
      await CommonFunc.sleep(1000);
      console.info('[gestureParallelTest_001] END');
      done();
    });
  })
}
