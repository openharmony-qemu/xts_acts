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
import { describe, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
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

export default function componentContentDisposeTest() {
  describe('componentContentDisposeTest', () => {
    beforeEach(async () => {
      console.info("componentContentDisposeTest_0100 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/componentContentDisposeTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get componentContentDisposeTest_0100 state pages:" + JSON.stringify(pages));
        if (!("componentContentDisposeTest" == pages.name)) {
          console.info("get componentContentDisposeTest_0100 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push componentContentDisposeTest_0100 page error:" + err);
      }
      console.info("componentContentDisposeTest_0100 beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('componentContentDisposeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("componentContentDisposeTest_0100 after each called");
    });

    afterAll(() => {})

    /**
     * @tc.number   componentContentDisposeTest_static_0100
     * @tc.name     componentContentDisposeTest_static_0100
     * @tc.desc     componentContentDisposeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('componentContentDisposeTest_static_0100', Level.LEVEL2, async (done: () => void) => {

      console.info('componentContentDisposeTest_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('componentContentDisposeTest sleep err: ' + JSON.stringify(err));
      }
      let button1: Component | null = null;
      try {
        button1 = await driver.findComponent(ON.id('dispose_id'));
      } catch (err) {
        console.info('componentContentDisposeTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('componentContentDisposeTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('componentContentDisposeTest sleep err: ' + JSON.stringify(err));
      }
      let button2: Component | null = null;
      try {
        button2 = await driver.findComponent(ON.id('ret_id'));
      } catch (err) {
        console.info('componentContentDisposeTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('componentContentDisposeTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('componentContentDisposeTest sleep err: ' + JSON.stringify(err));
      }

      let strJson: string = inspector.getInspectorByKey('dispose_ret');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[componentContentDisposeTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[componentContentDisposeTest_0100] content obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('9');
      console.info('[componentContentDisposeTest_0100] END');
      done();
    });
  })
}
