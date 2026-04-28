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

import router from '@ohos.router';
import { describe, beforeAll, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function SpatialEffectParamsOcclusionWeightTest() {
  describe('SpatialEffectParamsOcclusionWeightTest', () => {

    beforeAll(async () => {
      console.info("SpatialEffectParamsOcclusionWeightTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/spatialEffect/SpatialEffectParamsOcclusionWeightTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SpatialEffectParamsOcclusionWeightTestPage state success ' + JSON.stringify(pages));
        if (!('SpatialEffectParamsOcclusionWeightTestPage' == pages.name)) {
          console.info('get SpatialEffectParamsOcclusionWeightTestPage state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push SpatialEffectParamsOcclusionWeightTestPage page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SpatialEffectParamsOcclusionWeightTestPage page error ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SpatialEffectParamsOcclusionWeightTest after each called");
    });

    /**
     * @tc.name   SpatialEffectParamsOcclusionWeightTest_0100
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsOcclusionWeight_0100
     * @tc.desc   Test SpatialEffectParams occlusionWeight default (undefined) via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsOcclusionWeightTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsOcclusionWeightTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_default'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsOcclusionWeightTest_0100 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('occlusionWeight:undefined');

      console.info('SpatialEffectParamsOcclusionWeightTest_0100 END');
      done();
    });

    /**
     * @tc.name   SpatialEffectParamsOcclusionWeightTest_0200
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsOcclusionWeight_0200
     * @tc.desc   Test SpatialEffectParams occlusionWeight min value 0 via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsOcclusionWeightTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsOcclusionWeightTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_min'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsOcclusionWeightTest_0200 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('occlusionWeight:0');

      console.info('SpatialEffectParamsOcclusionWeightTest_0200 END');
      done();
    });

    /**
     * @tc.name   SpatialEffectParamsOcclusionWeightTest_0300
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsOcclusionWeight_0300
     * @tc.desc   Test SpatialEffectParams occlusionWeight max value 1 via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsOcclusionWeightTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsOcclusionWeightTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_max'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsOcclusionWeightTest_0300 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('occlusionWeight:1');

      console.info('SpatialEffectParamsOcclusionWeightTest_0300 END');
      done();
    });

    /**
     * @tc.name   SpatialEffectParamsOcclusionWeightTest_0400
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsOcclusionWeight_0400
     * @tc.desc   Test SpatialEffectParams occlusionWeight middle value 0.5 via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsOcclusionWeightTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsOcclusionWeightTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_middle'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsOcclusionWeightTest_0400 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('occlusionWeight:0.5');

      console.info('SpatialEffectParamsOcclusionWeightTest_0400 END');
      done();
    });

    /**
     * @tc.name   SpatialEffectParamsOcclusionWeightTest_0500
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsOcclusionWeight_0500
     * @tc.desc   Test SpatialEffectParams occlusionWeight decimal value via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsOcclusionWeightTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsOcclusionWeightTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_decimal'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsOcclusionWeightTest_0500 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('occlusionWeight:0.25');

      console.info('SpatialEffectParamsOcclusionWeightTest_0500 END');
      done();
    });

    /**
     * @tc.name   SpatialEffectParamsOcclusionWeightTest_0600
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsOcclusionWeight_0600
     * @tc.desc   Test SpatialEffectParams occlusionWeight assignment via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsOcclusionWeightTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsOcclusionWeightTest_0600 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_assign'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsOcclusionWeightTest_0600 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('occlusionWeight changed:0.8');

      console.info('SpatialEffectParamsOcclusionWeightTest_0600 END');
      done();
    });
  })
}