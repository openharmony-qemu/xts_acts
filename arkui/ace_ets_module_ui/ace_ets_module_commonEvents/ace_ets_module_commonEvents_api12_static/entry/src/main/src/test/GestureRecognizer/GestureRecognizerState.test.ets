'use static';
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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
const uiContext = new UIContext();


export default function GestureRecognizerState() {
  describe('GestureRecognizerState', () => {
    beforeEach(async ():Promise<void> => {
      console.info("GestureRecognizerState beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/GestureRecognizerState',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get GestureRecognizerState state pages:" + JSON.stringify(pages));
        if (!("GestureRecognizerState" == pages.name)) {
          console.info("get GestureRecognizerState pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push GestureRecognizerState page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureRecognizerState page error:" + err);
      }
      console.info("GestureRecognizerState beforeEach end");
      //done();
    });

    afterEach(async () => {
      try {
            await CommonFunc.sleep(1000);
            console.info("GestureRecognizerState after each called");
      } catch (err) {
        console.error("afterEach error: " + err);
      }
    });


    
    
    
/**
     * @tc.number   GestureRecognizerState_static_0100
     * @tc.name     GestureRecognizerState_static_0100
     * @tc.desc     GestureRecognizerState_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GestureRecognizerState_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GestureRecognizerState_0100 START');
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('GestureRecognizerState_text');
      await CommonFunc.sleep(2000);
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[GestureRecognizerState_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('GestureRecognizerState');

      console.info('GestureRecognizerState_0100 END');
      done();
    });



  })
}