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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
export default function APIgetFrameNodeByUniqueId() {
  describe('APIgetFrameNodeByUniqueId', () => {
    beforeEach(async (): Promise<void> => {
      console.info("APIgetFrameNodeByUniqueId beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/MeasureSize/APIgetFrameNodeByUniqueId',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get APIgetFrameNodeByUniqueId state pages:" + JSON.stringify(pages));
        if (!("APIgetFrameNodeByUniqueId" == pages.name)) {
          console.info("get APIgetFrameNodeByUniqueId pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push APIgetFrameNodeByUniqueId page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIgetFrameNodeByUniqueId page error:" + err);
      }
      console.info("APIgetFrameNodeByUniqueId beforeEach end");
    }); 

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('APIgetFrameNodeByUniqueId afterEach err: ' + JSON.stringify(err));
      }
      console.info("APIgetFrameNodeByUniqueId after each called");
    })
    
    
/**
     * @tc.number   APIgetFrameNodeByUniqueId_static_0100
     * @tc.name     APIgetFrameNodeByUniqueId_static_0100
     * @tc.desc     APIgetFrameNodeByUniqueId_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APIgetFrameNodeByUniqueId_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('APIgetFrameNodeByUniqueId_static_0100 START');
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('APIgetFrameNodeByUniqueId_Text01');
        console.info("[APIgetFrameNodeByUniqueId_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)), JSON.parseJsonElement(strJson)
          .getElement('$attrs').getString('content'));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('APIgetFrameNodeByUniqueId');
        console.info('[APIgetFrameNodeByUniqueId_static_0100] END');
        done();
      } catch (err) {
        console.info('APIgetFrameNodeByUniqueId_static_0100 err: ' + JSON.stringify(err));
        done();
      }
    });
  })
}