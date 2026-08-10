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

export default function getSyncNullAndUndefined() {
  describe('getSyncNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("getSyncNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/GetSync/GetSyncNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getSyncNullAndUndefined state success " + JSON.stringify(pages));
        if (!("GetSyncNullAndUndefined" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getSyncNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getIdEmptyV10001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_001
     * @tc.desc   Test componentSnapshot.getSync with empty id
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
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getIdEmptyV10001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getIdEmptyV10001] END');
    });

    /**
     * @tc.name   optionsNullV10004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_004
     * @tc.desc   Test componentSnapshot.getSync with null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('optionsNullV10004', Level.LEVEL0, async () => {
      console.info('[optionsNullV10004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[optionsNullV10004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[optionsNullV10004] END');
    });

    /**
     * @tc.name   optionsUndefinedV10005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_005
     * @tc.desc   Test componentSnapshot.getSync with undefined options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('optionsUndefinedV10005', Level.LEVEL0, async () => {
      console.info('[optionsUndefinedV10005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[optionsUndefinedV10005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[optionsUndefinedV10005] END');
    });

    /**
     * @tc.name   waitTrueV10006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_006
     * @tc.desc   Test componentSnapshot.getSync with waitUntilRenderFinished true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('waitTrueV10006', Level.LEVEL0, async () => {
      console.info('[waitTrueV10006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waitTrueV10006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[waitTrueV10006] END');
    });

    /**
     * @tc.name   waitFalseV10007
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_007
     * @tc.desc   Test componentSnapshot.getSync with waitUntilRenderFinished false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('waitFalseV10007', Level.LEVEL0, async () => {
      console.info('[waitFalseV10007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waitFalseV10007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[waitFalseV10007] END');
    });

    /**
     * @tc.name   dynamicRangeModeHIGHV10023
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_023
     * @tc.desc   Test componentSnapshot.getSync with dynamicRangeMode HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeHIGHV10023', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeHIGHV10023] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeHIGHV10023] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[dynamicRangeModeHIGHV10023] END');
    });

    /**
     * @tc.name   dynamicRangeModeCONSTRAINTV10024
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_024
     * @tc.desc   Test componentSnapshot.getSync with dynamicRangeMode CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeCONSTRAINTV10024', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeCONSTRAINTV10024] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeCONSTRAINTV10024] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[dynamicRangeModeCONSTRAINTV10024] END');
    });

    /**
     * @tc.name   dynamicRangeModeSTANDARDV10025
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_025
     * @tc.desc   Test componentSnapshot.getSync with dynamicRangeMode STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeSTANDARDV10025', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeSTANDARDV10025] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeSTANDARDV10025] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[dynamicRangeModeSTANDARDV10025] END');
    });

    /**
     * @tc.name   dynamicRangeModeIsAutoTrueV10026
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_026
     * @tc.desc   Test componentSnapshot.getSync with dynamicRangeMode isAuto true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeIsAutoTrueV10026', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeIsAutoTrueV10026] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeIsAutoTrueV10026] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[dynamicRangeModeIsAutoTrueV10026] END');
    });

    /**
     * @tc.name   dynamicRangeModeIsAutoFalseV10027
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNC_PARAM_027
     * @tc.desc   Test componentSnapshot.getSync with dynamicRangeMode isAuto false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeIsAutoFalseV10027', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeIsAutoFalseV10027] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultTextGetSync1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeIsAutoFalseV10027] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[dynamicRangeModeIsAutoFalseV10027] END');
    });
  })
}
