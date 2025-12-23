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

export default function ChipCloseOptions() {
  describe('ChipCloseOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipCloseOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/chip/ChipCloseOptions",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Chip0010" == pages.name)) {
          console.info("get ChipCloseOptions pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipCloseOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipCloseOptions page error:" + err);
      }
      console.info("ChipCloseOptions beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ChipCloseOptions after each called");
    });

    /**
     * @tc.name   ChipCloseOptions_001
     * @tc.number ChipCloseOptions_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ChipCloseOptions_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ChipCloseOptions_001] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getChipPadding'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let test1 = AppStorage.get<string>('chip0CloseOptionsFontSize')
      console.log("ChipCloseOptions_001 test1 ", test1)
      expect(test1).assertEqual('35.00px');
      console.info('[ChipCloseOptions_001] END');
      done();
    });

  })
}