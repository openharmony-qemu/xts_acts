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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ChipV2Padding() {
  describe('ChipV2Padding', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipV2Padding beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/chipV2/ChipV2Padding",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ChipV2Padding" == pages.name)) {
          console.info("get ChipV2Padding pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipV2Padding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2Padding page error:" + err);
      }
      console.info("ChipV2Padding beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2Padding after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipV2Padding_0100
     * @tc.number SUB_ARKUI_API_ChipV2Padding_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2Padding_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_ChipV2Padding_0100] START');
      await CommonFunc.sleep(1000);
      let result: ESObject = getInspectorTree();
      let chip0Padding: ESObject = JSON.parse(result.$children[0].$children[0].$children[0].$attrs.padding);
      await CommonFunc.sleep(1000);
      let test1: string = chip0Padding.top;
      let test2: string = chip0Padding.bottom;
      let test3: string = chip0Padding.left;
      let test4: string = chip0Padding.right;
      console.log("SUB_ARKUI_API_ChipV2Padding_0100 test1:", test1," test2: ", test2, " test3: ", test3, " test4: ", test4 )
      expect(test1).assertEqual('20.00px');
      expect(test2).assertEqual('30.00px');
      expect(test3).assertEqual('20.00px');
      expect(test4).assertEqual('30.00px');
      console.info('[SUB_ARKUI_API_ChipV2Padding_0100] END');
      done();
    });

  })
}