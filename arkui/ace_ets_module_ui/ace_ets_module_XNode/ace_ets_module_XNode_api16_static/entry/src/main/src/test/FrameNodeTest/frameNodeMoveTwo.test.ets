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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function frameNodeMoveTwoTest() {
  describe('frameNodeMoveTwoTest', () => {
    beforeEach(async () => {
      console.info("frameNodeMoveTwoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeMoveTwoTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeMoveTwoTest state pages:" + JSON.stringify(pages));
        if (!("frameNodeMoveTwoTest" == pages.name)) {
          console.info("get frameNodeMoveTwoTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push frameNodeMoveTwoTest page error:" + err);
      }
      console.info("frameNodeMoveTwoTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveTwoTest sleep err: ' + JSON.stringify(err));
      }
      console.info("frameNodeMoveTwoTest after each called");
    });

    afterAll(() => {})

    /**
     * @tc.number   frameNodeMoveTwoTest_static_0100
     * @tc.name     frameNodeMoveTwoTest_static_0100
     * @tc.desc     frameNodeMoveTwoTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('frameNodeMoveTwoTest_static_0100', Level.LEVEL2, async (done: () => void) => {

      console.info('frameNodeMoveTwoTest_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveTwoTest sleep err: ' + JSON.stringify(err));
      }
      let button1: Component | null = null;
      try {
        button1 = await driver.findComponent(ON.id('customPopupOptions_id'));
      } catch (err) {
        console.info('frameNodeMoveTwoTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveTwoTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('frameNodeMoveTwoTest sleep err: ' + JSON.stringify(err));
      }
      let button2: Component | null = null;
      try {
        button2 = await driver.findComponent(ON.id('popup_id'));
      } catch (err) {
        console.info('frameNodeMoveTwoTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveTwoTest click err: ' + JSON.stringify(err));
      }

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveTwoTest sleep err: ' + JSON.stringify(err));
      }
      let strJson1: string = inspector.getInspectorByKey('frame1ChildCount');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[frameNodeMoveTwoTest_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      let strJson2: string = inspector.getInspectorByKey('frame2ChildCount');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[frameNodeMoveTwoTest_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      let strJson3: string = inspector.getInspectorByKey('frame3ChildCount');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[frameNodeMoveTwoTest_0100] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('1');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[frameNodeMoveTwoTest_0100] END');
      done();
    });

  })
}
