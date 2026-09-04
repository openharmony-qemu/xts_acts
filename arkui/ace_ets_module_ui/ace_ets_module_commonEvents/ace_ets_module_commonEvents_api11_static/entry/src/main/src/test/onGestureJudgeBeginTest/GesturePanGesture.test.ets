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
export default function GesturePanGesture() {
  describe('GesturePanGesture', () => {
    beforeEach(async (): Promise<void> => {
      console.info("GesturePanGesture beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onGestureJudgeBegin/GesturePanGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GesturePanGesture state pages:" + JSON.stringify(pages));
        if (!("GesturePanGesture" == pages.name)) {
          console.info("get GesturePanGesture pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GesturePanGesture page error:" + err);
      }
      console.info("GesturePanGesture beforeEach end");
    });


    
    /**
     * @tc.number   GesturePanGesture_static_0100
     * @tc.name     GesturePanGesture_static_0100
     * @tc.desc     GesturePanGesture_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GesturePanGesture_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GesturePanGesture_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('GesturePanGesture'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GesturePanGesture');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GesturePanGesture_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GesturePanGesture_0100] title: " + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('Gesture is PAN_GESTURE');
      console.info('[GesturePanGesture_0100] END');
      done();
    });


  })
}

