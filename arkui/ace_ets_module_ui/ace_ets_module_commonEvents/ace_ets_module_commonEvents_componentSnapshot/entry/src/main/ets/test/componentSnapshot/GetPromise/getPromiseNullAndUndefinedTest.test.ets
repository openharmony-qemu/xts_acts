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

export default function getPromiseNullAndUndefined() {
  describe('getPromiseNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("getPromiseNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/GetPromise/GetPromiseNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getPromiseNullAndUndefined state success " + JSON.stringify(pages));
        if (!("GetPromiseNullAndUndefined" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getPromiseNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getIdEmptyV10001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_001
     * @tc.desc   Test componentSnapshot.get with empty id using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getIdEmptyV10001', Level.LEVEL0, async () => {
      console.info('[getIdEmptyV10001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnIdEmpty'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getIdEmptyV10001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getIdEmptyV10001] END');
    });

    /**
     * @tc.name   getOptionsNullV12001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_003
     * @tc.desc   Test componentSnapshot.get with null options using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsNullV12001', Level.LEVEL0, async () => {
      console.info('[getOptionsNullV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsNullV12001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsNullV12001] END');
    });

    /**
     * @tc.name   getWaitFalseV12002
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_004
     * @tc.desc   Test componentSnapshot.get with waitUntilRenderFinished false using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitFalseV12002', Level.LEVEL0, async () => {
      console.info('[getWaitFalseV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitFalseV12002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitFalseV12002] END');
    });

    /**
     * @tc.name   getDynamicRangeModeHIGHV23003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_007
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode HIGH using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeHIGHV23003', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeHIGHV23003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeHIGHV23003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeHIGHV23003] END');
    });

    /**
     * @tc.name   getDynamicRangeModeIsAutoTrueV23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_008
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode isAuto true using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeIsAutoTrueV23004', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeIsAutoTrueV23004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeIsAutoTrueV23004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeIsAutoTrueV23004] END');
    });

    /**
     * @tc.name   getOptionsUndefinedV12002
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_010
     * @tc.desc   Test componentSnapshot.get with undefined options using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[getOptionsUndefinedV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsUndefinedV12002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsUndefinedV12002] END');
    });

    /**
     * @tc.name   getWaitTrueV12003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_011
     * @tc.desc   Test componentSnapshot.get with waitUntilRenderFinished true using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitTrueV12003', Level.LEVEL0, async () => {
      console.info('[getWaitTrueV12003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitTrueV12003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitTrueV12003] END');
    });

    /**
     * @tc.name   getDynamicRangeModeCONSTRAINTV23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_013
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode CONSTRAINT using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeCONSTRAINTV23004', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeCONSTRAINTV23004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeCONSTRAINTV23004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeCONSTRAINTV23004] END');
    });

    /**
     * @tc.name   getDynamicRangeModeSTANDARDV23005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_014
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode STANDARD using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeSTANDARDV23005', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeSTANDARDV23005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeSTANDARDV23005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeSTANDARDV23005] END');
    });

    /**
     * @tc.name   getDynamicRangeModeIsAutoFalseV23006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETPROMISE_PARAM_015
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode isAuto false using Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeIsAutoFalseV23006', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeIsAutoFalseV23006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGetPromise');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeIsAutoFalseV23006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeIsAutoFalseV23006] END');
    });
  })
}
