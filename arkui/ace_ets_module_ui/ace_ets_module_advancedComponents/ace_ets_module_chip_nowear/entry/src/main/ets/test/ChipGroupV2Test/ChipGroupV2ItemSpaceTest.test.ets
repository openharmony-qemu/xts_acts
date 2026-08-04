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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function ChipGroupV2ItemSpaceTest() {
  describe('ChipGroupV2ItemSpaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipGroupV2ItemSpaceTest beforeEach item");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipGroupV2/ChipGroupV2ItemSpace",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipGroupV2ItemSpaceTest state pages: " + JSON.stringify(pages));
        if (!("itemSpace" == pages.name)) {
          console.info("get ChipGroupV2ItemSpaceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipGroupV2ItemSpaceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipGroupV2ItemSpaceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupV2ItemSpaceTest_0100
     * @tc.number SUB_ARKUI_API_ChipGroupV2ItemSpaceTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemSpaceTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipGroupV2ItemSpaceTest_0100 item');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let change: Component = await driver.findComponent(ON.id('change'));
      await change.click();
      await CommonFunc.sleep(1000);
      let get: Component = await driver.findComponent(ON.id('get'));
      await get.click();
      await CommonFunc.sleep(1000);
      let itemSpace = getInspectorByKey('itemSpace');
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemSpaceTest_0100] attrs is: " + JSON.stringify(JSON.parse(itemSpace).$attrs));
      expect(JSON.parse(itemSpace).$attrs.content).assertEqual('itemSpace:20');
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemSpaceTest_0100] END');
      done();
    });
  })
}