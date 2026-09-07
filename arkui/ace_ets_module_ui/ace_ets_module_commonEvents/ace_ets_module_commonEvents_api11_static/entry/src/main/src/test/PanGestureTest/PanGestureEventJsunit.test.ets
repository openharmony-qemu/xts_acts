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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function PanGestureEventJsunit() {
  describe('PanGestureEventJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("PanGestureEventJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/PanGestureEvent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PanGestureEventJsunit state pages:" + JSON.stringify(pages));
        if (!("PanGestureEvent" == pages.name)) {
          console.info("get PanGestureEventJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PanGestureEventJsunit page error:" + err);
      }
      console.info("PanGestureEventJsunit beforeEach end");
    });


    
    /**
     * @tc.number   PanGestureEventJsunit_static_0100
     * @tc.name     PanGestureEventJsunit_static_0100
     * @tc.desc     PanGestureEventJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PanGestureEventJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0100] START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureEvent_column_id');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await ((driver.swipe(Math.round(left + 100).toInt(), Math.round((top + bottom) / 2).toInt(),
        Math.round(right - 100).toInt(), Math.round((top + bottom) / 2).toInt())) as Promise<void>);
      await CommonFunc.sleep(2000);
      let textComponent = await driver.findComponent(ON.id('velocityX'));
      let text = await (textComponent?.getText() as Promise<string>)
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0100] END');
      done();
    });


    
    /**
     * @tc.number   PanGestureEventJsunit_static_0200
     * @tc.name     PanGestureEventJsunit_static_0200
     * @tc.desc     PanGestureEventJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('PanGestureEventJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0200] START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureEvent_column_id');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await ((driver.swipe(Math.round(left + 100).toInt(), Math.round((top + bottom) / 2).toInt(),
        Math.round(right - 100).toInt(), Math.round((top + bottom) / 2).toInt())) as Promise<void>);
      await CommonFunc.sleep(2000);
      let textComponent = await driver.findComponent(ON.id('velocityY'));
      let text = await (textComponent?.getText() as Promise<string>)
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0200] END');
      done();
    });


    
    /**
     * @tc.number   PanGestureEventJsunit_static_0300
     * @tc.name     PanGestureEventJsunit_static_0300
     * @tc.desc     PanGestureEventJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('PanGestureEventJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0300] START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureEvent_column_id');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await ((driver.swipe(Math.round(left + 100).toInt(), Math.round((top + bottom) / 2).toInt(),
        Math.round(right - 100).toInt(), Math.round((top + bottom) / 2).toInt())) as Promise<void>);
      await CommonFunc.sleep(2000);
      let textComponent = await driver.findComponent(ON.id('velocity'));
      let text = await (textComponent?.getText() as Promise<string>)
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0300] END');
      done();
    });
  })
}
