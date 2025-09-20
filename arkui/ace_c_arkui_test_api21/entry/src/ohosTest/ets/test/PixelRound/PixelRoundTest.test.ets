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

import { expect, describe, it, beforeEach, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function PixelRoundTest() {
  describe('PixelRoundTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PixelRound beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PixelRound/PixelRoundPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PixelRound state pages:" + JSON.stringify(pages));
        if (!("PixelRoundPage" == pages.name)) {
          console.info("get PixelRound pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push PixelRound page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PixelRound page error:" + err);
      }
      console.info("PixelRound beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("PixelRound after each called");
    });

    /**
     * @tc.number     PixelRoundTest_0100
     * @tc.name       PixelRoundTest_0100
     * @tc.desc       Test PixelRound ErrorCode
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('PixelRoundTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[PixelRoundTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // get
      let strJson = getInspectorByKey('PixelRoundPage_PixelRound_content');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PixelRoundTest_0100] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:error,left:error,bottom:error,right:error');

      console.info('[PixelRoundTest_0100] END');
      done();
    });

    /**
     * @tc.number     PixelRoundTest_0200
     * @tc.name       PixelRoundTest_0200
     * @tc.desc       Test PixelRound
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('PixelRoundTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[PixelRoundTest_0200] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // set
      let button = await driver.findComponent(ON.id('PixelRoundPage_top_Btn'));
      await button.click();
      console.info("[PixelRoundTest_0200] click PixelRoundPage_top_Btn.");
      await Utils.sleep(1000);

      let rect = Utils.getComponentRect("PixelRoundPage_testFlex");
      console.info("[PixelRoundTest_0200] (rect.right - rect.left - vp2px(111)): " + (rect.right - rect.left - vp2px(111)));
      console.info("[PixelRoundTest_0200] (rect.bottom - rect.top - vp2px(111)): " + (rect.bottom - rect.top - vp2px(111)));
      expect(Math.floor(Math.abs(rect.right - rect.left - vp2px(111)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(rect.bottom - rect.top - vp2px(111))) <= 1).assertTrue();

      // get
      let strJson = getInspectorByKey('PixelRoundPage_PixelRound_content');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PixelRoundTest_0200] obj.$attrs.content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('top:0,left:1,bottom:2,right:2');

      console.info('[PixelRoundTest_0200] END');
      done();
    });
  })
}