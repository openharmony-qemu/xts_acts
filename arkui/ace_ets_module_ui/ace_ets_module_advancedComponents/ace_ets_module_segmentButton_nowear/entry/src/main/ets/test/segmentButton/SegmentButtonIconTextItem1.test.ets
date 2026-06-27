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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils, { InspectorNode } from '../Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonIconTextItem1() {
  describe('SegmentButtonIconTextItem1', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonIconTextItem1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonIconTextItem1",
      }
      try {
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (pages.name !== "SegmentButtonIconTextItem1") {
          router.clear();
          console.info("get SegmentButtonIconTextItem1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonIconTextItem1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonIconTextItem1 page error:" + err);
      }
      console.info("SegmentButtonIconTextItem1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonIconTextItem1 after each called");
    });

    /**
     * @tc.name   SegmentButtonIconTextItem1_001
     * @tc.number SegmentButtonIconTextItem1_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonIconTextItem1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonIconTextItem1_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SegmentButtonIconTextItem101"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: InspectorNode = Utils.navigateInspectorPath(
        'SegmentButtonIconTextItem1.test_obj_1', [0, 0, 0, 0, 0, 2, 3, 0, 0, 0]);;
      console.info("[SegmentButtonIconTextItem1_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.src).assertEqual('resource:///125830170.svg');
      await CommonFunc.sleep(1000);
      let selecticon: InspectorNode = Utils.navigateInspectorPath(
        'SegmentButtonIconTextItem1.test_selecticon_2', [0, 0, 0, 0, 0, 2, 0, 0, 0, 0]);;
      console.info("[SegmentButtonIconTextItem1_001] component selecticon is: " + JSON.stringify(selecticon));
      expect(selecticon.$attrs.src).assertEqual('resource:///125830169.svg');
      console.info('[SegmentButtonIconTextItem1_001] END');
      done();
    });


    /**
     * @tc.name   SegmentButtonIconTextItem1_002
     * @tc.number SegmentButtonIconTextItem1_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonIconTextItem1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonIconTextItem1_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = await Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SegmentButtonIconTextItem102"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: InspectorNode = Utils.navigateInspectorPath(
        'SegmentButtonIconTextItem1.test_obj_3', [0, 0, 0, 0, 0, 2, 3, 0, 0, 0]);
      console.info("[SegmentButtonIconTextItem1_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.src).assertEqual('resource:///125830170.svg');
      await CommonFunc.sleep(1000);
      let selecticon: InspectorNode = Utils.navigateInspectorPath(
        'SegmentButtonIconTextItem1.test_selecticon_4', [0, 0, 0, 0, 0, 2, 0, 0, 0, 0]);
      console.info("[SegmentButtonIconTextItem1_002] component selecticon is: " + JSON.stringify(selecticon));
      expect(selecticon.$attrs.src).assertEqual('resource:///125830169.svg');
      await CommonFunc.sleep(1000);
      let textLabel: Component = await driver.findComponent(ON.text('text1'));
      console.info("[SegmentButtonIconTextItem1_002] text1 visible: " + (textLabel !== null));
      expect(!!textLabel).assertTrue();
      console.info('[SegmentButtonIconTextItem1_002] END');
      done();
    });
  })
}
