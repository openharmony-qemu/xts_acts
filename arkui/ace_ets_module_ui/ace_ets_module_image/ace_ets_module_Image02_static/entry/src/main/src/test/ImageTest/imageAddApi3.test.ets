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

export default function imageAddApi3() {
  beforeAll(() => {
    console.info("imageAddApi3 beforeEach start");
    await UtilsTest.loadAndSetUpUiTest();
    await UtilsTest.msSleep(4000)
    await UtilsTest.startAbility("com.arkui.ace.Image02.static", "EntryAbility")
    await UtilsTest.msSleep(4000)
  });

  describe('imageAddApi3', () => {
    beforeEach(async (): Promise<void> => {
      console.info("imageAddApi3 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get imageAddApi3 state pages:" + JSON.stringify(pages));
        if (!("imageAddApi3" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Image/imageAddApi3"
          })
          await CommonFunc.sleep(2000);
          // console.info("push imageAddApi3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageAddApi3 page error:" + err);
      }
      console.info("imageAddApi3 foreEach end");
      // done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("imageAddApi3 after each called");
    });

    /**
     * @tc.number     : SUB_ACE_UI_COMPONENT_IMAGE_001
     * @tc.desc       : objectFit test of image
     * @tc.name       : imageAddApi3_static_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('imageAddApi3_static_001', 0, async (done: () => void) => {
      console.info('[imageAddApi3_static_001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi3');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi3_static_001] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.TOP_START');
      console.info('[imageAddApi3_static_001] END');
      done();

    });

    /**
     * @tc.number     : SUB_ACE_UI_COMPONENT_IMAGE_002
     * @tc.desc       : objectFit test of image
     * @tc.name       : imageAddApi3_static_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('imageAddApi3_static_002', 0, async (done: () => void) => {
      console.info('[imageAddApi3_static_002] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi32');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi3_static_002] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.TOP_END');
      console.info('[imageAddApi3_static_002] END');
      done();

    });

    /**
     * @tc.number     : SUB_ACE_UI_COMPONENT_IMAGE_003
     * @tc.desc       : objectFit test of image
     * @tc.name       : imageAddApi3_static_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('imageAddApi3_static_003', 0, async (done: () => void) => {
      console.info('[imageAddApi3_static_003] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi33');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi3_static_003] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.BOTTOM_START');
      console.info('[imageAddApi3_static_003] END');
      done();

    });

    /**
     * @tc.number     : SUB_ACE_UI_COMPONENT_IMAGE_004
     * @tc.desc       : objectFit test of image
     * @tc.name       : imageAddApi3_static_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('imageAddApi3_static_004', 0, async (done: () => void) => {
      console.info('[imageAddApi3_static_003] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi34');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi3_static_003] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.BOTTOM_END');
      console.info('[imageAddApi3_static_003] END');
      done();

    });
  })
}
