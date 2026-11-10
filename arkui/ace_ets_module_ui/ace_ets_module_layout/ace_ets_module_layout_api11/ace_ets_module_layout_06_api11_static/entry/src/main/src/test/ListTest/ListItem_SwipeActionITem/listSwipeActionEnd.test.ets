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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '@ohos/hypium-static/src/main/indexStatic';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';

import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function listSwipeActionEndJsunit() {
  describe('listSwipeActionEndTest', ()=> {
    beforeAll(async (): Promise<void> => {
      console.info("listSwipeActionEndTest beforeEach start");

      let options : router.RouterOptions = {
        url : "MainAbility/pages/List/ListItem_SwipeActionItem/listEndTest"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("listSwipeActionEndTest success pages " + JSON.stringify(pages));
        routerInstance.pushUrl(options)
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("push listSwipeActionEndTest page error: " + err);
      }
    });

    afterEach(async (done: () => void): Promise<void>=> {
      await CommonFunc.sleep(1000);
      console.info("listSwipeActionEndTest after each called");

      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btresetEnd'));
      await CommonFunc.sleep(200);
      buttonReset!.click();
      await CommonFunc.sleep(2000);
      done();

    });





/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0080
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0080
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0080
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0080 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0080 driver' + driver);
      await CommonFunc.sleep(500);

      let swipeComponent = await driver.findComponent(ON.id('lSwipeActionEnd0'));
      let rect = await swipeComponent!.getBounds();
      let displayId = await swipeComponent!.getDisplayId();
      let width = rect.right - rect.left;
      let height = rect.bottom - rect.top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0080 value is" +
        rect.left + " --" + rect.top);

      await driver.swipeBetween(
        { x: (Math.round(rect.left + UIContext.resolveUIContext()!.vp2px(100))).toInt(),
          y: (Math.round(rect.top + height / 2)).toInt(), displayId: displayId },
        { x: (Math.round(rect.left + UIContext.resolveUIContext()!.vp2px(90))).toInt(),
          y: (Math.round(rect.top + height / 2)).toInt(), displayId: displayId }
      );
      await CommonFunc.sleep(5000);

      let textSwipeState = inspector.getInspectorByKey('swipeStateEnd');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0080 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeState).getElement('$attrs')));
      expect(JSON.parseJsonElement(textSwipeState).getElement('$attrs').getString('content') == '0').assertFalse();
      done();
    });





/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0090
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0090
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0090
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090 driver' + driver);
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('lSwipeActionEnd0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090] current component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));

      let swipeComponent = await driver.findComponent(ON.id('lSwipeActionEnd0'));
      let rect = await swipeComponent!.getBounds();
      let displayId = await swipeComponent!.getDisplayId();
      let width = rect.right - rect.left;
      let height = rect.bottom - rect.top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0090 value is" +
        rect.left + " --" + rect.top);

      await driver.swipeBetween(
        { x: (Math.round(rect.left + UIContext.resolveUIContext()!.vp2px(150))).toInt(),
          y: (Math.round(rect.top + height / 2)).toInt(), displayId: displayId },
        { x: (Math.round(rect.left + UIContext.resolveUIContext()!.vp2px(50))).toInt(),
          y: (Math.round(rect.top + height / 2)).toInt(), displayId: displayId }
      );
      await CommonFunc.sleep(4000);

      let textSwipeState = inspector.getInspectorByKey('swipeStateEnd');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeState).getElement('$attrs')));
      expect(JSON.parseJsonElement(textSwipeState).getElement('$attrs').getString('content')).assertEqual('1');
      done();
    });





/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0100
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0100
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('lSwipeActionEnd0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0100] current component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));

      let swipeComponent = await driver.findComponent(ON.id('lSwipeActionEnd0'));
      let rect = await swipeComponent!.getBounds();
      let displayId = await swipeComponent!.getDisplayId();
      let width = rect.right - rect.left;
      let height = rect.bottom - rect.top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0100 value is" +
        rect.left + " --" + rect.top);

      await driver.swipeBetween(
        { x: (Math.round(rect.right - UIContext.resolveUIContext()!.vp2px(20))).toInt(),
          y: (Math.round(rect.top + height / 2)).toInt(), displayId: displayId },
        { x: (Math.round(rect.left + UIContext.resolveUIContext()!.vp2px(2))).toInt(),
          y: (Math.round(rect.top + height / 2)).toInt(), displayId: displayId }
      );
      await CommonFunc.sleep(5000);

      let textSwipeState = inspector.getInspectorByKey('swipeStateEnd');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0100 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeState).getElement('$attrs')));
      expect(JSON.parseJsonElement(textSwipeState).getElement('$attrs').getString('content')).assertEqual('2');
      done();
    });


  })
}
