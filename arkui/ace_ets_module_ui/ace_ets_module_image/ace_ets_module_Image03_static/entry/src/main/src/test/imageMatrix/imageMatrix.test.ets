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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';
export default function imageMatrix() {
  describe('imageMatrix', () => {
    beforeAll(() => {
      console.info("imageMatrix beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () :Promise<void> => {
      console.info('imageMatrix beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageMatrix/imageMatrix',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info('get imageMatrix state pages: ' + JSON.stringify(pages));
        if (!('imageMatrix' == pages.name)) {
          console.info('get imageMatrix state pages.name: ' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push imageMatrix success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push imageMatrix page error: ' + err);
        expect().assertFail();
      }
      // done();
    });

        /**
     * @tc.number imageMatrix_static_0100
     * @tc.name   imageMatrix_static_0100
     * @tc.desc   test the onKeyEvent api16 CallBack  child & parent component response when child component return false and  child component return false when trigger 'TAB' key 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('imageMatrix_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[imageMatrix_static_0100] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('button1'));
      await (button1?.click() as Promise<void>)
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = inspector.getInspectorByKey('imageMatrix');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[imageMatrix_static_0100] strJson is: ' + strJson);
      console.info('[imageMatrix_static_0100] imageMatrix obj is: ' + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('imageMatrix')));
      expect(obj.getElement('$attrs').getElement('imageMatrix')).assertEqual(
        '4.532353,2.110965,-0.040063,0.000000,\n'+
        '-2.009852,4.342766,1.449440,0.000000,\n'+
        '0.129348,-0.259554,0.957027,0.000000,\n'+
        '30.180006,61.629848,11.275022,1.000000,\n');

      console.info('[imageMatrix_static_0100] END');
      done();
    });
  })
}