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
import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function setForegroundColor() {
  describe('setForegroundColor', () => {
    beforeEach(async (): Promise<void> => {
      console.info("setForegroundColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/setForegroundColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setForegroundColor state pages:" + JSON.stringify(pages));
        if (!("setForegroundColor" == pages.name)) {
          console.info("get setForegroundColor pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setForegroundColor page error:" + err);
      }
      console.info("setForegroundColor beforeEach end");
    });


    
    
/**
     * @tc.number   setForegroundColor_static_0100
     * @tc.name     setForegroundColor_static_0100
     * @tc.desc     setForegroundColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('setForegroundColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('setForegroundColor_0100 START');
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('TouchParent_id'))!;
      let text: Component | null = await driver.findComponent(ON.id('setForegroundColor_id'))!;
      await (button?.dragTo(text!) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setForegroundColor_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[setForegroundColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[setForegroundColor_0100] title: " + JSON.stringify(obj.getString('backgroundColor')));
      expect(obj.getString('backgroundColor')).assertEqual('#FFFFC0CB');
      console.info('[setForegroundColor_0100] END');
      done();
    });


    
    
/**
     * @tc.number   setForegroundColor_static_0200
     * @tc.name     setForegroundColor_static_0200
     * @tc.desc     setForegroundColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('setForegroundColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('setForegroundColor_0200 START');
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('TouchParent_id'))!;
      let text: Component | null = await driver.findComponent(ON.id('setForegroundColor_id'))!;
      await (button?.dragTo(text!) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setForegroundColor_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[setForegroundColor_0200] component obj is: " + JSON.stringify(obj));
      console.info("[setForegroundColor_0200] title: " + JSON.stringify(obj.getString('backgroundColor')));
      expect(obj.getString('backgroundColor')).assertEqual('#FFFFC0CB');
      console.info('[setForegroundColor_0200] END');
      done();
    });
  })
}

