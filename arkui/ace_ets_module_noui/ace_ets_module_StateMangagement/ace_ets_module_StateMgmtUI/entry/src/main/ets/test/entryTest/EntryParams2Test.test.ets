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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function EntryParams2Test() {
  describe('EntryParams2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("EntryParams2Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/entry/EntryParams2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("EntryParams2" == pages.name)) {
          console.info("get EntryParams2Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push EntryParams2Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EntryParams2Test page error:" + err);
      }
      console.info("EntryParams2Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("EntryParams2Test after each called");
    });

    /**
     * @tc.name   EntryParams2Test_0100
     * @tc.number SUB_ARKUI_EntryParamsTest_0100
     * @tc.desc   Persistently store UI related data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EntryParams2Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[EntryParams2Test_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btn2"));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('propB'))).getText();
      console.info("[EntryParams2Test_0100] component text_1 is: " + text_1);
      expect(text_1).assertEqual('3');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btn1"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btn3"));
      await btn3.click();
      let text_2 = await (await driver.findComponent(ON.id('clear'))).getText();
      console.info("[EntryParams2Test_0100] component text_2 is: " + text_2);
      expect(text_2).assertEqual('true');
      console.info('[EntryParams2Test_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
