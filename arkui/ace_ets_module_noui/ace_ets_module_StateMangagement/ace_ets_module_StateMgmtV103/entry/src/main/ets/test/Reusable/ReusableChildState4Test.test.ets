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
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function ReusableChildState4Test() {
  describe('ReusableChildState4Test', () => {
    beforeEach(async (done: Function) => {
      console.info("ReusableChildState4Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Reusable/ReusableChildState4Test",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ReusableChildState4Test" == pages.name)) {
          console.info("get ReusableChildState4Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ReusableChildState4Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReusableChildState4Test page error:" + err);
      }
      console.info("ReusableChildState4Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ReusableChildState4Test after each called");
    });

    /**
     * @tc.name   ReusableChildState4Test_001
     * @tc.number SUB_ACE_STATUSMANAGER_REUSABLECHILD_0040
     * @tc.desc   ReusableChild with state variables should not crash on reuse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReusableChildState4Test_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ReusableChildState4Test_001] START');
      // Step 1: click on button 'Switch' twice
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let switchButton = await driver.findComponent(ON.text('Switch'));
      await CommonFunc.sleep(500);
      await switchButton.click();
      await CommonFunc.sleep(500);
      await switchButton.click();
      await CommonFunc.sleep(1000);

      // Step 2: Verify text in ReusableChildState4Child is '0 b 1 e'
      let textComponent = await driver.findComponent(ON.text('0 b 1 e'));
      let actualText = await textComponent.getText();
      expect(actualText).assertEqual('0 b 1 e');
      console.info('[ReusableChildState4Test_001] END');
      done();
    });
  })
}
