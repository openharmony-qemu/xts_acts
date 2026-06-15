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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function VideoSupportMoreNumberSpeedTest() {
  describe('VideoSupportMoreNumberSpeedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoSupportMoreNumberSpeedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Video/VideoSupportMoreNumberSpeed",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoSupportMoreNumberSpeed state pages: " + JSON.stringify(pages));
        if (!("VideoSupportMoreNumberSpeed" == pages.name)) {
          console.info("get VideoSupportMoreNumberSpeed state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoSupportMoreNumberSpeed success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoSupportMoreNumberSpeed page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   VideoSupportMoreNumberSpeedTest_0100
     * @tc.number SUB_ARKUI_API_VideoSupportMoreNumberSpeedTest_0100
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoSupportMoreNumberSpeedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[VideoSupportMoreNumberSpeedTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeedStart'));
      await button.click();
      await Utils.sleep(1000)

      let button1 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_0.025'));
      await button1.click();
      await Utils.sleep(1000)
      let strJson1 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button2 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_0.125'));
      await button2.click();
      await Utils.sleep(1000)
      let strJson2 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button3 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_0.5'));
      await button3.click();
      await Utils.sleep(1000)
      let strJson3 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button4 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_1'));
      await button4.click();
      await Utils.sleep(1000)
      let strJson4 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button5 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_2'));
      await button5.click();
      await Utils.sleep(1000)
      let strJson5 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button6 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_3'));
      await button6.click();
      await Utils.sleep(1000)
      let strJson6 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button7 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_4'));
      await button7.click();
      await Utils.sleep(1000)
      let strJson7 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button8 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_5'));
      await button8.click();
      await Utils.sleep(1000)
      let strJson8 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button9 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_6'));
      await button9.click();
      await Utils.sleep(1000)
      let strJson9 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button10 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_7'));
      await button10.click();
      await Utils.sleep(1000)
      let strJson10 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button11 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_8'));
      await button11.click();
      await Utils.sleep(1000)
      let strJson11 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button12 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_9'));
      await button12.click();
      await Utils.sleep(1000)
      let strJson12 = getInspectorByKey('VideoSupportMoreNumberSpeedText');

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0.025');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0.125');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('0.5');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('1');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('2');
      expect(JSON.parse(strJson6).$attrs.content).assertEqual('3');
      expect(JSON.parse(strJson7).$attrs.content).assertEqual('4');
      expect(JSON.parse(strJson8).$attrs.content).assertEqual('5');
      expect(JSON.parse(strJson9).$attrs.content).assertEqual('6');
      expect(JSON.parse(strJson10).$attrs.content).assertEqual('7');
      expect(JSON.parse(strJson11).$attrs.content).assertEqual('8');
      expect(JSON.parse(strJson12).$attrs.content).assertEqual('9');
      
      console.info('[VideoSupportMoreNumberSpeedTest_0100] END');
      done();
    });
  })
}
