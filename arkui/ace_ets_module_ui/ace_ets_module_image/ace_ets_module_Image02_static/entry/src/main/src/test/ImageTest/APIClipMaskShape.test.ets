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

export default function APIClipMaskShape() {
  describe('APIClipMaskShape', () => {
    beforeAll(() => {
      console.info("APIClipMaskShape beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("APIClipMaskShape beforeEach start");
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get APIClipMaskShape state pages:" + JSON.stringify(pages));
        if (!("APIClipMaskShape" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Image/APIClipMaskShape"
          })
          await CommonFunc.sleep(2000);
          // console.info("push APIClipMaskShape page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIClipMaskShape page error:" + err);
      }
      console.info("APIClipMaskShape foreEach end");
      // done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIClipMaskShape after each called");
    });
    /**
     * @tc.number api
     * @tc.name APIClipMaskShape_static_001
     * @tc.desc APIClipMaskShape_static_001
     * @tc.size APIClipMaskShape
     * @tc.type Attribute
     * @tc.level 2
     */
    it('APIClipMaskShape_static_001', 0, async (done: () => void) => {
      console.info('[APIClipMaskShape_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('APIClipMaskShape_static_Image1');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIClipMaskShape_static_001] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[APIClipMaskShape_static_001] component obj attrs is: " + 'width' + obj.getElement('$attrs').getString('width') + 'height:' + obj.getElement('$attrs').getString('height'));
      // 会返回500.00px
      await CommonFunc.sleep(1000);
      let width = obj.getElement('$attrs').getString('width').slice(0,-5) + 'px'
      let height = obj.getElement('$attrs').getString('height').slice(0,-5) + 'px'
      expect(width).assertEqual('500px');
      expect(height).assertEqual('280px');
      console.info('[APIClipMaskShape_static_001] END');
      done();
    });
    /**
     * @tc.number api
     * @tc.name APIClipMaskShape_static_002
     * @tc.desc APIClipMaskShape_static_002
     * @tc.size APIClipMaskShape
     * @tc.type Attribute
     * @tc.level 2
     */
    it('APIClipMaskShape_static_002', 0, async (done: () => void) => {
      console.info('[APIClipMaskShape_static_002] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('APIClipMaskShape_static_Image2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIClipMaskShape_static_002] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[APIClipMaskShape_static_002] component obj attrs is: " + 'width' + obj.getElement('$attrs').getString('width') + 'height:' + obj.getElement('$attrs').getString('height'));
      await CommonFunc.sleep(1000);
      let width = obj.getElement('$attrs').getString('width').slice(0,-5) + 'px'
      let height = obj.getElement('$attrs').getString('height').slice(0,-5) + 'px'
      expect(width).assertEqual('300px');
      expect(height).assertEqual('300px');
      console.info('[APIClipMaskShape_static_002] END');
      done();
    });
  })
}
