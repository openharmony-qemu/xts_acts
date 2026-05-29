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

export default function ChipV2FontSize() {
  describe('ChipV2FontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipV2FontSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/chipV2/ChipV2FontSize",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ChipV2FontSize" == pages.name)) {
          console.info("get ChipV2FontSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipV2FontSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2FontSize page error:" + err);
      }
      console.info("ChipV2FontSize beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2FontSize after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipV2FontSize_0100
     * @tc.number SUB_ARKUI_API_ChipV2FontSize_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2FontSize_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_ChipV2FontSize_0100] START');
      await CommonFunc.sleep(1000);
      let result: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let test1:string  = result.$children[0].$children[0].$children[0].$children[0].$attrs.fontSize;
      let test2:string  = result.$children[0].$children[1].$children[0].$children[0].$attrs.fontSize;
      let test3:string  = result.$children[0].$children[2].$children[0].$children[0].$attrs.fontSize;
      let test4:string  = result.$children[0].$children[3].$children[0].$children[0].$attrs.fontSize;
      let test5:string  = result.$children[0].$children[4].$children[0].$children[0].$attrs.fontSize;
      await CommonFunc.sleep(2000);
      console.log("SUB_ARKUI_API_ChipV2FontSize_0100 test1:", test1," test2: ", test2, " test3: ", test3, " test4: ", test4, " test5: ", test5 )
      expect(test1).assertEqual('10.00vp');
      expect(test2).assertEqual(test4);
      expect(test3).assertEqual(test5);
      console.info('[SUB_ARKUI_API_ChipV2FontSize_0100] END');
      done();
    });

  })
}