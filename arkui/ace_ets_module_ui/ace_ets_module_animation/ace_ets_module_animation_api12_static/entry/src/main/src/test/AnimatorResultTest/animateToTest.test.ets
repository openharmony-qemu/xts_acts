'use static';
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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  MouseButton,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import text from '@ohos.graphics.text';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function animateToTest() {
  describe('animateToTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("animateToTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AnimatorResult/animateToTest"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get animateToTest state pages:" + JSON.stringify(pages));
        if (!("animateToTest" == pages.name)) {
          console.info("get animateToTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push animateToTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animateToTest page error:" + err);
      }
      console.info("animateToTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('animateToTest err: ' + JSON.stringify(err));
      }
      console.info("animateToTest after each called");
    });


/**
     * @tc.number   animateToTest_static_001
     * @tc.name     animateToTest_static_001
     * @tc.desc     animateToTest_static_001
     * @tc.level    Level.LEVEL3
     */
it('animateToTest_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {

      console.info('[animateToTest_static_001] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('animateToTest err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let button: Component | null = null;
      try {
        button = await driver.findComponent(ON.id('animateToTestBt'));
      } catch (err) {
        console.info('animateToTest err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('animateToTest err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('animateToTest err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('animateToTest');
      try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('animateToTest err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(strJson);
      console.info("[animateToTest_static_001] component obj is: " + JSON.stringify(obj));
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('animateToTest err: ' + JSON.stringify(err));
      }
      expect(obj.getElement('$attrs').getString('content')).assertEqual('animateToImmediately');
      console.info('[animateToTest_static_001] END');
      done();
    });
  })
}
