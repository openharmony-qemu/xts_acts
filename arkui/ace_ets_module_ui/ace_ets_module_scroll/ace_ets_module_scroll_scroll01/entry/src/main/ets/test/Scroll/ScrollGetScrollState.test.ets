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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function scrollGetScrollState() {
  describe('scrollGetScrollState', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollGetScrollState beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollGetScrollState",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("scrollGetScrollState" == pages.name)) {
          console.info("get scrollGetScrollState pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollGetScrollState page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollGetScrollState page error:" + err);
      }
      console.info("scrollGetScrollState beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let resetBtn: Component = await driver.findComponent(ON.id('getScrollState_reset'));
      await resetBtn.click();
      await CommonFunc.sleep(1500);
      AppStorage.delete('getScrollState_lastResult');
      AppStorage.delete('getScrollState_stateRecord');
      console.info("scrollGetScrollState afterEach called");
    });

    // ========== getScrollState with no param ==========
    /**
     * @tc.name   scrollGetScrollState_0100
     * @tc.number SUB_ARKUI_SCROLL_GETSCROLLSTATE_TEST_0100
     * @tc.desc   Test Scroller getScrollState with no parameter in idle state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollGetScrollState_0100', Level.LEVEL0, async () => {
      console.info('[scrollGetScrollState_0100] START');
      let driver = Driver.create();
      let defaultBtn = await driver.findComponent(ON.id('getScrollState_default'));
      await defaultBtn.click();
      await CommonFunc.sleep(500);

      console.info('[scrollGetScrollState_0100] result: ' + AppStorage.get('getScrollState_lastResult'));
      expect(AppStorage.get('getScrollState_lastResult')).assertEqual("Idle");
      console.info('[scrollGetScrollState_0100] END');
    })

    // ========== getScrollState during scrolling ==========
    /**
     * @tc.name   scrollGetScrollState_0200
     * @tc.number SUB_ARKUI_SCROLL_GETSCROLLSTATE_TEST_0200
     * @tc.desc   Test Scroller getScrollState returns Scroll during dragging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollGetScrollState_0200', Level.LEVEL1, async () => {
      console.info('[scrollGetScrollState_0200] START');
      let driver = await Driver.create()
      let resetRecordBtn = await driver.findComponent(ON.id('getScrollState_resetRecord'));
      await resetRecordBtn.click();
      await CommonFunc.sleep(300);

      let scrollComp = await driver.findComponent(ON.id('scrollGetScrollState_scroll'))
      let scrollRect = await scrollComp.getBounds()
      let displayId = await scrollComp.getDisplayId()
      let top = scrollRect.top;
      let right = scrollRect.right;
      let left = scrollRect.left;
      let bottom = scrollRect.bottom;
      console.info("scrollGetScrollState_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.dragBetween(
        {x: Math.round(left + width / 2), y: Math.round(top + height * 0.8), displayId: displayId},
        {x: Math.round(left + width / 2), y: Math.round(top + height * 0.2), displayId: displayId});
      await CommonFunc.sleep(300);

      let record: string = `${AppStorage.get('getScrollState_stateRecord')}`;
      console.info('[scrollGetScrollState_0200] stateRecord: ' + record);
      expect(record.includes('Scroll')).assertTrue();
      console.info('[scrollGetScrollState_0200] END');
    })

    /**
     * @tc.name   scrollGetScrollState_0300
     * @tc.number SUB_ARKUI_SCROLL_GETSCROLLSTATE_TEST_0300
     * @tc.desc   Test Scroller getScrollState returns Fling during inertia scrolling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollGetScrollState_0300', Level.LEVEL1, async () => {
      console.info('[scrollGetScrollState_0300] START');
      let driver = await Driver.create()
      let resetRecordBtn = await driver.findComponent(ON.id('getScrollState_resetRecord'));
      await resetRecordBtn.click();
      await CommonFunc.sleep(300);

      let scrollComp = await driver.findComponent(ON.id('scrollGetScrollState_scroll'))
      let scrollRect = await scrollComp.getBounds()
      let displayId = await scrollComp.getDisplayId()
      let top = scrollRect.top;
      let right = scrollRect.right;
      let left = scrollRect.left;
      let bottom = scrollRect.bottom;
      console.info("scrollGetScrollState_0300 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      await driver.fling(
        {x: Math.round(left + width / 2), y: Math.round(top + height * 0.6), displayId: displayId},
        {x: Math.round(left + width / 2), y: Math.round(top + height * 0.2), displayId: displayId},
        5, 1000);
      await CommonFunc.sleep(500);

      let record: string = `${AppStorage.get('getScrollState_stateRecord')}`;
      console.info('[scrollGetScrollState_0300] stateRecord: ' + record);
      expect(record.includes('Fling')).assertTrue();
      console.info('[scrollGetScrollState_0300] END');
    })

    /**
     * @tc.name   scrollGetScrollState_0400
     * @tc.number SUB_ARKUI_SCROLL_GETSCROLLSTATE_TEST_0400
     * @tc.desc   Test Scroller getScrollState returns Idle after scrolling stopped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollGetScrollState_0400', Level.LEVEL1, async () => {
      console.info('[scrollGetScrollState_0400] START');
      let driver = await Driver.create()
      let scrollComp = await driver.findComponent(ON.id('scrollGetScrollState_scroll'))
      let scrollRect = await scrollComp.getBounds()
      let displayId = await scrollComp.getDisplayId()
      let top = scrollRect.top;
      let right = scrollRect.right;
      let left = scrollRect.left;
      let bottom = scrollRect.bottom;
      let height = bottom - top;
      let width = right - left;
      await driver.fling(
        {x: Math.round(left + width / 2), y: Math.round(top + height * 0.6), displayId: displayId},
        {x: Math.round(left + width / 2), y: Math.round(top + height * 0.2), displayId: displayId},
        5, 1000);
      await CommonFunc.sleep(2500);

      let defaultBtn = await driver.findComponent(ON.id('getScrollState_default'));
      await defaultBtn.click();
      await CommonFunc.sleep(500);

      console.info('[scrollGetScrollState_0400] result: ' + AppStorage.get('getScrollState_lastResult'));
      expect(AppStorage.get('getScrollState_lastResult')).assertEqual("Idle");
      console.info('[scrollGetScrollState_0400] END');
    })

    // ========== getScrollState error code tests ==========
    /**
     * @tc.name   scrollGetScrollState_0500
     * @tc.number SUB_ARKUI_SCROLL_GETSCROLLSTATE_TEST_0500
     * @tc.desc   Test Scroller getScrollState throws error 100004 when scroller not bound to component
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollGetScrollState_0500', Level.LEVEL0, async () => {
      console.info('[scrollGetScrollState_0500] START');
      let driver = Driver.create();
      let unboundBtn = await driver.findComponent(ON.id('getScrollState_unbound'));
      await unboundBtn.click();
      await CommonFunc.sleep(500);

      console.info('[scrollGetScrollState_0500] result: ' + AppStorage.get('getScrollState_lastResult'));
      expect(AppStorage.get('getScrollState_lastResult')).assertEqual("100004");
      console.info('[scrollGetScrollState_0500] END');
    })
  })
}
