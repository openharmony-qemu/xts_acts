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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'

export default function UIContextDragControllerTest() {

  describe('UIContextDragControllerTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12None.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/UIContextDragController',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get UIContextDragController state pages: " + JSON.stringify(pages));
        if (!("UIContextDragController" == pages.name)) {
          console.info("get UIContextDragController state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push UIContextDragController success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextDragController page error: " + err);
        expect().assertFail();
      }
      //done();
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("UIContextDragController after each called");
    });

    /**
     * @tc.number    UIContextDragController_0010
     * @tc.name      UIContextDragController_0010
     * @tc.desc      api: UIContext DragController
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIContextDragController_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('UIContextDragController_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let grid = await driver.findComponent(ON.id('UIContextDragController1'));
      let button = await driver.findComponent(ON.id('UIContextDragController2'));
      await (grid?.dragTo(button!) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('UIContextDragController2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[UIContextDragController_0010] dragPreviewOptions: " + JSON.stringify(obj));
      console.info("[UIContextDragController_0010] dragPreviewOptions: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('label')).assertEqual('Drag Success');
      console.info('[UIContextDragController_0010] END');
      done();
    });
  })
}
