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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function AddMonitor004() {
  describe('AddMonitor004', () => {
    beforeEach(async (done: Function) => {
      console.info("AddMonitor004 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/AddMonitor004",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("AddMonitor004" == pages.name)) {
          console.info("get AddMonitor004 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AddMonitor004 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AddMonitor004 page error:" + err);
      }
      console.info("AddMonitor004 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AddMonitor004 after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_API_AddMonitor004_0100
     * @tc.number SUB_ARKUI_API_AddMonitor004_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AddMonitor004_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_AddMonitor004_0100] START');
      CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = driver.findComponent(ON.id('changeName_empty01'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_1 = (driver.findComponent(ON.id('age_empty01'))).getText();
      console.info("[SUB_ARKUI_API_AddMonitor004_0100] component text_1: " + text_1);
      expect(text_1).assertEqual("1");
      let btn2: Component = driver.findComponent(ON.id('clearMonitor_empty01'));
      await CommonFunc.sleep(1000);
      btn2.click();
      await CommonFunc.sleep(1000);
      btn.click();
      CommonFunc.sleep(1000);
      let text_2 = (driver.findComponent(ON.id('age_empty01'))).getText();
      console.info("[SUB_ARKUI_API_AddMonitor004_0100] component text_2: " + text_2);
      expect(text_2).assertEqual("2");
      console.info('[SUB_ARKUI_API_AddMonitor004_0100] END');
      done();
    });

  })
}