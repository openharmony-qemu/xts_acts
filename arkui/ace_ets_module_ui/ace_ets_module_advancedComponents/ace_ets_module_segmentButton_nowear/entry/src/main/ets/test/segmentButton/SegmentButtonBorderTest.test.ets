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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils, { InspectorNode } from '../Utils';
import CommonFunc from '../../MainAbility/common/Common';

function expectUniformRadius(radius: Object | undefined, vp: string): void {
  expect(radius !== undefined).assertTrue();
  const serialized = JSON.stringify(radius);
  const asString = `"${vp}"`;
  if (serialized === asString) {
    expect(serialized).assertEqual(asString);
    return;
  }
  expect(serialized).assertEqual(JSON.stringify({
    topLeft: vp,
    topRight: vp,
    bottomLeft: vp,
    bottomRight: vp
  }));
}

export default function SegmentButtonBorderTest() {
  describe('SegmentButtonBorderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonBorderTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonBorder",
      }
      try {
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        router.clear();
        if (!("SegmentButtonBorder" == pages.name)) {
          console.info("get SegmentButtonBorderTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonBorderTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonBorderTest page error:" + err);
      }
      console.info("SegmentButtonBorderTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonBorderTest after each called");
    });

    /**
     * @tc.name   SegmentButtonBorderTest_001
     * @tc.number SegmentButtonBorderTest_001
     * @tc.desc   Default rounded corners take effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonBorderTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonBorderTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let obj: InspectorNode = Utils.navigateInspectorPath('SegmentButtonBorderTest.test_obj_1', [0, 0, 0, 0, 0, 1, 0, 0]);
      console.info("[SegmentButtonBorderTest_001_1] component obj is: " + JSON.stringify(obj));
      expectUniformRadius(obj.$attrs.borderRadius, '14.00vp');
      await CommonFunc.sleep(1000);
      let obj2: InspectorNode = Utils.navigateInspectorPath('SegmentButtonBorderTest.test_obj2_2', [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]);
      console.info("[SegmentButtonBorderTest_001_2]  component obj is: " + JSON.stringify(obj2));
      expectUniformRadius(obj2.$attrs.borderRadius, '12.00vp');
      console.info('[SegmentButtonBorderTest_001] END');
      done();
    });

    /**
     * @tc.name   SegmentButtonBorderTest_002
     * @tc.number SegmentButtonBorderTest_002
     * @tc.desc   Default rounded corners take effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonBorderTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonBorderTest_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let obj3: InspectorNode = Utils.navigateInspectorPath('SegmentButtonBorderTest.test_obj3_3', [0, 0, 0, 0, 0, 3, 0, 0]);
      console.info("[SegmentButtonBorderTest_002_1] component obj is: " + JSON.stringify(obj3));
      expectUniformRadius(obj3.$attrs.borderRadius, '20.00vp');
      await CommonFunc.sleep(1000);
      let obj4: InspectorNode = Utils.navigateInspectorPath('SegmentButtonBorderTest.test_obj4_4', [0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0]);
      console.info("[SegmentButtonBorderTest_002_2] component obj is: " + JSON.stringify(obj4));
      expectUniformRadius(obj4.$attrs.borderRadius, '18.00vp');
      console.info('[SegmentButtonBorderTest_002] END');
      done();
    });
  })
}