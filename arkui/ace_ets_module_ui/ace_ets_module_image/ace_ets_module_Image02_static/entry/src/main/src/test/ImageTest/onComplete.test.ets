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

const uiContext = new UIContext();

export default function onComplete() {
  describe('onComplete', () => {

    beforeAll(() => {
      console.info("onComplete beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.Image02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("onComplete beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/onComplete',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get onComplete state pages:" + JSON.stringify(pages));
        if (!("onComplete" == pages.name)) {
          console.info("get onComplete pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push onComplete page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onComplete page error:" + err);
      }
      console.info("onComplete beforeEach end");
      // done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onComplete after each called");
    });
    /**
     * @tc.number onComplete_static_0100
     * @tc.name onComplete_static_0100
     * @tc.desc onComplete:event.loadingStatus
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('onComplete_static_0100', 0, async (done: () => void) => {
      console.info('[onComplete_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DloadingStatus');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[onSelectionChange1_0100] END');
      done();
    });


    /**
     * @tc.number onComplete_static_0200
     * @tc.name onComplete_static_0200
     * @tc.desc onComplete:event.contentWidth
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('onComplete_static_0200', 0, async (done: () => void) => {
      console.info('[onComplete_static_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DcontentWidth');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Math.abs(Math.round(Number(Obj1.getElement('$attrs').getString('content')) - uiContext.vp2px(100))) <= 1).assertTrue();
      console.info('[onSelectionChange1_0200] END');
      done();
    });


    /**
     * @tc.number onComplete_static_0300
     * @tc.name onComplete_static_0300
     * @tc.desc onComplete:event.contentHeight
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('onComplete_static_0300', 0, async (done: () => void) => {
      console.info('[onComplete_static_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DcontentHeight');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Math.abs(Math.round(Number(Obj1.getElement('$attrs').getString('content')) - uiContext.vp2px(100))) <= 1).assertTrue();
      console.info('[onSelectionChange1_0300] END');
      done();
    });


    /**
     * @tc.number onComplete_static_0400
     * @tc.name onComplete_static_0400
     * @tc.desc onComplete:event.contentOffsetX
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('onComplete_static_0400', 0, async (done: () => void) => {
      console.info('[onComplete_static_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DcontentOffsetX');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[onSelectionChange1_0400] END');
      done();
    });


    /**
     * @tc.number onComplete_static_0500
     * @tc.name onComplete_static_0500
     * @tc.desc onComplete:event.contentOffsetY
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('onComplete_static_0500', 0, async (done: () => void) => {
      console.info('[onComplete_static_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DcontentOffsetY');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[onSelectionChange1_0500] END');
      done();
    });
  })
}
