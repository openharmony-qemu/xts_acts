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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SegmentButtonOptions() {
  describe('SegmentButtonOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SegmentButtonOptions/SegmentButtonOptions",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SegmentButtonOptions state pages: " + JSON.stringify(pages));
        if (!("Gesture" == pages.name)) {
          console.info("get SegmentButtonOptions state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonOptions page error: " + err);
        expect().assertFail();
      }
      done();
    });

     /** 
      * @tc.number   SegmentButtonOptions_0200 
      * @tc.name     SegmentButtonOptions_0200 
      * @tc.desc     SegmentButtonOptions_0200 
      * @tc.level    Level.LEVEL0 
      */ 
     it('SegmentButtonOptions_0200', Level.LEVEL0, async (done: () => void): Promise<void> => { 
 
 
       console.info('SegmentButtonOptions_0200 START'); 
       let driver =  Driver.create() 
       await CommonFunc.sleep(1000); 
       let button1 = await driver.findComponent(ON.id('1')); 
       await (button1?.click() as Promise<void>); 
       await CommonFunc.sleep(2000); 
       let strJson = inspector.getInspectorByKey('text1'); 
       let obj = JSON.parseJsonElement(strJson); 
       console.info("[SegmentButtonOptions_0200] component obj is: " + obj.getElement('$attrs').getString('content')); 
       expect(obj.getElement('$attrs').getString('content')).assertEqual('true') 
       console.info('[SegmentButtonOptions_0200] END'); 
       done(); 
     });
  })
}