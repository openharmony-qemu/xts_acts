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

export default function dragControllerNullAndUndefinedTest() {
  describe('dragControllerNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("dragControllerNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/DragControllerNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dragControllerNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("DragControllerNullAndUndefined" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dragControllerNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dragControllerNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   notifyDragStartRequestNullV3001
     * @tc.number SUB_ARKUI_DRAGCONTROLLER_NOTIFYDRAGSTARTREQUEST_PARAM_0001
     * @tc.desc   Test DragController.notifyDragStartRequest with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('notifyDragStartRequestNullV3001', Level.LEVEL0, async () => {
      console.info('[notifyDragStartRequestNullV3001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnNotifyDragNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[notifyDragStartRequestNullV3001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[notifyDragStartRequestNullV3001] END');
    });

    /**
     * @tc.name   notifyDragStartRequestUndefinedV3002
     * @tc.number SUB_ARKUI_DRAGCONTROLLER_NOTIFYDRAGSTARTREQUEST_PARAM_0002
     * @tc.desc   Test DragController.notifyDragStartRequest with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('notifyDragStartRequestUndefinedV3002', Level.LEVEL0, async () => {
      console.info('[notifyDragStartRequestUndefinedV3002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnNotifyDragUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[notifyDragStartRequestUndefinedV3002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[notifyDragStartRequestUndefinedV3002] END');
    });

    /**
     * @tc.name   notifyDragStartRequestOutOfRangeV3003
     * @tc.number SUB_ARKUI_DRAGCONTROLLER_NOTIFYDRAGSTARTREQUEST_PARAM_0003
     * @tc.desc   Test DragController.notifyDragStartRequest with out of range enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('notifyDragStartRequestOutOfRangeV3003', Level.LEVEL0, async () => {
      console.info('[notifyDragStartRequestOutOfRangeV3003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnNotifyDragOutOfRange'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[notifyDragStartRequestOutOfRangeV3003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[notifyDragStartRequestOutOfRangeV3003] END');
    });

    /**
     * @tc.name   setDragEventStrictReportingEnabledNullV3004
     * @tc.number SUB_ARKUI_DRAGCONTROLLER_SETDRAGEVENTSTRICTREPORTINGENABLED_PARAM_0004
     * @tc.desc   Test DragController.setDragEventStrictReportingEnabled with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setDragEventStrictReportingEnabledNullV3004', Level.LEVEL0, async () => {
      console.info('[setDragEventStrictReportingEnabledNullV3004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnStrictReportingNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setDragEventStrictReportingEnabledNullV3004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[setDragEventStrictReportingEnabledNullV3004] END');
    });

    /**
     * @tc.name   setDragEventStrictReportingEnabledUndefinedV3005
     * @tc.number SUB_ARKUI_DRAGCONTROLLER_SETDRAGEVENTSTRICTREPORTINGENABLED_PARAM_0005
     * @tc.desc   Test DragController.setDragEventStrictReportingEnabled with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setDragEventStrictReportingEnabledUndefinedV3005', Level.LEVEL0, async () => {
      console.info('[setDragEventStrictReportingEnabledUndefinedV3005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnStrictReportingUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setDragEventStrictReportingEnabledUndefinedV3005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[setDragEventStrictReportingEnabledUndefinedV3005] END');
    });

    /**
     * @tc.name   enableDropDisallowedBadgeNullV3006
     * @tc.number SUB_ARKUI_DRAGCONTROLLER_ENABLEDROPDISALLOWEDBADGE_PARAM_0006
     * @tc.desc   Test DragController.enableDropDisallowedBadge with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableDropDisallowedBadgeNullV3006', Level.LEVEL0, async () => {
      console.info('[enableDropDisallowedBadgeNullV3006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnEnableDropNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[enableDropDisallowedBadgeNullV3006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[enableDropDisallowedBadgeNullV3006] END');
    });

    /**
     * @tc.name   enableDropDisallowedBadgeUndefinedV3007
     * @tc.number SUB_ARKUI_DRAGCONTROLLER_ENABLEDROPDISALLOWEDBADGE_PARAM_0007
     * @tc.desc   Test DragController.enableDropDisallowedBadge with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableDropDisallowedBadgeUndefinedV3007', Level.LEVEL0, async () => {
      console.info('[enableDropDisallowedBadgeUndefinedV3007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnEnableDropUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[enableDropDisallowedBadgeUndefinedV3007] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[enableDropDisallowedBadgeUndefinedV3007] END');
    });
  })
}
