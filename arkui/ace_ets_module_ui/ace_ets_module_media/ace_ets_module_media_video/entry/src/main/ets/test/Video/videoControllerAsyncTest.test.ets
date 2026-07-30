/**
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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function videoControllerAsyncTest() {
  describe('videoControllerAsyncTest', () => {
    beforeEach(async (done: Function) => {
      console.info("videoControllerAsyncTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Video/videoControllerAsync",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get videoControllerAsync state pages: " + JSON.stringify(pages));
        if (!("videoControllerAsync" == pages.name)) {
          console.info("get videoControllerAsync state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push videoControllerAsync success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push videoControllerAsync page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   videoControllerAsyncTest_0100
     * @tc.number SUB_ARKUI_API_videoControllerAsyncTest_0100
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('videoControllerAsyncTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[videoControllerAsyncTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let button = await driver.findComponent(ON.id('videoControllerAsyncSetNull'));
      await button.click();
      await Utils.sleep(2000);

      let button1 = await driver.findComponent(ON.id('videoControllerAsyncSetUndefined'));
      await button1.click();
      await Utils.sleep(2000);
     
      let button2 = await driver.findComponent(ON.id('videoControllerAsyncSetFalse'));
      await button2.click();
      await Utils.sleep(2000);
    
      let strJson = getInspectorByKey('videoControllerAsyncText');

      let button3 = await driver.findComponent(ON.id('videoControllerAsyncStart'));
      await button3.click();
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('videoControllerAsyncText');
      let strJson2 = getInspectorByKey('videoControllerAsyncText1');

      let button4 = await driver.findComponent(ON.id('videoControllerAsyncPause'));
      await button4.click();
      await Utils.sleep(2000);
      let strJson3 = getInspectorByKey('videoControllerAsyncText');

      let button5 = await driver.findComponent(ON.id('videoControllerAsyncSetTime'));
      await button5.click();
      await Utils.sleep(2000);
      let strJson4 = getInspectorByKey('videoControllerAsyncText');

      let button6 = await driver.findComponent(ON.id('videoControllerAsyncStop'));
      await button6.click();
      await Utils.sleep(2000);
      let strJson5 = getInspectorByKey('videoControllerAsyncText');

      let button7 = await driver.findComponent(ON.id('videoControllerAsyncReset'));
      await button7.click();
      await Utils.sleep(2000);
      let strJson6 = getInspectorByKey('videoControllerAsyncText');
      let strJson7 = getInspectorByKey('videoControllerAsyncText1');

      let button8 = await driver.findComponent(ON.id('videoControllerAsyncRequestFullscreen'));
      await button8.click();
      await Utils.sleep(3000);
      let strJson8 = getInspectorByKey('videoControllerAsyncText');

      let button9 = await driver.findComponent(ON.id('videoControllerAsyncStart'));
      await button9.click();
      await Utils.sleep(20000);
      let strJson9 = getInspectorByKey('videoControllerAsyncText');

      let button10 = await driver.findComponent(ON.id('videoControllerAsyncSetTime1'));
      await button10.click();
      await Utils.sleep(1000);

      let button11 = await driver.findComponent(ON.id('videoControllerAsyncSetTime2'));
      await button11.click();
      await Utils.sleep(1000);

      let button12 = await driver.findComponent(ON.id('videoControllerAsyncSetTime3'));
      await button12.click();
      await Utils.sleep(1000);
      
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onPrepared');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onStart');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onUpdate');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('onPause');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('setCurrentTime');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('onStop');
      expect(JSON.parse(strJson6).$attrs.content).assertEqual('onPrepared');
      expect(JSON.parse(strJson7).$attrs.content).assertEqual('reset');
      expect(JSON.parse(strJson8).$attrs.content).assertEqual('onFullscreenChange_false');
      expect(JSON.parse(strJson9).$attrs.content).assertEqual('onFinish');

      console.info('[videoControllerAsyncTest_0100] END');
      done();
    });

  })
}
