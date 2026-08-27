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
export default function LengthMetricsUnitTest() {
  describe("LengthMetricsUnitTest", () => {
    beforeEach(async () : Promise<void> => {
      console.info("LengthMetricsUnitTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/GraphicsApi/LengthMetricsUnit",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get LengthMetricsUnitTest state pages: " + JSON.stringify(pages));
        if (!("LengthMetricsUnit" == pages.name)) {
          console.info("get LengthMetricsUnitTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push LengthMetricsUnitTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LengthMetricsUnitTest page error: " + err);
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
      console.info("LengthMetricsUnitTest after each called");
    });
    
    

    /**
     * @tc.number   LengthMetricsUnitTest_static_001
     * @tc.name     LengthMetricsUnitTest_static_001
     * @tc.desc     LengthMetricsUnitTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('LengthMetricsUnitTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info("[LengthMetricsUnitTest_001] START");
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let LengthMetricsUnit = inspector.getInspectorByKey("LengthMetricsUnit");
      console.info("LengthMetricsUnit--" + JSON.stringify(JSON.parseJsonElement(LengthMetricsUnit).getElement('$attrs').getString('content')));
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      expect(JSON.parseJsonElement(LengthMetricsUnit).getElement('$attrs').getString('content')).assertEqual("1");
      console.info("[LengthMetricsUnitTest_001] END");
      done();
    });
  })
}