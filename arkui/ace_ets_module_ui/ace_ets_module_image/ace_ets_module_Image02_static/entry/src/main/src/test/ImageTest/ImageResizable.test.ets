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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';

export default function ImageResizable() {
  describe('ImageResizable', () => {
    beforeAll(() => {
      console.info("ImageResizable beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageResizable beforeEach start");
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get ImageResizable state pages:" + JSON.stringify(pages));
        if (!("ImageResizable" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Image/ImageResizable"
          })
          await CommonFunc.sleep(2000);
          // console.info("push ImageResizable page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageResizable page error:" + err);
      }
      console.info("ImageResizable foreEach end");
      // done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageResizable after each called");
    });
    /**
     * @tc.number ImageResizable_static_001
     * @tc.name ImageResizable_static_001
     * @tc.desc ImageResizable_static_test
     * @tc.size ImageResizable
     * @tc.type Attribute
     * @tc.level 2
     */
    it('ImageResizable_static_001', 0, async (done: () => void) => {
      console.info('[ImageResizable_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageResizable_static_Image1');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ImageResizable_static_001] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$type')).assertEqual('Image');
      console.info('[ImageResizable_static_001] END');
      done();
    });
  })
}