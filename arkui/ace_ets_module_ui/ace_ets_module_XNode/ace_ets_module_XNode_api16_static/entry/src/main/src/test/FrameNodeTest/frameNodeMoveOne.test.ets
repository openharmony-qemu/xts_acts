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
import inspector from '@ohos.arkui.inspector'
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function frameNodeMoveOneTest() {
  describe('frameNodeMoveOneTest', () => {
    beforeEach(async () => {
      console.info("frameNodeMoveOneTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeMoveOneTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        router.replaceUrl(options);
        console.info("get frameNodeMoveOneTest state pages:" + JSON.stringify(pages));
        if (!("frameNodeMoveOneTest" == pages.name)) {
          console.info("get frameNodeMoveOneTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push frameNodeMoveOneTest page error:" + err);
      }
      console.info("frameNodeMoveOneTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      console.info("frameNodeMoveOneTest after each called");
    });

    afterAll(() => {})

    /**
     * @tc.number   frameNodeMoveOneTest_static_0100
     * @tc.name     frameNodeMoveOneTest_static_0100
     * @tc.desc     frameNodeMoveOneTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('frameNodeMoveOneTest_static_0100', Level.LEVEL2, async (done: () => void) => {

      console.info('frameNodeMoveOneTest_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      let button1: Component | null = null;
      try {
        button1 = await driver.findComponent(ON.id('addFrame2_id'));
      } catch (err) {
        console.info('frameNodeMoveOneTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveOneTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      let button2: Component | null = null;
      try {
        button2 = await driver.findComponent(ON.id('frame1AddBlue_id'));
      } catch (err) {
        console.info('frameNodeMoveOneTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveOneTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      let button3: Component | null = null;
      try {
        button3 = await driver.findComponent(ON.id('move_id'));
      } catch (err) {
        console.info('frameNodeMoveOneTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button3?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveOneTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      let button4: Component | null = null;
      try {
        button4 = await driver.findComponent(ON.id('count_id'));
      } catch (err) {
        console.info('frameNodeMoveOneTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button4?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveOneTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }

      let strJson1: string = inspector.getInspectorByKey('frame1ChildCount_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[frameNodeMoveOneTest_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      let strJson2: string = inspector.getInspectorByKey('frame2ChildCount_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[frameNodeMoveOneTest_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('2');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[frameNodeMoveOneTest_0100] END');
      done();
    });

    /**
     * @tc.number   frameNodeMoveOneTest_static_0200
     * @tc.name     frameNodeMoveOneTest_static_0200
     * @tc.desc     frameNodeMoveOneTest_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('frameNodeMoveOneTest_static_0200', Level.LEVEL2, async (done: () => void) => {

      console.info('frameNodeMoveOneTest_0200 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      let button1: Component | null = null;
      try {
        button1 = await driver.findComponent(ON.id('addFrame2_id'));
      } catch (err) {
        console.info('frameNodeMoveOneTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveOneTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      let button2: Component | null = null;
      try {
        button2 = await driver.findComponent(ON.id('addText_id'));
      } catch (err) {
        console.info('frameNodeMoveOneTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveOneTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      let button3: Component | null = null;
      try {
        button3 = await driver.findComponent(ON.id('moveText_id'));
      } catch (err) {
        console.info('frameNodeMoveOneTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button3?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveOneTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }
      let button4: Component | null = null;
      try {
        button4 = await driver.findComponent(ON.id('count_id'));
      } catch (err) {
        console.info('frameNodeMoveOneTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button4?.click() as Promise<void>);
      } catch (err) {
        console.info('frameNodeMoveOneTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('frameNodeMoveOneTest sleep err: ' + JSON.stringify(err));
      }

      let strJson1: string = inspector.getInspectorByKey('frame3ChildCount_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[frameNodeMoveOneTest_0200] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      let strJson2: string = inspector.getInspectorByKey('getNodeParentId_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[frameNodeMoveOneTest_0200] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('root_id1');
      console.info('[frameNodeMoveOneTest_0200] END');
      done();
    });

  })
}
