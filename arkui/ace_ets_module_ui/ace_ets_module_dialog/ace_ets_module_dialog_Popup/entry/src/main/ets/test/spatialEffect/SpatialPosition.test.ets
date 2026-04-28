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

export default function SpatialPositionTest() {
  describe('SpatialPositionTest', () => {

    beforeAll(async () => {
      console.info("SpatialPositionTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/spatialEffect/SpatialPositionTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SpatialPositionTestPage state success ' + JSON.stringify(pages));
        if (!('SpatialPositionTestPage' == pages.name)) {
          console.info('get SpatialPositionTestPage state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push SpatialPositionTestPage page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SpatialPositionTestPage page error ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SpatialPositionTest after each called");
    });

    /**
     * @tc.name   SpatialPositionTest_0100
     * @tc.number SUB_ARKUI_API_SpatialPosition_0100
     * @tc.desc   Test SpatialPosition leftTop via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialPositionTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialPositionTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_leftTop'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialPositionTest_0100 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('leftTop:x=0,y=0,z=0');

      console.info('SpatialPositionTest_0100 END');
      done();
    });

    /**
     * @tc.name   SpatialPositionTest_0200
     * @tc.number SUB_ARKUI_API_SpatialPosition_0200
     * @tc.desc   Test SpatialPosition rightTop via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialPositionTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialPositionTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_rightTop'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialPositionTest_0200 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('rightTop:x=100,y=0,z=0');

      console.info('SpatialPositionTest_0200 END');
      done();
    });

    /**
     * @tc.name   SpatialPositionTest_0300
     * @tc.number SUB_ARKUI_API_SpatialPosition_0300
     * @tc.desc   Test SpatialPosition leftBottom via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialPositionTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialPositionTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_leftBottom'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialPositionTest_0300 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('leftBottom:x=0,y=100,z=0');

      console.info('SpatialPositionTest_0300 END');
      done();
    });

    /**
     * @tc.name   SpatialPositionTest_0400
     * @tc.number SUB_ARKUI_API_SpatialPosition_0400
     * @tc.desc   Test SpatialPosition rightBottom via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialPositionTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialPositionTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_rightBottom'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialPositionTest_0400 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('rightBottom:x=100,y=100,z=0');

      console.info('SpatialPositionTest_0400 END');
      done();
    });

    /**
     * @tc.name   SpatialPositionTest_0500
     * @tc.number SUB_ARKUI_API_SpatialPosition_0500
     * @tc.desc   Test SpatialPosition all corners via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialPositionTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialPositionTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_corners'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialPositionTest_0500 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('LT:0,0,0 RT:100,0,0 LB:0,100,0 RB:100,100,0');

      console.info('SpatialPositionTest_0500 END');
      done();
    });

    /**
     * @tc.name   SpatialPositionTest_0600
     * @tc.number SUB_ARKUI_API_SpatialPosition_0600
     * @tc.desc   Test SpatialPosition with 3D coordinates via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SpatialPositionTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('SpatialPositionTest_0600 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_3d'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('SpatialPositionTest_0600 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('LT:0,0,10 RT:100,0,10 LB:0,100,-10 RB:100,100,-10');

      console.info('SpatialPositionTest_0600 END');
      done();
    });
  })
}