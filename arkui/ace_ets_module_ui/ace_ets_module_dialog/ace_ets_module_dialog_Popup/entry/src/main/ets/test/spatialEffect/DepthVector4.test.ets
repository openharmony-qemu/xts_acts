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

export default function DepthVector4Test() {
  describe('DepthVector4Test', () => {

    beforeAll(async () => {
      console.info("DepthVector4Test beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/spatialEffect/DepthVector4TestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DepthVector4TestPage state success ' + JSON.stringify(pages));
        if (!('DepthVector4TestPage' == pages.name)) {
          console.info('get DepthVector4TestPage state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push DepthVector4TestPage page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DepthVector4TestPage page error ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DepthVector4Test after each called");
    });

    /**
     * @tc.name   DepthVector4Test_0100
     * @tc.number SUB_ARKUI_API_DepthVector4_0100
     * @tc.desc   Test DepthVector4 x positive value via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthVector4Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('DepthVector4Test_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_x_positive'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthVector4Test_0100 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('x=100');

      console.info('DepthVector4Test_0100 END');
      done();
    });

    /**
     * @tc.name   DepthVector4Test_0200
     * @tc.number SUB_ARKUI_API_DepthVector4_0200
     * @tc.desc   Test DepthVector4 w positive value via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthVector4Test_0200', Level.LEVEL0, async (done: Function) => {
      console.info('DepthVector4Test_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_w_positive'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthVector4Test_0200 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('w=400');

      console.info('DepthVector4Test_0200 END');
      done();
    });

    /**
     * @tc.name   DepthVector4Test_0300
     * @tc.number SUB_ARKUI_API_DepthVector4_0300
     * @tc.desc   Test DepthVector4 all zero values via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthVector4Test_0300', Level.LEVEL0, async (done: Function) => {
      console.info('DepthVector4Test_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_zero'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthVector4Test_0300 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('x=0,y=0,z=0,w=0');

      console.info('DepthVector4Test_0300 END');
      done();
    });

    /**
     * @tc.name   DepthVector4Test_0400
     * @tc.number SUB_ARKUI_API_DepthVector4_0400
     * @tc.desc   Test DepthVector4 negative values via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthVector4Test_0400', Level.LEVEL0, async (done: Function) => {
      console.info('DepthVector4Test_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_negative'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthVector4Test_0400 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('x=-1,y=-1,z=-1,w=-1');

      console.info('DepthVector4Test_0400 END');
      done();
    });

    /**
     * @tc.name   DepthVector4Test_0500
     * @tc.number SUB_ARKUI_API_DepthVector4_0500
     * @tc.desc   Test DepthVector4 all positive values via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthVector4Test_0500', Level.LEVEL0, async (done: Function) => {
      console.info('DepthVector4Test_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_positive'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthVector4Test_0500 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('x=1,y=1,z=1,w=1');

      console.info('DepthVector4Test_0500 END');
      done();
    });
  })
}