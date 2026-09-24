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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium-dynamic"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function VideoSevenApiNullUndefinedTest() {
  describe('VideoSevenApiNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoSevenApiNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Video/VideoSevenApiNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoSevenApiNullUndefined state pages: " + JSON.stringify(pages));
        if (!("VideoSevenApiNullUndefined" == pages.name)) {
          console.info("get VideoSevenApiNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoSevenApiNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoSevenApiNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   VideoSevenApiNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_VideoSevenApiNullUndefinedTest_0100
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoSevenApiNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[VideoSevenApiNullUndefinedTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('SetVideoStart'));
      await button1.click();
      await CommonFunc.sleep(1000);
      
      let button2 = await driver.findComponent(ON.id('SetRequestFullscreenNUll'));
      await button2.click();
      await CommonFunc.sleep(1000);
      
      let button3 = await driver.findComponent(ON.id('SetRequestFullscreenNUll'));
      await button3.click();
      await CommonFunc.sleep(1000);
      
      let strJson1 = getInspectorByKey('VideoSevenApiNull');
      let strJson2 = getInspectorByKey('VideoSevenApiUndefined');

      expect(JSON.parse(strJson1).$type).assertEqual('Video');
      expect(JSON.parse(strJson2).$type).assertEqual('Video');
      
      console.info('[VideoSevenApiNullUndefinedTest_0100] END');
      done();
    });
  })
}
