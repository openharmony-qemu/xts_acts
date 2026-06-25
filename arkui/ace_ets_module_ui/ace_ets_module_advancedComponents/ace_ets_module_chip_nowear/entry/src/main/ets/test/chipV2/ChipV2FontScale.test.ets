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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ChipV2FontScale() {
  describe('ChipV2FontScale', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipV2FontScale beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/chipV2/ChipV2FontScale",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ChipV2FontScale" == pages.name)) {
          console.info("get ChipV2FontScale pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipV2FontScale page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2FontScale page error:" + err);
      }
      console.info("ChipV2FontScale beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2FontScale after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipV2FontScale_0100
     * @tc.number SUB_ARKUI_API_ChipV2FontScale_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2FontScale_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_ChipV2FontScale_0100] START');
      await CommonFunc.sleep(1000);
      let result: ESObject = getInspectorTree();
      let chip1: ESObject = result.$children[0].$children[0].$children[0].$children[0].$attrs;
      let chip2: ESObject = result.$children[0].$children[1].$children[0].$children[0].$attrs;
      let chip3: ESObject = result.$children[0].$children[2].$children[0].$children[0].$attrs;
      await CommonFunc.sleep(2000);
      let test1: number = Number.parseFloat(chip1.minFontScale);
      let test2: number = Number.parseFloat(chip1.maxFontScale);
      let test3: number = Number.parseFloat(chip2.minFontScale);
      let test4: number = Number.parseFloat(chip2.maxFontScale);
      let test5: number = Number.parseFloat(chip3.minFontScale);
      let test6: number = Number.parseFloat(chip3.maxFontScale);
      console.log("SUB_ARKUI_API_ChipV2FontScale_0100 test1:", test1," test2: ", test2, " test3: ", test3, " test4: ", test4, " test5: ", test5, " test6: ", test6 )
      expect(test1).assertEqual(0);
      expect(test2).assertEqual(1);
      expect(test3).assertEqual(1);
      expect(test4).assertEqual(2);
      expect(test5).assertEqual(0);
      expect(test6).assertEqual(1);
      console.info('[SUB_ARKUI_API_ChipV2FontScale_0100] END');
      done();
    });

  })
}