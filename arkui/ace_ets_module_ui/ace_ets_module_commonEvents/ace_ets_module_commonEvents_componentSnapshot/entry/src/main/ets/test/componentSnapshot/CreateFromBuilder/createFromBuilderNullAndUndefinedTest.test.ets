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

export default function createFromBuilderNullAndUndefined() {
  describe('createFromBuilderNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("createFromBuilderNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/CreateFromBuilder/CreateFromBuilderNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createFromBuilderNullAndUndefined state success " + JSON.stringify(pages));
        if (!("CreateFromBuilderNullAndUndefined" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push createFromBuilderNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   delayNullV10003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_003
     * @tc.desc   Test componentSnapshot.createFromBuilder with null delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('delayNullV10003', Level.LEVEL0, async () => {
      console.info('[delayNullV10003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDelayNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[delayNullV10003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[delayNullV10003] END');
    });

    /**
     * @tc.name   delayUndefinedV10004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_004
     * @tc.desc   Test componentSnapshot.createFromBuilder with undefined delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('delayUndefinedV10004', Level.LEVEL0, async () => {
      console.info('[delayUndefinedV10004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDelayUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[delayUndefinedV10004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[delayUndefinedV10004] END');
    });

    /**
     * @tc.name   checkImageStatusTrueV10005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_005
     * @tc.desc   Test componentSnapshot.createFromBuilder with checkImageStatus true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('checkImageStatusTrueV10005', Level.LEVEL0, async () => {
      console.info('[checkImageStatusTrueV10005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnCheckTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkImageStatusTrueV10005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[checkImageStatusTrueV10005] END');
    });

    /**
     * @tc.name   checkImageStatusFalseV10006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_006
     * @tc.desc   Test componentSnapshot.createFromBuilder with checkImageStatus false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('checkImageStatusFalseV10006', Level.LEVEL0, async () => {
      console.info('[checkImageStatusFalseV10006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnCheckFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkImageStatusFalseV10006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[checkImageStatusFalseV10006] END');
    });

    /**
     * @tc.name   optionsNullV10007
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_007
     * @tc.desc   Test componentSnapshot.createFromBuilder with null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('optionsNullV10007', Level.LEVEL0, async () => {
      console.info('[optionsNullV10007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[optionsNullV10007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[optionsNullV10007] END');
    });

    /**
     * @tc.name   optionsUndefinedV10008
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_008
     * @tc.desc   Test componentSnapshot.createFromBuilder with undefined options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('optionsUndefinedV10008', Level.LEVEL0, async () => {
      console.info('[optionsUndefinedV10008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[optionsUndefinedV10008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[optionsUndefinedV10008] END');
    });

    /**
     * @tc.name   waitTrueV10009
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_009
     * @tc.desc   Test componentSnapshot.createFromBuilder with waitUntilRenderFinished true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('waitTrueV10009', Level.LEVEL0, async () => {
      console.info('[waitTrueV10009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waitTrueV10009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[waitTrueV10009] END');
    });

    /**
     * @tc.name   waitFalseV10010
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_010
     * @tc.desc   Test componentSnapshot.createFromBuilder with waitUntilRenderFinished false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('waitFalseV10010', Level.LEVEL0, async () => {
      console.info('[waitFalseV10010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waitFalseV10010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[waitFalseV10010] END');
    });

    /**
     * @tc.name   dynamicRangeModeHIGHV10013
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_013
     * @tc.desc   Test componentSnapshot.createFromBuilder with dynamicRangeMode HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeHIGHV10013', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeHIGHV10013] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeHIGHV10013] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[dynamicRangeModeHIGHV10013] END');
    });

    /**
     * @tc.name   dynamicRangeModeCONSTRAINTV10014
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_014
     * @tc.desc   Test componentSnapshot.createFromBuilder with dynamicRangeMode CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeCONSTRAINTV10014', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeCONSTRAINTV10014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeCONSTRAINTV10014] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[dynamicRangeModeCONSTRAINTV10014] END');
    });

    /**
     * @tc.name   dynamicRangeModeSTANDARDV10015
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_015
     * @tc.desc   Test componentSnapshot.createFromBuilder with dynamicRangeMode STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeSTANDARDV10015', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeSTANDARDV10015] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeSTANDARDV10015] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[dynamicRangeModeSTANDARDV10015] END');
    });

    /**
     * @tc.name   dynamicRangeModeIsAutoFalseV10017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_017
     * @tc.desc   Test componentSnapshot.createFromBuilder with dynamicRangeMode isAuto false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeIsAutoFalseV10017', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeIsAutoFalseV10017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextCreateFromBuilder');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeIsAutoFalseV10017] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[dynamicRangeModeIsAutoFalseV10017] END');
    });
  })
}
