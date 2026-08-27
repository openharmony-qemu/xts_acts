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
import { describe, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from "@ohos.router";
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from "@ohos.UiTest";
export default function PercentReferenceTest() {
  describe('PercentReferenceTest', () => {
    beforeEach(async () : Promise<void> => {
      console.info("PercentReferenceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/GraphicsApi/PercentReference",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get PercentReferenceTest state pages: " + JSON.stringify(pages));
        if (!("PercentReference" == pages.name)) {
          console.info("get PercentReferenceTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push PercentReferenceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PercentReferenceTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    afterEach(async () => {
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      console.info("PercentReferenceTest after each called");
    });
    
    

    /**
     * @tc.number   PercentReferenceTest_static_001
     * @tc.name     PercentReferenceTest_static_001
     * @tc.desc     PercentReferenceTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('PercentReferenceTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info("[PercentReferenceTest_001] START");
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("btn"));
      try {
      await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let show: Component|null = await driver.findComponent(ON.id("show"));
      try {
      await (show?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let percentReference = inspector.getInspectorByKey("percentReference");
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      expect(JSON.parseJsonElement(percentReference).getElement('$attrs').getString('content')).assertEqual("percentReference");
      console.info("[PercentReferenceTest_001] END");
      done();
    });
  })
}