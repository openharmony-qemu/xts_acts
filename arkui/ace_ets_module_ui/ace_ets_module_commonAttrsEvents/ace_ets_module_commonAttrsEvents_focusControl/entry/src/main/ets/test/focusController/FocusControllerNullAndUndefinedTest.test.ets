/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium-dynamic"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function focusControllerNullAndUndefinedTest() {
  describe('focusControllerNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("focusControllerNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/FocusController/FocusControllerNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get focusControllerNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("FocusControllerNullAndUndefined" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push focusControllerNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focusControllerNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   activateIsActiveNullV3001
     * @tc.number SUB_ARKUI_FOCUSCONTROLLER_ACTIVATE_PARAM_0001
     * @tc.desc   Test FocusController.activate with isActive null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activateIsActiveNullV3001', Level.LEVEL0, async () => {
      console.info('[activateIsActiveNullV3001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnActivateIsActiveNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('focusResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[activateIsActiveNullV3001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Error: undefined');
      console.info('[activateIsActiveNullV3001] END');
    });

    /**
     * @tc.name   activateIsActiveUndefinedV3002
     * @tc.number SUB_ARKUI_FOCUSCONTROLLER_ACTIVATE_PARAM_0002
     * @tc.desc   Test FocusController.activate with isActive undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activateIsActiveUndefinedV3002', Level.LEVEL0, async () => {
      console.info('[activateIsActiveUndefinedV3002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnActivateIsActiveUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('focusResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[activateIsActiveUndefinedV3002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Error: undefined');
      console.info('[activateIsActiveUndefinedV3002] END');
    });

    /**
     * @tc.name   activateAutoInactiveNullV3003
     * @tc.number SUB_ARKUI_FOCUSCONTROLLER_ACTIVATE_PARAM_0003
     * @tc.desc   Test FocusController.activate with autoInactive null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activateAutoInactiveNullV3003', Level.LEVEL0, async () => {
      console.info('[activateAutoInactiveNullV3003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnActivateAutoInactiveNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('focusResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[activateAutoInactiveNullV3003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Error: undefined');
      console.info('[activateAutoInactiveNullV3003] END');
    });

    /**
     * @tc.name   activateAutoInactiveUndefinedV3004
     * @tc.number SUB_ARKUI_FOCUSCONTROLLER_ACTIVATE_PARAM_0004
     * @tc.desc   Test FocusController.activate with autoInactive undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activateAutoInactiveUndefinedV3004', Level.LEVEL0, async () => {
      console.info('[activateAutoInactiveUndefinedV3004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnActivateAutoInactiveUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('focusResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[activateAutoInactiveUndefinedV3004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Error: undefined');
      console.info('[activateAutoInactiveUndefinedV3004] END');
    });

    /**
     * @tc.name   setAutoFocusTransferNullV3005
     * @tc.number SUB_ARKUI_FOCUSCONTROLLER_SETAUTOFOCUTRANSFER_PARAM_0005
     * @tc.desc   Test FocusController.setAutoFocusTransfer with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setAutoFocusTransferNullV3005', Level.LEVEL0, async () => {
      console.info('[setAutoFocusTransferNullV3005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnSetAutoFocusNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('focusResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setAutoFocusTransferNullV3005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[setAutoFocusTransferNullV3005] END');
    });

    /**
     * @tc.name   setAutoFocusTransferUndefinedV3006
     * @tc.number SUB_ARKUI_FOCUSCONTROLLER_SETAUTOFOCUTRANSFER_PARAM_0006
     * @tc.desc   Test FocusController.setAutoFocusTransfer with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setAutoFocusTransferUndefinedV3006', Level.LEVEL0, async () => {
      console.info('[setAutoFocusTransferUndefinedV3006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnSetAutoFocusUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('focusResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setAutoFocusTransferUndefinedV3006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[setAutoFocusTransferUndefinedV3006] END');
    });
  })
}
