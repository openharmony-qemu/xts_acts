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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonV2HybridTest() {
  describe('SegmentButtonV2HybridTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonV2HybridTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/SegmentButtonV2Hybrid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonV2Hybrid" == pages.name)) {
          console.info("get SegmentButtonV2HybridTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonV2HybridTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonV2HybridTest page error:" + err);
      }
      console.info("SegmentButtonV2HybridTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SegmentButtonV2HybridTest after each called');
    });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0100
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0100
     * @tc.desc   Test SegmentButtonV2Item.isHybrid returns true for item with text+symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0100] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnHybrid: Component = await driver.findComponent(ON.id('btn_isHybrid_hybrid'));
          await btnHybrid.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('isHybrid_result1'));
          console.info('[SegmentButtonV2HybridTest_0100] isHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content).assertEqual('true');
          console.info('[SegmentButtonV2HybridTest_0100] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0100] error: ' + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0200
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0200
     * @tc.desc   Test SegmentButtonV2Item.isHybrid returns false for item with text only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0200] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnTextOnly: Component = await driver.findComponent(ON.id('btn_isHybrid_textOnly'));
          await btnTextOnly.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('isHybrid_result2'));
          console.info('[SegmentButtonV2HybridTest_0200] isHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content).assertEqual('false');
          console.info('[SegmentButtonV2HybridTest_0200] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0200] error: ' + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0300
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0300
     * @tc.desc   Test SegmentButtonV2Item.isHybrid returns true for item with text+icon (no symbol)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0300] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnIconOnly: Component = await driver.findComponent(ON.id('btn_isHybrid_iconOnly'));
          await btnIconOnly.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('isHybrid_result3'));
          console.info('[SegmentButtonV2HybridTest_0300] isHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content).assertEqual('true');
          console.info('[SegmentButtonV2HybridTest_0300] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0300] error: ' + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0400
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0400
     * @tc.desc   Test SegmentButtonV2Item.isHybrid returns true for item with text+icon+symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0400] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnTextIconSymbol: Component = await driver.findComponent(ON.id('btn_isHybrid_textIconSymbol'));
          await btnTextIconSymbol.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('isHybrid_result4'));
          console.info('[SegmentButtonV2HybridTest_0400] isHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content).assertEqual('true');
          console.info('[SegmentButtonV2HybridTest_0400] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0400] error: ' + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0500
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0500
     * @tc.desc   Test SegmentButtonV2Items.hasHybrid returns true when items contain symbol item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0500] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnWithHybrid: Component = await driver.findComponent(ON.id('btn_hasHybrid_withHybrid'));
          await btnWithHybrid.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('hasHybrid_result1'));
          console.info('[SegmentButtonV2HybridTest_0500] hasHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content).assertEqual('true');
          console.info('[SegmentButtonV2HybridTest_0500] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0500] error: ' + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0600
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0600
     * @tc.desc   Test SegmentButtonV2Items.hasHybrid returns true when items have no symbol item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0600] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnWithoutHybrid: Component = await driver.findComponent(ON.id('btn_hasHybrid_withoutHybrid'));
          await btnWithoutHybrid.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('hasHybrid_result2'));
          console.info('[SegmentButtonV2HybridTest_0600] hasHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content).assertEqual('true');
          console.info('[SegmentButtonV2HybridTest_0600] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0600] error: ' + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0700
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0700
     * @tc.desc   Test SegmentButtonV2Items.hasHybrid returns false when items only contain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0700] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnTextOnly: Component = await driver.findComponent(ON.id('btn_hasHybrid_textOnly'));
          await btnTextOnly.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('hasHybrid_result3'));
          console.info('[SegmentButtonV2HybridTest_0700] hasHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content).assertEqual('false');
          console.info('[SegmentButtonV2HybridTest_0700] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0700] error: ' + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0800
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0800
     * @tc.desc   Test SegmentButtonV2Item.isHybrid return type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0800] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnHybrid: Component = await driver.findComponent(ON.id('btn_isHybrid_hybrid'));
          await btnHybrid.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('isHybrid_result1'));
          console.info('[SegmentButtonV2HybridTest_0800] isHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content === 'true' || obj.$attrs.content === 'false').assertTrue();
          console.info('[SegmentButtonV2HybridTest_0800] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0800] error: ' + err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SegmentButtonV2HybridTest_0900
     * @tc.number SUB_ARKUI_ACE_SegmentButtonV2HybridTest_0900
     * @tc.desc   Test SegmentButtonV2Items.hasHybrid return type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2HybridTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info('[SegmentButtonV2HybridTest_0900] START');
          let driver: Driver = Driver.create();
          await CommonFunc.sleep(500);
          let btnWithHybrid: Component = await driver.findComponent(ON.id('btn_hasHybrid_withHybrid'));
          await btnWithHybrid.click();
          await CommonFunc.sleep(500);
          let obj: ESObject = JSON.parse(getInspectorByKey('hasHybrid_result1'));
          console.info('[SegmentButtonV2HybridTest_0900] hasHybrid result: ' + obj.$attrs.content);
          expect(obj.$attrs.content === 'true' || obj.$attrs.content === 'false').assertTrue();
          console.info('[SegmentButtonV2HybridTest_0900] END');
          done();
        } catch (err) {
          console.error('[SegmentButtonV2HybridTest_0900] error: ' + err);
          expect().assertFail();
          done();
        }
      });

  })
}
