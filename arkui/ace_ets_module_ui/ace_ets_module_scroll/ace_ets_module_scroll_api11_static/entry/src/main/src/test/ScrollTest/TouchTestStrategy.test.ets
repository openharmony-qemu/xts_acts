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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function TouchTestStrategy() {
  describe('TouchTestStrategy', () => {
    beforeEach(async (): Promise<void> => {
      console.info("TouchTestStrategy beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/TouchTestStrategy',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get TouchTestStrategy state pages: " + JSON.stringify(pages));
        if (!("TouchTestStrategy" == pages.name)) {
          console.info("get TouchTestStrategy state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TouchTestStrategy success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TouchTestStrategy page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   TouchTestStrategy_static_0100
     * @tc.name     TouchTestStrategy_static_0100
     * @tc.desc     TouchTestStrategy_static_0100
     * @tc.level    Level.LEVEL0
     */
it('TouchTestStrategy_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('TouchTestStrategy_static_0100 START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let touchComp = await driver.findComponent(ON.id('border_TouchStrategy'));
        let touchRect = await touchComp!.getBounds();
        let touchDisplayId = await touchComp!.getDisplayId();
        await driver.swipeBetween(
          { x: (Math.round(touchRect.left + uiContext.vp2px(100))).toInt(),
            y: (Math.round(touchRect.top + uiContext.vp2px(80))).toInt(), displayId: touchDisplayId },
          { x: (Math.round(touchRect.left + uiContext.vp2px(100))).toInt(),
            y: (Math.round(touchRect.top + uiContext.vp2px(10))).toInt(), displayId: touchDisplayId }
        );
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('listText_TouchStrategy');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[TouchTestStrategy_static_0100] component obj is: " + JSON.stringify(obj));
        console.info("[TouchTestStrategy_static_0100] text: " +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(obj.getElement('$attrs').getString('content')).assertEqual('Test Text is completely invisible');
        console.info('[Touch_static_0100] END');
        done();
      } catch (error) {
        console.error('[TouchTestStrategy_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

  })
}