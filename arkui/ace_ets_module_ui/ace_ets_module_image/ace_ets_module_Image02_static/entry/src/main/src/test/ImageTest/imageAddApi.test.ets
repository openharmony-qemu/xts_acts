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

export default function imageAddApi() {
  describe('imageAddApi', () => {
    beforeAll(() => {
      console.info("imageAddApi beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageAddApi beforeEach start");
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get imageAddApi state pages:" + JSON.stringify(pages));
        if (!("imageAddApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Image/imageAddApi"
          })
          await CommonFunc.sleep(2000);
          // console.info("push imageAddApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageAddApi page error:" + err);
      }
      console.info("imageAddApi foreEach end");
      // done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("imageAddApi after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_IMAGE_001
     * @tc.desc dynamicRangeMode test of image
     * @tc.level Level 3
     * @tc.type
     */

    it('imageAddApi_static_001', 0, async (done: () => void) => {
      console.info('[imageAddApi_static_001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi_static_001] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getElement('dynamicRangeMode')).assertEqual('STANDARD');
      console.info('[imageAddApi_static_001] END');
      done();

    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_IMAGE_002
     * @tc.desc dynamicRangeMode test of image
     * @tc.level Level 3
     * @tc.type
     */

    it('imageAddApi_static_002', 0, async (done: () => void) => {
      console.info('[imageAddApi_static_002] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi_static_002] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getElement('dynamicRangeMode')).assertEqual('HIGH');
      console.info('[imageAddApi_static_002] END');
      done();

    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_IMAGE_003
     * @tc.desc dynamicRangeMode test of image
     * @tc.level Level 3
     * @tc.type
     */

    it('imageAddApi_static_003', 0, async (done: () => void) => {
      console.info('[imageAddApi_static_003] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('imageAddApi3');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[imageAddApi_static_003] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getElement('dynamicRangeMode')).assertEqual('CONSTRAINT');
      console.info('[imageAddApi_static_003] END');
      done();

    });
  })
}
