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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function RectRadiusTest() {
  describe('RectRadiusTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rect/RectPage',
      }
      try {
        const rectPage = AppStorage.get<Router>("router") as Router
        rectPage.clear();
        let pages = rectPage.getState();
        console.info("get RectPage state success " + JSON.stringify(pages));
        if (!("RectPage" == pages.name)) {
          console.info("get RectPage state success " + JSON.stringify(pages.name));
          rectPage.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RectPage page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RectRadiusTest sleep err: ' + JSON.stringify(err));
      }
      console.info("RectRadiusTest after each called");
    });


    
    /**
     * @tc.number   testRectRadiusTest_static_0010
     * @tc.name     testRectRadiusTest_static_0010
     * @tc.desc     testRectRadiusTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testRectRadiusTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRectRadiusTest_static_0010] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RectRadiusTest sleep err: ' + JSON.stringify(err));
      }

      const uiContext = AppStorage.get<UIContext>('uiContent')!;

      let strJson = inspector.getInspectorByKey('RectRadius_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[testRectRadiusTest_static_0010] Rect obj.$type is: ' + obj.getString('$type'));
      console.info('[testRectRadiusTest_static_0010] Rect obj.$attrs.radius is: ' + obj.getElement('$attrs').getElement('radius'));

      expect(obj.getString('$type')).assertEqual('Rect');
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[0][0].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[0][1].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[1][0].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[1][1].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[2][0].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[2][1].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[3][0].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[3][1].asDouble())).assertEqual(20);

      console.info('[testRectRadiusTest_static_0010] END');
      done();
    });


    
    /**
     * @tc.number   testRectRadiusTest_static_0020
     * @tc.name     testRectRadiusTest_static_0020
     * @tc.desc     testRectRadiusTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('testRectRadiusTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRectRadiusTest_static_0020] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RectRadiusTest sleep err: ' + JSON.stringify(err));
      }

      const uiContext = AppStorage.get<UIContext>('uiContent')!;

      let strJson = inspector.getInspectorByKey('RectRadius_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[testRectRadiusTest_static_0020] Rect obj.$type is: ' + obj.getString('$type'));
      console.info('[testRectRadiusTest_static_0020] Rect obj.$attrs.radius is: ' + obj.getElement('$attrs').getElement('radius'));

      expect(obj.getString('$type')).assertEqual('Rect');
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[0][0].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[0][1].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[1][0].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[1][1].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[2][0].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[2][1].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[3][0].asDouble())).assertEqual(20);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('radius')[3][1].asDouble())).assertEqual(20);

      console.info('[testRectRadiusTest_static_0020] END');
      done();
    });
  })
}