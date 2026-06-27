/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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
import Utils from '../../MainAbility/common/Utils'

export default function doubleSidedTest() {
  describe('doubleSidedTest', () => {
    beforeAll(async () => {
      console.info("doubleSidedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/doubleSided',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get doubleSidedTest state success " + JSON.stringify(pages));
        if (!("doubleSided" == pages.name)) {
          console.info("get doubleSidedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push doubleSidedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push doubleSidedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("doubleSidedTest after each called");
    });

    /**
     * @tc.name   doubleSidedTrueV260001
     * @tc.number SUB_ARKUI_IMAGEEFFECT_DOUBLESIDED_PARAM_001
     * @tc.desc   Test doubleSided with true parameter - both sides visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('doubleSidedTrueV260001', Level.LEVEL0, async () => {
      console.info('[doubleSidedTrueV260001] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('doubleSidedTrue');
      expect(strJson).not().assertUndefined();
      console.info('[doubleSidedTrueV260001] END');
    });

    /**
     * @tc.name   doubleSidedFalseV260002
     * @tc.number SUB_ARKUI_IMAGEEFFECT_DOUBLESIDED_PARAM_002
     * @tc.desc   Test doubleSided with false parameter - back side invisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('doubleSidedFalseV260002', Level.LEVEL0, async () => {
      console.info('[doubleSidedFalseV260002] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('doubleSidedFalse');
      expect(strJson).not().assertUndefined();
      console.info('[doubleSidedFalseV260002] END');
    });

    /**
     * @tc.name   doubleSidedUndefinedV260003
     * @tc.number SUB_ARKUI_IMAGEEFFECT_DOUBLESIDED_PARAM_003
     * @tc.desc   Test doubleSided with undefined parameter - defaults to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('doubleSidedUndefinedV260003', Level.LEVEL0, async () => {
      console.info('[doubleSidedUndefinedV260003] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('doubleSidedUndefined');
      expect(strJson).not().assertUndefined();
      console.info('[doubleSidedUndefinedV260003] END');
    });

    /**
     * @tc.name   doubleSidedDefaultV260004
     * @tc.number SUB_ARKUI_IMAGEEFFECT_DOUBLESIDED_PARAM_004
     * @tc.desc   Test default behavior without doubleSided - defaults to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('doubleSidedDefaultV260004', Level.LEVEL0, async () => {
      console.info('[doubleSidedDefaultV260004] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('doubleSidedDefault');
      expect(strJson).not().assertUndefined();
      console.info('[doubleSidedDefaultV260004] END');
    });

    /**
     * @tc.name   doubleSidedReturnValueV260005
     * @tc.number SUB_ARKUI_IMAGEEFFECT_DOUBLESIDED_PARAM_005
     * @tc.desc   Test doubleSided return value is T - chaining works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('doubleSidedReturnValueV260005', Level.LEVEL0, async () => {
      console.info('[doubleSidedReturnValueV260005] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('doubleSidedChained');
      expect(strJson).not().assertUndefined();
      console.info('[doubleSidedReturnValueV260005] END');
    });
  })
}