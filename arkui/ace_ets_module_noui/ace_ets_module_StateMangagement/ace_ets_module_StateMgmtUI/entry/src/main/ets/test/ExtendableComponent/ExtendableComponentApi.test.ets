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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ExtendableComponentApiTest() {
  describe('ExtendableComponentApiTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ExtendableComponentApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendableComponent/ExtendableComponentApi",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ExtendableComponentApi" == pages.name)) {
          console.info("get ExtendableComponentApiTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ExtendableComponentApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ExtendableComponentApiTest page error:" + err);
      }
      console.info("ExtendableComponentApiTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ExtendableComponentApiTest after each called");
    });

    /**
     * @tc.name   ExtendableComponent_getUIContext_0100
     * @tc.number SUB_ARKUI_EXTENDABLECOMPONENT_GETUICONTEXT_RETURN_0100
     * @tc.desc   Test getUIContext() returns a valid UIContext when called during component lifecycle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ExtendableComponent_getUIContext_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ExtendableComponent_getUIContext_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('button_get_uicontext_valid'));
      await button.click();
      await CommonFunc.sleep(500);
      let textComponent: Component = await driver.findComponent(ON.id('text_uicontext_result'));
      let result: string = await textComponent.getText();
      console.info('[ExtendableComponent_getUIContext_0100] result: ' + result);
      expect(result).assertEqual('UIContext: valid');
      console.info('[ExtendableComponent_getUIContext_0100] END');
      done();
    });

    /**
     * @tc.name   ExtendableComponent_getUIContext_0200
     * @tc.number SUB_ARKUI_EXTENDABLECOMPONENT_GETUICONTEXT_RETURN_0200
     * @tc.desc   Test getUIContext() returns a functional UIContext that returns null for non-existent id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ExtendableComponent_getUIContext_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ExtendableComponent_getUIContext_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('button_get_uicontext_functional'));
      await button.click();
      await CommonFunc.sleep(500);
      let textComponent: Component = await driver.findComponent(ON.id('text_uicontext_functional_result'));
      let result: string = await textComponent.getText();
      console.info('[ExtendableComponent_getUIContext_0200] result: ' + result);
      expect(result).assertEqual('UIContext Functional: valid');
      console.info('[ExtendableComponent_getUIContext_0200] END');
      done();
    });

    /**
     * @tc.name   ExtendableComponent_getUniqueId_0100
     * @tc.number SUB_ARKUI_EXTENDABLECOMPONENT_GETUNIQUEID_RETURN_0100
     * @tc.desc   Test getUniqueId() returns a valid number (>= 0) when component is active
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ExtendableComponent_getUniqueId_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ExtendableComponent_getUniqueId_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('button_get_uniqueid'));
      await button.click();
      await CommonFunc.sleep(500);
      let textComponent: Component = await driver.findComponent(ON.id('text_uniqueid_result'));
      let result: string = await textComponent.getText();
      console.info('[ExtendableComponent_getUniqueId_0100] result: ' + result);
      let idStr: string = result.replace('UniqueId: ', '');
      let uniqueId: number = parseInt(idStr, 10);
      console.info('[ExtendableComponent_getUniqueId_0100] uniqueId: ' + uniqueId);
      expect(uniqueId >= 0).assertTrue();
      console.info('[ExtendableComponent_getUniqueId_0100] END');
      done();
    });

    /**
     * @tc.name   ExtendableComponent_getUniqueId_0200
     * @tc.number SUB_ARKUI_EXTENDABLECOMPONENT_GETUNIQUEID_RETURN_0200
     * @tc.desc   Test getUniqueId() returns different values for different components
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ExtendableComponent_getUniqueId_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ExtendableComponent_getUniqueId_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // Get parent component's uniqueId
      let buttonParent: Component = await driver.findComponent(ON.id('button_get_uniqueid'));
      await buttonParent.click();
      await CommonFunc.sleep(500);
      let textParent: Component = await driver.findComponent(ON.id('text_uniqueid_result'));
      let parentResult: string = await textParent.getText();
      let parentIdStr: string = parentResult.replace('UniqueId: ', '');
      let parentId: number = parseInt(parentIdStr, 10);
      console.info('[ExtendableComponent_getUniqueId_0200] parentId: ' + parentId);

      // Get child component's uniqueId
      let buttonChild: Component = await driver.findComponent(ON.id('button_get_child_uniqueid'));
      await buttonChild.click();
      await CommonFunc.sleep(500);
      let textChild: Component = await driver.findComponent(ON.id('text_child_uniqueid_result'));
      let childResult: string = await textChild.getText();
      let childIdStr: string = childResult.replace('Child UniqueId: ', '');
      let childId: number = parseInt(childIdStr, 10);
      console.info('[ExtendableComponent_getUniqueId_0200] childId: ' + childId);

      expect(parentId !== childId).assertTrue();
      console.info('[ExtendableComponent_getUniqueId_0200] END');
      done();
    });
  })
}
