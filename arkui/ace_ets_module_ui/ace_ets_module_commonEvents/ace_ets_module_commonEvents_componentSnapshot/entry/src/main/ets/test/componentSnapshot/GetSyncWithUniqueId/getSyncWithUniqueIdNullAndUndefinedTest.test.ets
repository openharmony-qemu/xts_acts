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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common'

export default function getSyncWithUniqueIdNullAndUndefinedTest() {
  describe('getSyncWithUniqueIdNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("getSyncWithUniqueIdNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/GetSyncWithUniqueId/GetSyncWithUniqueIdNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getSyncWithUniqueIdNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("GetSyncWithUniqueIdNullAndUndefined" == pages.name)) {
          console.info("get getSyncWithUniqueIdNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getSyncWithUniqueIdNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getSyncWithUniqueIdNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getSyncWithUniqueIdOptionsNullV15003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_001
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with null options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdOptionsNullV15003', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdOptionsNullV15003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetSyncWithUniqueId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdOptionsNullV15003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdOptionsNullV15003] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdOptionsUndefinedV15004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_002
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdOptionsUndefinedV15004', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdOptionsUndefinedV15004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetSyncWithUniqueId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdOptionsUndefinedV15004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdOptionsUndefinedV15004] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeHIGHV23016
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_008
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with DynamicRangeMode.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeHIGHV23016', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeHIGHV23016] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetSyncWithUniqueId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeHIGHV23016] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeHIGHV23016] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_009
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with DynamicRangeMode.CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetSyncWithUniqueId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_010
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with DynamicRangeMode.STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetSyncWithUniqueId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_011
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with dynamicRangeMode isAuto set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetSyncWithUniqueId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_012
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with dynamicRangeMode isAuto set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetSyncWithUniqueId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020] END');
    });
  })
}
