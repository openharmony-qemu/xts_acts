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
import { describe, beforeEach, afterEach, afterAll, it, Level, expect} from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

export default function postFrameCallbackTest() {
  describe('postFrameCallbackTest', () => {
      beforeEach(async () => {
        console.info("postFrameCallbackTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/PostFrame/postFrameCallbackTest',
        }
        try {
          const router = AppStorage.get<Router>("router") as Router
          router.clear();
          let pages = router.getState();
          console.info("get postFrameCallbackTest state pages:" + JSON.stringify(pages));
          if (!("postFrameCallbackTest" == pages.name)) {
            console.info("get postFrameCallbackTest pages.name:" + JSON.stringify(pages.name));
            router.pushUrl(options);
            await CommonFunc.sleep(2000);
          }
        } catch (err) {
          console.error("push postFrameCallbackTest page error:" + err);
        }
        console.info("postFrameCallbackTest beforeEach end");
      });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('postFrameCallbackTest sleep err: ' + JSON.stringify(err));
      }
      console.info('postFrameCallbackTest after each called');
    });

    afterAll(() => {})

    /**
     * @tc.number   postFrameCallbackTest_static_0100
     * @tc.name     postFrameCallbackTest_static_0100
     * @tc.desc     postFrameCallbackTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('postFrameCallbackTest_static_0100', Level.LEVEL0, async (done: () => void) => {

      console.info('postFrameCallbackTest_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('postFrameCallbackTest sleep err: ' + JSON.stringify(err));
      }
      let button1: Component | null = null;
      try {
        button1 = await driver.findComponent(ON.id('postFrameCallback_id'));
      } catch (err) {
        console.info('postFrameCallbackTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('postFrameCallbackTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('postFrameCallbackTest sleep err: ' + JSON.stringify(err));
      }
      let button2: Component | null = null;
      try {
        button2 = await driver.findComponent(ON.id('postDelayedFrameCallback_id'));
      } catch (err) {
        console.info('postFrameCallbackTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('postFrameCallbackTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('postFrameCallbackTest sleep err: ' + JSON.stringify(err));
      }
      let button3: Component | null = null;
      try {
        button3 = await driver.findComponent(ON.id('postDelayedFrameCallback_null_id'));
      } catch (err) {
        console.info('postFrameCallbackTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button3?.click() as Promise<void>);
      } catch (err) {
        console.info('postFrameCallbackTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('postFrameCallbackTest sleep err: ' + JSON.stringify(err));
      }
      let button4: Component | null = null;
      try {
        button4 = await driver.findComponent(ON.id('postFrameCallback_value_id'));
      } catch (err) {
        console.info('postFrameCallbackTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button4?.click() as Promise<void>);
      } catch (err) {
        console.info('postFrameCallbackTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('postFrameCallbackTest sleep err: ' + JSON.stringify(err));
      }
      let button5: Component | null = null;
      try {
        button5 = await driver.findComponent(ON.id('postDelayedFrameCallback_value_id'));
      } catch (err) {
        console.info('postFrameCallbackTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button5?.click() as Promise<void>);
      } catch (err) {
        console.info('postFrameCallbackTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('postFrameCallbackTest sleep err: ' + JSON.stringify(err));
      }
      let button6: Component | null = null;
      try {
        button6 = await driver.findComponent(ON.id('postDelayedFrameCallback_null_value_id'));
      } catch (err) {
        console.info('postFrameCallbackTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button6?.click() as Promise<void>);
      } catch (err) {
        console.info('postFrameCallbackTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('postFrameCallbackTest sleep err: ' + JSON.stringify(err));
      }

      let strJson1: string = inspector.getInspectorByKey('result1_id');
      let strJson2: string = inspector.getInspectorByKey('result2_id');
      let strJson3: string = inspector.getInspectorByKey('result3_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[postFrameCallbackTest_static_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[postFrameCallbackTest_static_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[postFrameCallbackTest_static_0100] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('normTask');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('delayTask');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('delayTask');
      console.info('[postFrameCallbackTest_static_0100] END');
      done();
    });

  })
}
