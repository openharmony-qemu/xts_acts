'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function onScrollIndexFlow2() {
  describe('onScrollIndexFlow2', () => {
    beforeEach(async (): Promise<void> => {
      console.info("onScrollIndexFlow2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/onScrollIndexFlow2",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get onScrollIndexFlow2 state pages:" + JSON.stringify(pages));
        if (!("onScrollIndexFlow2" == pages.name)) {
          console.info("get onScrollIndexFlow2 pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onScrollIndexFlow2 page error:" + err);
      }
      console.info("onScrollIndexFlow2 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onScrollIndexFlow2 after each called");
    });

    
    
/**
     * @tc.number   onScrollIndexFlow2_static_0100
     * @tc.name     onScrollIndexFlow2_static_0100
     * @tc.desc     onScrollIndexFlow2_static_0100
     * @tc.level    Level.LEVEL1
     */
it('onScrollIndexFlow2_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[onScrollIndexFlow2_static_0100] START');
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let swipeComp = await driver.findComponent(ON.id('water_onIndex'));
        let rect = await swipeComp!.getBounds();
        let displayId = await swipeComp!.getDisplayId();
        let height = rect.bottom - rect.top;
        let width = rect.right - rect.left;
        let centerX = (Math.round(rect.left + width / 2)).toInt();
        let startY = (Math.round(rect.top + height * 0.7)).toInt();
        let endY = (Math.round(rect.top + height * 0.2)).toInt();
        console.info("[onScrollIndexFlow2_static_0100] rect left=" + rect.left + " right=" + rect.right +
          " top=" + rect.top + " bottom=" + rect.bottom + " displayId=" + displayId);
        console.info("[onScrollIndexFlow2_static_0100] swipe from (" + centerX + "," + startY +
          ") to (" + centerX + "," + endY + ") displayId=" + displayId);
        await CommonFunc.sleep(1000);
        await driver.swipeBetween(
          { x: centerX, y: startY, displayId: displayId },
          { x: centerX, y: endY, displayId: displayId }
        );
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('onScrollIndex_flow');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[onScrollIndexFlow2_static_0100] component obj is: " + JSON.stringify(obj));
        console.info("[onScrollIndexFlow2_static_0100] content obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(obj.getElement('$attrs').getString('content')).assertEqual('onScrollIndex:succ5');
        console.info('[onScrollIndexFlow2_static_0100] END');
        done();
      } catch (error) {
        console.error('[onScrollIndexFlow2_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
