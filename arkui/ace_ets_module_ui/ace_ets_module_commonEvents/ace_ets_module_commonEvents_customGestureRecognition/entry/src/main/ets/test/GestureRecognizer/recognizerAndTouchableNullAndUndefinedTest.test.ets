/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
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

export default function recognizerAndTouchableNullAndUndefinedTest() {
  describe('recognizerAndTouchableNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("recognizerAndTouchableNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/RecognizerAndTouchableNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get recognizerAndTouchableNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("RecognizerAndTouchableNullAndUndefined" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push recognizerAndTouchableNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push recognizerAndTouchableNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   setEnabledNullV3001
     * @tc.number SUB_ARKUI_GESTURERECOGNIZER_SETENABLED_PARAM_001
     * @tc.desc   Test GestureRecognizer.setEnabled with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setEnabledNullV3001', Level.LEVEL0, async () => {
      console.info('[setEnabledNullV3001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let host = await driver.findComponent(ON.id('gestureHostNull'));
      await host.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('gestureResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setEnabledNullV3001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[setEnabledNullV3001] END');
    });

    /**
     * @tc.name   setEnabledUndefinedV3002
     * @tc.number SUB_ARKUI_GESTURERECOGNIZER_SETENABLED_PARAM_002
     * @tc.desc   Test GestureRecognizer.setEnabled with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setEnabledUndefinedV3002', Level.LEVEL0, async () => {
      console.info('[setEnabledUndefinedV3002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let host = await driver.findComponent(ON.id('gestureHostUndefined'));
      await host.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('gestureResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setEnabledUndefinedV3002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[setEnabledUndefinedV3002] END');
    });

    /**
     * @tc.name   touchableNullV3003
     * @tc.number SUB_ARKUI_COMMONMETHOD_TOUCHABLE_PARAM_003
     * @tc.desc   Test CommonMethod.touchable with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('touchableNullV3003', Level.LEVEL0, async () => {
      console.info('[touchableNullV3003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnTouchableNull'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('touchableBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[touchableNullV3003] touchable attr: " + JSON.stringify(obj.$attrs.touchable));
      expect(obj.$attrs.touchable).assertEqual(true);
      console.info('[touchableNullV3003] END');
    });

    /**
     * @tc.name   touchableUndefinedV3004
     * @tc.number SUB_ARKUI_COMMONMETHOD_TOUCHABLE_PARAM_004
     * @tc.desc   Test CommonMethod.touchable with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('touchableUndefinedV3004', Level.LEVEL0, async () => {
      console.info('[touchableUndefinedV3004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnTouchableUndefined'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('touchableBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[touchableUndefinedV3004] touchable attr: " + JSON.stringify(obj.$attrs.touchable));
      expect(obj.$attrs.touchable).assertEqual(true);
      console.info('[touchableUndefinedV3004] END');
    });
  })
}
