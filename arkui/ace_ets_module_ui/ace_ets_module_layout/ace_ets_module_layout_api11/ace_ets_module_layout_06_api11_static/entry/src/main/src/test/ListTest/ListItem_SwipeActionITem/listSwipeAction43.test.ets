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

export default function listSwipeAction43Jsunit() {
  describe('listSwipeAction43Test', () => {
    beforeAll(async (): Promise<void> => {
      console.info("listSwipeAction43Test beforeEach start");

      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest43"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("listSwipeAction43Test  success pages " + JSON.stringify(pages));
        routerInstance.pushUrl(options)
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.error("push listTest15 page error: " + err);
      }
    });

    afterEach(async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeActionTest15 after each called");
      
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset43'));
      await driverReset.delayMs(300);
      buttonReset!.click();
      await CommonFunc.sleep(1000);
      done();

    });

    
    
    



/**
     * @tc.number   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0430
     * @tc.name     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0430
     * @tc.desc     SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0430
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0430', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0430 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      
      let strJson = inspector.getInspectorByKey('lSwipe43Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0430] current component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));

      let swipeComp43 = await driver.findComponent(ON.id('lSwipe43Action0'));
      let rect43 = await swipeComp43!.getBounds();
      let displayId43 = await swipeComp43!.getDisplayId();
      let height43 = rect43.bottom - rect43.top;

      await driver.swipeBetween(
        { x: (Math.round(rect43.left +
          UIContext.resolveUIContext()!.vp2px(10))).toInt(),
          y: (Math.round(rect43.top + height43 / 2)).toInt(), displayId: displayId43 },
        { x: (Math.round(rect43.left +
          UIContext.resolveUIContext()!.vp2px(100))).toInt(),
          y: (Math.round(rect43.top + height43 / 2)).toInt(), displayId: displayId43 }
      );
      await CommonFunc.sleep(5000);
      
      let driver2 = Driver.create();
      await CommonFunc.sleep(500);
      let button2 = await driver2.findComponent(ON.id('bt43'));
      await CommonFunc.sleep(300);
      button2!.click();
      await CommonFunc.sleep(1500);

      
      let textSwipeState = inspector.getInspectorByKey('swipe43Finish');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_static_0430 json is ' + JSON.stringify(JSON.parseJsonElement(textSwipeState).getElement('$attrs')));
      expect(JSON.parseJsonElement(textSwipeState).getElement('$attrs').getString('content')).assertEqual('value is 1');
      done();
    });


  })
}
