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

export default function listSwipeAction23Jsunit() {
  describe('listSwipeAction23Test', () => {
    beforeAll(async (): Promise<void> => {
      console.info("listSwipeAction23Test beforeEach start");

      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest23"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("listSwipeAction23Test  success pages " + JSON.stringify(pages));
        routerInstance.pushUrl(options)
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.error("push listTest23 page error: " + err);
      }
    });

    afterEach(async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeActionTest23 after each called");
      
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset23'));
      await CommonFunc.sleep(300);
      buttonReset!.click();
      await CommonFunc.sleep(2000);
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0220
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0220
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0220
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0220 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      
      let strJson = inspector.getInspectorByKey('lSwipe23Action0');
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0220] current component obj is: " +
        JSON.stringify(JSON.parseJsonElement(strJson)));

      let swipeComp23a = await driver.findComponent(ON.id('lSwipe23Action0'));
      let rect23a = await swipeComp23a!.getBounds();
      let displayId23a = await swipeComp23a!.getDisplayId();
      let width23a = rect23a.right - rect23a.left;

            await driver.swipeBetween(
        { x: (Math.round(rect23a.left + width23a / 2)).toInt(), y: (Math.round(rect23a.top +
          UIContext.resolveUIContext()!.vp2px(40))).toInt(), displayId: displayId23a },
        { x: (Math.round(rect23a.left + width23a / 2)).toInt(), y: (Math.round(rect23a.top +
          UIContext.resolveUIContext()!.vp2px(30))).toInt(), displayId: displayId23a }
      );
      await CommonFunc.sleep(4000);
      
      let textSwipeState = inspector.getInspectorByKey('swipe23State');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0220 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeState).getElement('$attrs')));
      expect(JSON.parseJsonElement(textSwipeState).getElement('$attrs').getString('content') == '0').assertFalse();
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0230
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0230
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0230
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0230 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      
      let strJson = inspector.getInspectorByKey('lSwipe23Action0');
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0230] current component obj is: " +
        JSON.stringify(JSON.parseJsonElement(strJson)));

      let swipeComp23b = await driver.findComponent(ON.id('lSwipe23Action0'));
      let rect23b = await swipeComp23b!.getBounds();
      let displayId23b = await swipeComp23b!.getDisplayId();
      let width23b = rect23b.right - rect23b.left;

            await driver.swipeBetween(
        { x: (Math.round(rect23b.left + width23b / 2)).toInt(), y: (Math.round(rect23b.top +
          UIContext.resolveUIContext()!.vp2px(100))).toInt(), displayId: displayId23b },
        { x: (Math.round(rect23b.left + width23b / 2)).toInt(), y: (Math.round(rect23b.top +
          UIContext.resolveUIContext()!.vp2px(50))).toInt(), displayId: displayId23b }
      );
      await CommonFunc.sleep(4000);
      
      let textSwipeState = inspector.getInspectorByKey('swipe23State');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0230 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeState).getElement('$attrs')));
      expect(JSON.parseJsonElement(textSwipeState).getElement('$attrs').getString('content')).assertEqual('1');
      done();
    });


    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0240
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0240
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0240
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0240', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0240 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      
      let strJson = inspector.getInspectorByKey('lSwipe23Action0');
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0240] current component obj is: " +
        JSON.stringify(JSON.parseJsonElement(strJson)));

      let swipeComp23c = await driver.findComponent(ON.id('lSwipe23Action0'));
      let rect23c = await swipeComp23c!.getBounds();
      let displayId23c = await swipeComp23c!.getDisplayId();
      let width23c = rect23c.right - rect23c.left;

            await driver.swipeBetween(
        { x: (Math.round(rect23c.left + width23c / 2)).toInt(), y: (Math.round(rect23c.top +
          UIContext.resolveUIContext()!.vp2px(150))).toInt(), displayId: displayId23c },
        { x: (Math.round(rect23c.left + width23c / 2)).toInt(), y: (Math.round(rect23c.top +
          UIContext.resolveUIContext()!.vp2px(5))).toInt(), displayId: displayId23c }
      );
      await CommonFunc.sleep(4000);
      
      let textSwipeState = inspector.getInspectorByKey('swipe23State');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0240 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeState).getElement('$attrs')));
      expect(JSON.parseJsonElement(textSwipeState).getElement('$attrs').getString('content')).assertEqual('2');
      done();
    });


  })
}
