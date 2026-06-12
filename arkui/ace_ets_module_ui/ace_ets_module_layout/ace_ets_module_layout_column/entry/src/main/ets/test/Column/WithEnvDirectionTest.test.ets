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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function WithEnvDirectionTest() {
  describe('WithEnvDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WithEnvDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/WithEnvDirection',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WithEnvDirection state pages:" + JSON.stringify(pages));
        if (!("WithEnvDirection" == pages.name)) {
          console.info("get WithEnvDirection pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push WithEnvDirection page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WithEnvDirection page error:" + err);
      }
      console.info("WithEnvDirection beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   WithEnvDirectionTest_0100
     * @tc.number SUB_ARKUI_API_WithEnvDirectionTest_0100
     * @tc.desc   ArkUI API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WithEnvDirectionTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[WithEnvDirectionTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('WithEnvDirectionText1');
      let strJson1 = getInspectorByKey('WithEnvDirectionText2');

      let button = await driver.findComponent(ON.id('SetDirectionLtrButton'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('WithEnvDirectionText1');
      let strJson3 = getInspectorByKey('WithEnvDirectionText2');

      let button1 = await driver.findComponent(ON.id('SetDirectionAutoButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson4 = getInspectorByKey('WithEnvDirectionText1');
      let strJson5 = getInspectorByKey('WithEnvDirectionText2');

      let button2 = await driver.findComponent(ON.id('SetDirectionRtlButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson6 = getInspectorByKey('WithEnvDirectionText1');
      let strJson7 = getInspectorByKey('WithEnvDirectionText2');

      let button3 = await driver.findComponent(ON.id('SetDirectionUndefinedButton'));
      await button3.click();
      await CommonFunc.sleep(2000);
      let strJson8 = getInspectorByKey('WithEnvDirectionText1');
      let strJson9 = getInspectorByKey('WithEnvDirectionText2');

      expect(JSON.parse(strJson).$attrs.direction).assertEqual('Direction.Auto');
      expect(JSON.parse(strJson1).$attrs.direction).assertEqual('Direction.Auto');
      expect(JSON.parse(strJson2).$attrs.direction).assertEqual('Direction.Ltr');
      expect(JSON.parse(strJson3).$attrs.direction).assertEqual('Direction.Ltr');
      expect(JSON.parse(strJson4).$attrs.direction).assertEqual('Direction.Auto');
      expect(JSON.parse(strJson5).$attrs.direction).assertEqual('Direction.Auto');
      expect(JSON.parse(strJson6).$attrs.direction).assertEqual('Direction.Rtl');
      expect(JSON.parse(strJson7).$attrs.direction).assertEqual('Direction.Rtl');
      expect(JSON.parse(strJson8).$attrs.direction).assertEqual('Direction.Auto');
      expect(JSON.parse(strJson9).$attrs.direction).assertEqual('Direction.Auto');

      console.info('[WithEnvDirectionTest_0100] END');
      done();
    });

    /**
     * @tc.name   WithEnvDirectionTest_0200
     * @tc.number SUB_ARKUI_API_WithEnvDirectionTest_0200
     * @tc.desc   ArkUI API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WithEnvDirectionTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[WithEnvDirectionTest_0200] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let text1: RectValue = CommonFunc.getComponentRect('WithEnvDirectionText1');
      let text2: RectValue = CommonFunc.getComponentRect('WithEnvDirectionText2');

      let button = await driver.findComponent(ON.id('SetLanguageUg'));
      await button.click();
      await CommonFunc.sleep(2000);
      let text3: RectValue = CommonFunc.getComponentRect('WithEnvDirectionText1');
      let text4: RectValue = CommonFunc.getComponentRect('WithEnvDirectionText2');
      let strJson = getInspectorByKey('WithEnvDirectionText1');
      let strJson1 = getInspectorByKey('WithEnvDirectionText2');

      let button1 = await driver.findComponent(ON.id('SetDirectionLtrButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('WithEnvDirectionText1');
      let strJson3 = getInspectorByKey('WithEnvDirectionText2');

      let button2 = await driver.findComponent(ON.id('SetDirectionRtlButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson4 = getInspectorByKey('WithEnvDirectionText1');
      let strJson5 = getInspectorByKey('WithEnvDirectionText2');

      expect(text1.right - text2.left < 0).assertTrue();
      expect(text3.left - text4.right > 0).assertTrue();
      expect(JSON.parse(strJson).$attrs.direction).assertEqual('Direction.Auto');
      expect(JSON.parse(strJson1).$attrs.direction).assertEqual('Direction.Auto');
      expect(JSON.parse(strJson2).$attrs.direction).assertEqual('Direction.Ltr');
      expect(JSON.parse(strJson3).$attrs.direction).assertEqual('Direction.Ltr');
      expect(JSON.parse(strJson4).$attrs.direction).assertEqual('Direction.Rtl');
      expect(JSON.parse(strJson5).$attrs.direction).assertEqual('Direction.Rtl');

      console.info('[WithEnvDirectionTest_0200] END');
      done();
    });

  })
}