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

export default function GestureRotationGesture() {
  describe('GestureRotationGesture', () => {
    beforeEach(async (): Promise<void> => {
      console.info("GestureRotationGesture beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onGestureJudgeBegin/GestureRotationGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GestureRotationGesture state pages:" + JSON.stringify(pages));
        if (!("GestureRotationGesture" == pages.name)) {
          console.info("get GestureRotationGesture pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GestureRotationGesture page error:" + err);
      }
      console.info("GestureRotationGesture beforeEach end");
    });


    
    /**
     * @tc.number   GestureRotationGesture_static_0100
     * @tc.name     GestureRotationGesture_static_0100
     * @tc.desc     GestureRotationGesture_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GestureRotationGesture_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GestureRotationGesture_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('GestureRotationGesture'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('GestureRotationGesture');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GestureRotationGesture_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GestureRotationGesture_0100] title: " +
      obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('Gesture is ROTATION_GESTURE');
      console.info('[GestureRotationGesture_0100] END');
      done();
    });


  })
}

