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

export default function ListMonopolize() {
  describe('ListMonopolize', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12None.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      console.info("ListMonopolize beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ListMonopolize state pages:" + JSON.stringify(pages));
        if (!("listMonopolize" == pages.name)) {
          console.info("get  ListMonopolize pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/customGestureTest/listMonopolize"
          })
          await CommonFunc.sleep(2000);
          // console.info("push ListMonopolize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListMonopolize page error:" + err);
      }
      console.info("ListMonopolize foreEach end");
      //done();
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ListMonopolize after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_MONOPOLIZE_0110_ListMonopolize_001
     * @tc.desc monopolize list mouseScroll test
     * @tc.level Level 0
     * @tc.type
     */

    it('ListMonopolize_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListMonopolize_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let column = await (scrollBar?.scrollSearch(ON.id('column')) as Promise<Component | null>);

      await (column?.click() as Promise<void>);
      await driver.mouseScroll({x: Math.round(AppStorage.get<number>("winLeft", Type.from<number>()) as number + uiContext.vp2px(200)), y: Math.round(AppStorage.get<number>("winTop", Type.from<number>()) as number  + uiContext.vp2px(200))}, true, 30, 2072, 20);
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('listText');
      console.info("[ListMonopolize_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content') == 'TapGesture onActionEnd success').assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[ListMonopolize_001] END');
      done();
    });
  })
}
