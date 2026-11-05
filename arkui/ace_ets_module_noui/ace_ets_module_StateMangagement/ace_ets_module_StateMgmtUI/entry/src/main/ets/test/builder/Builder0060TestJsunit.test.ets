/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function Builder0060TestJsunit() {
  describe('Builder0060TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Builder0060TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/builder/Builder0060",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Builder0060TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Builder0060" == pages.name)) {
          console.info("get Builder0060TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Builder0060TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Builder0060TestJsunit page error:" + err);
      }
      console.info("Builder0060TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Builder0060TestJsunit after each called");
    });

    /**
     * @tc.name   Builder0060TestJsunit_001
     * @tc.number SUB_ARKUI_STATUSMANAGER_BUILDER_0100
     * @tc.desc   Verify @Builder with interface parameter renders button label from state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Builder0060TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Builder0060TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('builder0060');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Builder0060TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('Hello World');
      console.info('[Builder0060TestJsunit_001] END');
      done();
    });

    /**
     * @tc.name   Builder0060TestJsunit_002
     * @tc.number SUB_ARKUI_STATUSMANAGER_BUILDER_0200
     * @tc.desc   Verify @Builder onClick callback updates state and Text content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Builder0060TestJsunit_002', Level.LEVEL0, async (done: Function) => {
      console.info('[Builder0060TestJsunit_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('builder0060'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('builder0060_text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Builder0060TestJsunit_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Button clicked');
      console.info('[Builder0060TestJsunit_002] END');
      done();
    });
  })
}
