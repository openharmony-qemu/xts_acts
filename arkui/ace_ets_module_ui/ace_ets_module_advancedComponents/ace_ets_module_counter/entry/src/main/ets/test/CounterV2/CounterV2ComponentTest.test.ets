/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function CounterV2ComponentTest() {
  describe('CounterV2ComponentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CounterV2ComponentTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CounterV2/CounterV2ComponentTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CounterV2ComponentTest state pages:" + JSON.stringify(pages));
        if (!("CounterV2ComponentTest" == pages.name)) {
          console.info("get CounterV2ComponentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CounterV2ComponentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CounterV2ComponentTest page error:" + err);
      }
      console.info("CounterV2ComponentTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CounterV2ComponentTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_API_CounterV2ComponentTest_0100
     * @tc.number SUB_ARKUI_API_CounterV2ComponentTest_0100
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2ComponentTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_CounterV2ComponentTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btn"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let type = getInspectorByKey('type');
      await CommonFunc.sleep(1000);
      expect(JSON.parse(type).$attrs.content).assertEqual('INLINE_DATE');
      console.info('[SUB_ARKUI_API_CounterV2ComponentTest_0100] END');
      done();
    });
  })
}
