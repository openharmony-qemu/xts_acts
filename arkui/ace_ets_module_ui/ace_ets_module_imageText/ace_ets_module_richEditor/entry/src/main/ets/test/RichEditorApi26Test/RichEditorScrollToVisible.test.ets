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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function RichEditorScrollToVisibleTest() {
  describe('RichEditorScrollToVisibleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorScrollToVisibleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/RichEditorScrollToVisible',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorScrollToVisible state pages: " + JSON.stringify(pages));
        if (!("RichEditorScrollToVisible" == pages.name)) {
          console.info("get RichEditorScrollToVisible state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorScrollToVisible success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorScrollToVisible page error: " + err);
        expect().assertFail();
      }
      done();
    })
    afterAll(async () => {
      AppStorage.delete('scrollToVisibleNoParam');
      AppStorage.delete('scrollToVisibleNullParam');
      AppStorage.delete('scrollToVisibleUndefinedParam');
      AppStorage.delete('scrollToVisibleNormalRange');
      AppStorage.delete('scrollToVisibleStartNegative');
      AppStorage.delete('scrollToVisibleEndOverflow');
      AppStorage.delete('scrollToVisibleStartGreaterEnd');
    })

    /**
     * @tc.name   richEditorScrollToVisible_no_param_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SCROLLTOVISIBLE_PARAM_0100
     * @tc.desc   Test RichEditor scrollToVisible with no parameter triggers onContentScroll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('richEditorScrollToVisible_no_param_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorScrollToVisible_no_param_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_no_param'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('scrollToVisibleNoParam')).assertEqual('success');

      console.info('[richEditorScrollToVisible_no_param_0100] END');
      done();
    })

    /**
     * @tc.name   richEditorScrollToVisible_null_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SCROLLTOVISIBLE_PARAM_0200
     * @tc.desc   Test RichEditor scrollToVisible with null parameter triggers onContentScroll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('richEditorScrollToVisible_null_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorScrollToVisible_null_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_null'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('scrollToVisibleNullParam')).assertEqual('success');

      console.info('[richEditorScrollToVisible_null_0100] END');
      done();
    })

    /**
     * @tc.name   richEditorScrollToVisible_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SCROLLTOVISIBLE_PARAM_0300
     * @tc.desc   Test RichEditor scrollToVisible with undefined parameter triggers onContentScroll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('richEditorScrollToVisible_undefined_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorScrollToVisible_undefined_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_undefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('scrollToVisibleUndefinedParam')).assertEqual('success');

      console.info('[richEditorScrollToVisible_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   richEditorScrollToVisible_normal_range_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SCROLLTOVISIBLE_PARAM_0400
     * @tc.desc   Test RichEditor scrollToVisible with normal TextRange triggers onContentScroll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('richEditorScrollToVisible_normal_range_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorScrollToVisible_normal_range_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_normal_range'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('scrollToVisibleNormalRange')).assertEqual('success');

      console.info('[richEditorScrollToVisible_normal_range_0100] END');
      done();
    })

    /**
     * @tc.name   richEditorScrollToVisible_start_negative_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SCROLLTOVISIBLE_BOUNDARY_0100
     * @tc.desc   Test RichEditor scrollToVisible with negative start treated as 0 triggers onContentScroll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('richEditorScrollToVisible_start_negative_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorScrollToVisible_start_negative_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_start_negative'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('scrollToVisibleStartNegative')).assertEqual('success');

      console.info('[richEditorScrollToVisible_start_negative_0100] END');
      done();
    })

    /**
     * @tc.name   richEditorScrollToVisible_end_overflow_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SCROLLTOVISIBLE_BOUNDARY_0200
     * @tc.desc   Test RichEditor scrollToVisible with end exceeding text length triggers onContentScroll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('richEditorScrollToVisible_end_overflow_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorScrollToVisible_end_overflow_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_end_overflow'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('scrollToVisibleEndOverflow')).assertEqual('success');

      console.info('[richEditorScrollToVisible_end_overflow_0100] END');
      done();
    })

    /**
     * @tc.name   richEditorScrollToVisible_start_greater_end_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SCROLLTOVISIBLE_BOUNDARY_0300
     * @tc.desc   Test RichEditor scrollToVisible with start greater than end does not trigger onContentScroll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('richEditorScrollToVisible_start_greater_end_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorScrollToVisible_start_greater_end_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_start_greater_end'));
      await btn.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('scrollToVisibleStartGreaterEnd')).assertEqual('success');

      console.info('[richEditorScrollToVisible_start_greater_end_0100] END');
      done();
    })

  })
}