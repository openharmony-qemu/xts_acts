/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';
const waitUiReadyMs = 1000;
interface optionsObj {
  uri: string
}
export default function ImageOrientationTest() {
  describe('ImageOrientationTest', () => {
    beforeAll(() => {
      console.info("ImageOrientationTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () :Promise<void> => {
      console.info("ImageOrientationTest beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/ImageOrientation/ImageOrientation',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get ImageOrientationTest state pages: " + JSON.stringify(pages));
        if (!("imageTwo" == pages.name)) {
          console.info("get ImageOrientationTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl({url:"MainAbility/pages/Image/APIClipMaskShape"})
          await CommonFunc.sleep(2000);
          // console.info("push ImageOrientationTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageOrientationTest page error: " + err);
        expect().assertFail();
      }
      // done();
    });

    it('ImageOrientationTest_static_0100',  Level.LEVEL0, async (done: ()=>void) => {
      console.info('ImageOrientationTest_static_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button = await driver.findComponent(ON.id('changeOrientation'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('imageOrientation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageOrientationTest_static_0100 component obj is: ' + obj.getElement('$attrs').getElement('orientation'));
      expect(obj.getElement('$attrs').getElement('orientation')).assertEqual('1');
      done();
    });
  })
}