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

import { expect, describe, it, beforeEach, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function EdgesPositionTest() {
  describe('EdgesPositionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("EdgesPosition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/position/EdgesPositionPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EdgesPosition state pages:" + JSON.stringify(pages));
        if (!("EdgesPositionPage" == pages.name)) {
          console.info("get EdgesPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push EdgesPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EdgesPosition page error:" + err);
      }
      console.info("EdgesPosition beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("EdgesPosition after each called");
    });

    /*
     * @tc.number    EdgesPositionTest_0100
     * @tc.name      EdgesPositionTest_0100
     * @tc.desc      Test EdgesPosition
     * @tc.level     Level 1
     */
    it('EdgesPositionTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[EdgesPositionTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // set top
      let button = await driver.findComponent(ON.id('EdgesPositionPage_top_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_top_Btn.");
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      let obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.position is: " + obj.$attrs.position);
      let parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      let rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0100] parentFlex top is: " + parentRect.top);
      console.info("[EdgesPositionTest_0100] parentFlex left is: " + parentRect.left);
      console.info("[EdgesPositionTest_0100] parentFlex bottom is: " + parentRect.bottom);
      console.info("[EdgesPositionTest_0100] parentFlex right is: " + parentRect.right);
      console.info("[EdgesPositionTest_0100] testFlex top is: " + rect.top);
      console.info("[EdgesPositionTest_0100] testFlex left is: " + rect.left);
      console.info("[EdgesPositionTest_0100] testFlex bottom is: " + rect.bottom);
      console.info("[EdgesPositionTest_0100] testFlex right is: " + rect.right);

      // set left
      button = await driver.findComponent(ON.id('EdgesPositionPage_left_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_left_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.position is: " + obj.$attrs.position);
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0100] parentFlex top is: " + parentRect.top);
      console.info("[EdgesPositionTest_0100] parentFlex left is: " + parentRect.left);
      console.info("[EdgesPositionTest_0100] parentFlex bottom is: " + parentRect.bottom);
      console.info("[EdgesPositionTest_0100] parentFlex right is: " + parentRect.right);
      console.info("[EdgesPositionTest_0100] testFlex top is: " + rect.top);
      console.info("[EdgesPositionTest_0100] testFlex left is: " + rect.left);
      console.info("[EdgesPositionTest_0100] testFlex bottom is: " + rect.bottom);
      console.info("[EdgesPositionTest_0100] testFlex right is: " + rect.right);

      // set bottom
      button = await driver.findComponent(ON.id('EdgesPositionPage_bottom_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_bottom_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.position is: " + obj.$attrs.position);
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0100] parentFlex top is: " + parentRect.top);
      console.info("[EdgesPositionTest_0100] parentFlex left is: " + parentRect.left);
      console.info("[EdgesPositionTest_0100] parentFlex bottom is: " + parentRect.bottom);
      console.info("[EdgesPositionTest_0100] parentFlex right is: " + parentRect.right);
      console.info("[EdgesPositionTest_0100] testFlex top is: " + rect.top);
      console.info("[EdgesPositionTest_0100] testFlex left is: " + rect.left);
      console.info("[EdgesPositionTest_0100] testFlex bottom is: " + rect.bottom);
      console.info("[EdgesPositionTest_0100] testFlex right is: " + rect.right);

      // set right
      button = await driver.findComponent(ON.id('EdgesPositionPage_right_Btn'));
      await button.click();
      console.info("[EdgesPositionTest_0100] click EdgesPositionPage_right_Btn.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('EdgesPositionPage_testFlex');
      obj = JSON.parse(strJson);
      console.info("[EdgesPositionTest_0100] obj.$attrs.position is: " + obj.$attrs.position);
      parentRect = Utils.getComponentRect("EdgesPositionPage_parentFlex");
      rect = Utils.getComponentRect("EdgesPositionPage_testFlex");
      console.info("[EdgesPositionTest_0100] parentFlex top is: " + parentRect.top);
      console.info("[EdgesPositionTest_0100] parentFlex left is: " + parentRect.left);
      console.info("[EdgesPositionTest_0100] parentFlex bottom is: " + parentRect.bottom);
      console.info("[EdgesPositionTest_0100] parentFlex right is: " + parentRect.right);
      console.info("[EdgesPositionTest_0100] testFlex top is: " + rect.top);
      console.info("[EdgesPositionTest_0100] testFlex left is: " + rect.left);
      console.info("[EdgesPositionTest_0100] testFlex bottom is: " + rect.bottom);
      console.info("[EdgesPositionTest_0100] testFlex right is: " + rect.right);

      console.info('[EdgesPositionTest_0100] END');
      done();
    });
  })
}