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

export default function resourceColorErrorCodeTest() {
  describe('resourceColorErrorCodeTest', () => {
    beforeEach(async () => {
      console.info("resourceColorErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/resourceColorErrorCodeTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get resourceColorErrorCodeTest state pages:" + JSON.stringify(pages));
        if (!("resourceColorErrorCodeTest" == pages.name)) {
          console.info("get resourceColorErrorCodeTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push resourceColorErrorCodeTest page error:" + err);
      }
      console.info("resourceColorErrorCodeTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('resourceColorErrorCodeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("resourceColorErrorCodeTest after each called");
    });

    afterAll(() => {})

    /**
     * @tc.number   resourceColorErrorCodeTest_static_0100
     * @tc.name     resourceColorErrorCodeTest_static_0100
     * @tc.desc     resourceColorErrorCodeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('resourceColorErrorCodeTest_static_0100', Level.LEVEL0, async (done: () => void) => {

      console.info('resourceColorErrorCodeTest_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('resourceColorErrorCodeTest sleep err: ' + JSON.stringify(err));
      }
      let button1: Component | null = null;
      try {
        button1 = await driver.findComponent(ON.id('error_bnt401_id'));
      } catch (err) {
        console.info('resourceColorErrorCodeTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('resourceColorErrorCodeTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('resourceColorErrorCodeTest sleep err: ' + JSON.stringify(err));
      }
      let button2: Component | null = null;
      try {
        button2 = await driver.findComponent(ON.id('error_bnt180003_id'));
      } catch (err) {
        console.info('resourceColorErrorCodeTest findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (button2?.click() as Promise<void>);
      } catch (err) {
        console.info('resourceColorErrorCodeTest click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('resourceColorErrorCodeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson1: string = inspector.getInspectorByKey('error_str401_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2: string = inspector.getInspectorByKey('error_str180003_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[resourceColorErrorCodeTest_0100] component obj is: " + JSON.stringify(obj1));
      console.info("[resourceColorErrorCodeTest_0100] content obj is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[resourceColorErrorCodeTest_0100] component obj is: " + JSON.stringify(obj2));
      console.info("[resourceColorErrorCodeTest_0100] content obj is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('180003');
      console.info('[resourceColorErrorCodeTest_0100] END');
      done();
    });

  })
}
