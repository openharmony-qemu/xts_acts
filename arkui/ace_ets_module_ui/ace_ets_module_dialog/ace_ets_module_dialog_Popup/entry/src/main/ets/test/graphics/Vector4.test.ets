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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

interface Vector4Type {
  x: number;
  y: number;
  z: number;
  w: number;
}

export default function Vector4TestSuite() {
  describe('Vector4Test', () => {

    beforeAll(async () => {
      console.info("Vector4Test beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/graphics/Vector4TestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get Vector4TestPage state success ' + JSON.stringify(pages));
        if (!('Vector4TestPage' == pages.name)) {
          console.info('get Vector4TestPage state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push Vector4TestPage page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push Vector4TestPage page error ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Vector4Test after each called");
    });

    /**
     * @tc.name   Vector4Test_0100
     * @tc.number SUB_ACE_Vector4Test_0100
     * @tc.desc   Test Vector4 x positive value button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Vector4Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('Vector4Test_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_x_positive'));
      await btn.click();
      await CommonFunc.sleep(500);

      let textX = await driver.findComponent(ON.id('text_x'));
      let textAttr = await textX.getText();
      expect(textAttr).assertEqual('x = 0.1');
      console.info('Vector4Test_0100 text_x: ' + textAttr);

      let textJson = await driver.findComponent(ON.id('text_json'));
      let jsonAttr = await textJson.getText();
      console.info('Vector4Test_0100 text_json: ' + jsonAttr);

      console.info('Vector4Test_0100 END');
      done();
    });

    /**
     * @tc.name   Vector4Test_0200
     * @tc.number SUB_ACE_Vector4Test_0200
     * @tc.desc   Test Vector4 x negative value button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Vector4Test_0200', Level.LEVEL0, async (done: Function) => {
      console.info('Vector4Test_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_x_negative'));
      await btn.click();
      await CommonFunc.sleep(500);

      let textX = await driver.findComponent(ON.id('text_x'));
      let textAttr = await textX.getText();
      expect(textAttr).assertEqual('x = -0.1');
      console.info('Vector4Test_0200 text_x: ' + textAttr);

      console.info('Vector4Test_0200 END');
      done();
    });

    /**
     * @tc.name   Vector4Test_0300
     * @tc.number SUB_ACE_Vector4Test_0300
     * @tc.desc   Test Vector4 all positive values button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Vector4Test_0300', Level.LEVEL0, async (done: Function) => {
      console.info('Vector4Test_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_positive'));
      await btn.click();
      await CommonFunc.sleep(500);

      let textX = await driver.findComponent(ON.id('text_x'));
      let textAttrX = await textX.getText();
      expect(textAttrX).assertEqual('x = 0.5');
      console.info('Vector4Test_0300 text_x: ' + textAttrX);

      let textY = await driver.findComponent(ON.id('text_y'));
      let textAttrY = await textY.getText();
      expect(textAttrY).assertEqual('y = 0.5');
      console.info('Vector4Test_0300 text_y: ' + textAttrY);

      let textZ = await driver.findComponent(ON.id('text_z'));
      let textAttrZ = await textZ.getText();
      expect(textAttrZ).assertEqual('z = 0.5');
      console.info('Vector4Test_0300 text_z: ' + textAttrZ);

      let textW = await driver.findComponent(ON.id('text_w'));
      let textAttrW = await textW.getText();
      expect(textAttrW).assertEqual('w = 0.5');
      console.info('Vector4Test_0300 text_w: ' + textAttrW);

      let textJson = await driver.findComponent(ON.id('text_json'));
      let jsonAttr = await textJson.getText();
      console.info('Vector4Test_0300 text_json: ' + jsonAttr);

      console.info('Vector4Test_0300 END');
      done();
    });

    /**
     * @tc.name   Vector4Test_0400
     * @tc.number SUB_ACE_Vector4Test_0400
     * @tc.desc   Test Vector4 all negative values button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Vector4Test_0400', Level.LEVEL0, async (done: Function) => {
      console.info('Vector4Test_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_negative'));
      await btn.click();
      await CommonFunc.sleep(500);

      let textX = await driver.findComponent(ON.id('text_x'));
      let textAttrX = await textX.getText();
      expect(textAttrX).assertEqual('x = -0.5');
      console.info('Vector4Test_0400 text_x: ' + textAttrX);

      let textY = await driver.findComponent(ON.id('text_y'));
      let textAttrY = await textY.getText();
      expect(textAttrY).assertEqual('y = -0.5');
      console.info('Vector4Test_0400 text_y: ' + textAttrY);

      let textZ = await driver.findComponent(ON.id('text_z'));
      let textAttrZ = await textZ.getText();
      expect(textAttrZ).assertEqual('z = -0.5');
      console.info('Vector4Test_0400 text_z: ' + textAttrZ);

      let textW = await driver.findComponent(ON.id('text_w'));
      let textAttrW = await textW.getText();
      expect(textAttrW).assertEqual('w = -0.5');
      console.info('Vector4Test_0400 text_w: ' + textAttrW);

      console.info('Vector4Test_0400 END');
      done();
    });

    /**
     * @tc.name   Vector4Test_0500
     * @tc.number SUB_ACE_Vector4Test_0500
     * @tc.desc   Test Vector4 all zero values button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Vector4Test_0500', Level.LEVEL0, async (done: Function) => {
      console.info('Vector4Test_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_zero'));
      await btn.click();
      await CommonFunc.sleep(500);

      let textX = await driver.findComponent(ON.id('text_x'));
      let textAttrX = await textX.getText();
      expect(textAttrX).assertEqual('x = 0');
      console.info('Vector4Test_0500 text_x: ' + textAttrX);

      let textY = await driver.findComponent(ON.id('text_y'));
      let textAttrY = await textY.getText();
      expect(textAttrY).assertEqual('y = 0');
      console.info('Vector4Test_0500 text_y: ' + textAttrY);

      let textZ = await driver.findComponent(ON.id('text_z'));
      let textAttrZ = await textZ.getText();
      expect(textAttrZ).assertEqual('z = 0');
      console.info('Vector4Test_0500 text_z: ' + textAttrZ);

      let textW = await driver.findComponent(ON.id('text_w'));
      let textAttrW = await textW.getText();
      expect(textAttrW).assertEqual('w = 0');
      console.info('Vector4Test_0500 text_w: ' + textAttrW);

      console.info('Vector4Test_0500 END');
      done();
    });

    /**
     * @tc.name   Vector4Test_0600
     * @tc.number SUB_ACE_Vector4Test_0600
     * @tc.desc   Test Vector4 all max values button (x=1, y=1, z=1, w=1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Vector4Test_0600', Level.LEVEL0, async (done: Function) => {
      console.info('Vector4Test_0600 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_max'));
      await btn.click();
      await CommonFunc.sleep(500);

      let textX = await driver.findComponent(ON.id('text_x'));
      let textAttrX = await textX.getText();
      expect(textAttrX).assertEqual('x = 1');
      console.info('Vector4Test_0600 text_x: ' + textAttrX);

      let textY = await driver.findComponent(ON.id('text_y'));
      let textAttrY = await textY.getText();
      expect(textAttrY).assertEqual('y = 1');
      console.info('Vector4Test_0600 text_y: ' + textAttrY);

      let textZ = await driver.findComponent(ON.id('text_z'));
      let textAttrZ = await textZ.getText();
      expect(textAttrZ).assertEqual('z = 1');
      console.info('Vector4Test_0600 text_z: ' + textAttrZ);

      let textW = await driver.findComponent(ON.id('text_w'));
      let textAttrW = await textW.getText();
      expect(textAttrW).assertEqual('w = 1');
      console.info('Vector4Test_0600 text_w: ' + textAttrW);

      console.info('Vector4Test_0600 END');
      done();
    });

    /**
     * @tc.name   Vector4Test_0700
     * @tc.number SUB_ACE_Vector4Test_0700
     * @tc.desc   Test Vector4 all min values button (x=-1, y=-1, z=-1, w=-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Vector4Test_0700', Level.LEVEL0, async (done: Function) => {
      console.info('Vector4Test_0700 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_min'));
      await btn.click();
      await CommonFunc.sleep(500);

      let textX = await driver.findComponent(ON.id('text_x'));
      let textAttrX = await textX.getText();
      expect(textAttrX).assertEqual('x = -1');
      console.info('Vector4Test_0700 text_x: ' + textAttrX);

      let textY = await driver.findComponent(ON.id('text_y'));
      let textAttrY = await textY.getText();
      expect(textAttrY).assertEqual('y = -1');
      console.info('Vector4Test_0700 text_y: ' + textAttrY);

      let textZ = await driver.findComponent(ON.id('text_z'));
      let textAttrZ = await textZ.getText();
      expect(textAttrZ).assertEqual('z = -1');
      console.info('Vector4Test_0700 text_z: ' + textAttrZ);

      let textW = await driver.findComponent(ON.id('text_w'));
      let textAttrW = await textW.getText();
      expect(textAttrW).assertEqual('w = -1');
      console.info('Vector4Test_0700 text_w: ' + textAttrW);

      console.info('Vector4Test_0700 END');
      done();
    });

    /**
     * @tc.name   Vector4Test_0800
     * @tc.number SUB_ACE_Vector4Test_0800
     * @tc.desc   Test Vector4 type definition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Vector4Test_0800', Level.LEVEL0, async (done: Function) => {
      console.info('Vector4Test_0800 START');

      let vector: Vector4Type = { x: 0.1, y: -0.1, z: 0.2, w: -0.2 };
      expect(vector.x).assertEqual(0.1);
      expect(vector.y).assertEqual(-0.1);
      expect(vector.z).assertEqual(0.2);
      expect(vector.w).assertEqual(-0.2);
      console.info('Vector4Test_0800 barrelDistortion: ' + JSON.stringify(vector));
      console.info('Vector4Test_0800 x(left): ' + vector.x);
      console.info('Vector4Test_0800 y(right): ' + vector.y);
      console.info('Vector4Test_0800 z(top): ' + vector.z);
      console.info('Vector4Test_0800 w(bottom): ' + vector.w);

      console.info('Vector4Test_0800 END');
      done();
    });
  })
}