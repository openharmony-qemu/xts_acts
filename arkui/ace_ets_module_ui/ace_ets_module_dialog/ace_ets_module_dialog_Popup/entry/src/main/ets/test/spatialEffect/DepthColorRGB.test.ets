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

export default function DepthColorRGBTest() {
  describe('DepthColorRGBTest', () => {

    beforeAll(async () => {
      console.info("DepthColorRGBTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/spatialEffect/DepthColorRGBTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DepthColorRGBTestPage state success ' + JSON.stringify(pages));
        if (!('DepthColorRGBTestPage' == pages.name)) {
          console.info('get DepthColorRGBTestPage state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push DepthColorRGBTestPage page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DepthColorRGBTestPage page error ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DepthColorRGBTest after each called");
    });

    /**
     * @tc.name   DepthColorRGBTest_0100
     * @tc.number SUB_ARKUI_API_DepthColorRGB_0100
     * @tc.desc   Test DepthColorRGB black color (0,0,0) via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthColorRGBTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('DepthColorRGBTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_black'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthColorRGBTest_0100 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('r=0,g=0,b=0');

      console.info('DepthColorRGBTest_0100 END');
      done();
    });

    /**
     * @tc.name   DepthColorRGBTest_0200
     * @tc.number SUB_ARKUI_API_DepthColorRGB_0200
     * @tc.desc   Test DepthColorRGB white color (255,255,255) via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthColorRGBTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('DepthColorRGBTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_white'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthColorRGBTest_0200 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('r=255,g=255,b=255');

      console.info('DepthColorRGBTest_0200 END');
      done();
    });

    /**
     * @tc.name   DepthColorRGBTest_0300
     * @tc.number SUB_ARKUI_API_DepthColorRGB_0300
     * @tc.desc   Test DepthColorRGB red color (255,0,0) via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthColorRGBTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('DepthColorRGBTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_red'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthColorRGBTest_0300 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('r=255,g=0,b=0');

      console.info('DepthColorRGBTest_0300 END');
      done();
    });

    /**
     * @tc.name   DepthColorRGBTest_0400
     * @tc.number SUB_ARKUI_API_DepthColorRGB_0400
     * @tc.desc   Test DepthColorRGB green color (0,255,0) via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthColorRGBTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('DepthColorRGBTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_green'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthColorRGBTest_0400 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('r=0,g=255,b=0');

      console.info('DepthColorRGBTest_0400 END');
      done();
    });

    /**
     * @tc.name   DepthColorRGBTest_0500
     * @tc.number SUB_ARKUI_API_DepthColorRGB_0500
     * @tc.desc   Test DepthColorRGB blue color (0,0,255) via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthColorRGBTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('DepthColorRGBTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blue'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthColorRGBTest_0500 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('r=0,g=0,b=255');

      console.info('DepthColorRGBTest_0500 END');
      done();
    });

    /**
     * @tc.name   DepthColorRGBTest_0600
     * @tc.number SUB_ARKUI_API_DepthColorRGB_0600
     * @tc.desc   Test DepthColorRGB gray color (128,128,128) via UI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DepthColorRGBTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('DepthColorRGBTest_0600 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_gray'));
      await btn.click();
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DepthColorRGBTest_0600 result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('r=128,g=128,b=128');

      console.info('DepthColorRGBTest_0600 END');
      done();
    });
  })
}   