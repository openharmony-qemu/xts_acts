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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function RectCommonShapeMethodTest() {
  describe('RectCommonShapeMethodTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("RectCommonShapeMethodPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rect/RectCommonShapeMethodPage',
      }
      try {
        const rectCommonShapeMethodTest = AppStorage.get<Router>("router") as Router
        rectCommonShapeMethodTest.clear();
        let pages = rectCommonShapeMethodTest.getState();
        console.info("get RectCommonShapeMethodPage state success " + JSON.stringify(pages));
        if (!("RectCommonShapeMethodPage" == pages.name)) {
          console.info("get RectCommonShapeMethodPage state success " + JSON.stringify(pages.name));
          // let result = await rectCommonShapeMethodTest.pushUrl(options);
          rectCommonShapeMethodTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RectCommonShapeMethodPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RectCommonShapeMethodPage page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RectCommonShapeMethodTest sleep err: ' + JSON.stringify(err));
      }
      console.info("RectCommonShapeMethodTest after each called");
    });


    
    /**
     * @tc.number   RectCommonShapeMethodTest_static_0010
     * @tc.name     RectCommonShapeMethodTest_static_0010
     * @tc.desc     RectCommonShapeMethodTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('RectCommonShapeMethodTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RectCommonShapeMethodTest_static_0010] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RectCommonShapeMethodTest sleep err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('RectCommonShapeMethodRect_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RectCommonShapeMethodTest_static_0010] Rect obj.$attrs.strokeMiterLimit is: ' +
      obj.getElement('$attrs').getString('strokeMiterLimit'));
      expect(obj.getElement('$attrs').getString('strokeMiterLimit')).assertEqual('10.000000');

      let strJson2 = inspector.getInspectorByKey('RectCommonShapeMethodRect_2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[RectCommonShapeMethodTest_static_0020] Rect obj2.$attrs.strokeOpacity is: ' +
      obj2.getElement('$attrs').getString('strokeOpacity'));
      expect(obj2.getElement('$attrs').getString('strokeOpacity')).assertEqual('0.500000');

      console.info('[RectCommonShapeMethodTest_static_0010] END');
      done();
    });
  })
}
