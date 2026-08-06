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

export default function uIContextGetNullAndUndefinedTest() {
  describe('uIContextGetNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("uIContextGetNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/UIContextGet/UIContextGetNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uIContextGetNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("UIContextGetNullAndUndefined" == pages.name)) {
          console.info("get uIContextGetNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push uIContextGetNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uIContextGetNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getIdEmptyV12001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_001
     * @tc.desc   Test componentSnapshot.get with empty id using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getIdEmptyV12001', Level.LEVEL0, async () => {
      console.info('[getIdEmptyV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnIdEmpty'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getIdEmptyV12001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getIdEmptyV12001] END');
    });

    /**
     * @tc.name   getOptionsNullV12004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_004
     * @tc.desc   Test componentSnapshot.get with null options using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsNullV12004', Level.LEVEL0, async () => {
      console.info('[getOptionsNullV12004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsNullV12004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsNullV12004] END');
    });

    /**
     * @tc.name   getOptionsUndefinedV12005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_005
     * @tc.desc   Test componentSnapshot.get with undefined options using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsUndefinedV12005', Level.LEVEL0, async () => {
      console.info('[getOptionsUndefinedV12005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsUndefinedV12005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsUndefinedV12005] END');
    });

    /**
     * @tc.name   getWaitTrueV12006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_006
     * @tc.desc   Test componentSnapshot.get with waitUntilRenderFinished true using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitTrueV12006', Level.LEVEL0, async () => {
      console.info('[getWaitTrueV12006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitTrueV12006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitTrueV12006] END');
    });

    /**
     * @tc.name   getWaitFalseV12007
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_007
     * @tc.desc   Test componentSnapshot.get with waitUntilRenderFinished false using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitFalseV12007', Level.LEVEL0, async () => {
      console.info('[getWaitFalseV12007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitFalseV12007] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitFalseV12007] END');
    });

    /**
     * @tc.name   getDynamicRangeModeHIGHV23016
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_023
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode HIGH using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeHIGHV23016', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeHIGHV23016] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeHIGHV23016] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeHIGHV23016] END');
    });

    /**
     * @tc.name   getDynamicRangeModeCONSTRAINTV23017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_024
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode CONSTRAINT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeCONSTRAINTV23017', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeCONSTRAINTV23017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeCONSTRAINTV23017] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeCONSTRAINTV23017] END');
    });

    /**
     * @tc.name   getDynamicRangeModeSTANDARDV23018
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_025
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode STANDARD using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeSTANDARDV23018', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeSTANDARDV23018] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeSTANDARDV23018] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeSTANDARDV23018] END');
    });

    /**
     * @tc.name   getDynamicRangeModeIsAutoTrueV23019
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_026
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode isAuto true using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeIsAutoTrueV23019', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeIsAutoTrueV23019] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeIsAutoTrueV23019] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeIsAutoTrueV23019] END');
    });

    /**
     * @tc.name   getDynamicRangeModeIsAutoFalseV23020
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_027
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode isAuto false using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeIsAutoFalseV23020', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeIsAutoFalseV23020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultTextGet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeIsAutoFalseV23020] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeIsAutoFalseV23020] END');
    });
  })
}
