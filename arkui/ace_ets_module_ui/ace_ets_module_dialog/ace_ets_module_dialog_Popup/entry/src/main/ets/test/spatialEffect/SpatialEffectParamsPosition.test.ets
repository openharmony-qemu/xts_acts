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

export default function SpatialEffectParamsPositionTest() {
  describe('SpatialEffectParamsPositionTest', () => {

    beforeAll(async () => {
      console.info("SpatialEffectParamsPositionTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/spatialEffect/SpatialEffectParamsPositionTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SpatialEffectParamsPositionTestPage state success ' + JSON.stringify(pages));
        if (!('SpatialEffectParamsPositionTestPage' == pages.name)) {
          console.info('get SpatialEffectParamsPositionTestPage state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push SpatialEffectParamsPositionTestPage page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SpatialEffectParamsPositionTestPage page error ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SpatialEffectParamsPositionTest after each called");
    });

    /**
     * @tc.name   SpatialEffectParamsPositionTest_0100
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsPosition_0100
     * @tc.desc   Test SpatialEffectParams position property via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsPositionTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsPositionTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_position_basic'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsPositionTest_0100 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('position:LT(0,0,0)RT(100,0,0)LB(0,100,0)RB(100,100,0)');

      console.info('SpatialEffectParamsPositionTest_0100 END');
      done();
    });

    /**
     * @tc.name   SpatialEffectParamsPositionTest_0200
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsPosition_0200
     * @tc.desc   Test SpatialEffectParams position with 3D coordinates via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsPositionTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsPositionTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_position_3d'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsPositionTest_0200 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('position:LT(0,0,50)RT(100,0,50)LB(0,100,-50)RB(100,100,-50)');

      console.info('SpatialEffectParamsPositionTest_0200 END');
      done();
    });

    /**
     * @tc.name   SpatialEffectParamsPositionTest_0300
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsPosition_0300
     * @tc.desc   Test SpatialEffectParams position leftTop assignment via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsPositionTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsPositionTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_leftTop_assign'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsPositionTest_0300 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('leftTop changed:x=50,y=50,z=5');

      console.info('SpatialEffectParamsPositionTest_0300 END');
      done();
    });

    /**
     * @tc.name   SpatialEffectParamsPositionTest_0400
     * @tc.number SUB_ARKUI_API_SpatialEffectParamsPosition_0400
     * @tc.desc   Test SpatialEffectParams position rightBottom assignment via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialEffectParamsPositionTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialEffectParamsPositionTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_rightBottom_assign'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialEffectParamsPositionTest_0400 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('rightBottom changed:x=180,y=180,z=-8');

      console.info('SpatialEffectParamsPositionTest_0400 END');
      done();
    });
  })
}