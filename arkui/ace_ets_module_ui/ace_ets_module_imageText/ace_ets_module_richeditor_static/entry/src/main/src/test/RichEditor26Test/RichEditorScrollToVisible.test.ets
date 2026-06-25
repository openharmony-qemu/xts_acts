'use static'
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function RichEditorScrollToVisibleTest() {
  describe('RichEditorScrollToVisibleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RichEditorScrollToVisibleTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      console.info("RichEditorScrollToVisibleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor26/RichEditorScrollToVisible',
      }
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('RichEditorScrollToVisibleTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'RichEditorScrollToVisible') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('RichEditorScrollToVisibleTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    })
    afterAll(() => {
      AppStorage.delete('scrollToVisibleNoParam');
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
    it('richEditorScrollToVisible_no_param_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorScrollToVisible_no_param_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_no_param'));
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(AppStorage.get<string>('scrollToVisibleNoParam')).assertEqual('success');

      console.info('[richEditorScrollToVisible_no_param_0100] END');
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
    it('richEditorScrollToVisible_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorScrollToVisible_undefined_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_undefined'));
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(AppStorage.get<string>('scrollToVisibleUndefinedParam')).assertEqual('success');

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
    it('richEditorScrollToVisible_normal_range_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorScrollToVisible_normal_range_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_normal_range'));
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(AppStorage.get<string>('scrollToVisibleNormalRange')).assertEqual('success');

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
    it('richEditorScrollToVisible_start_negative_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorScrollToVisible_start_negative_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_start_negative'));
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(AppStorage.get<string>('scrollToVisibleStartNegative')).assertEqual('success');

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
    it('richEditorScrollToVisible_end_overflow_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorScrollToVisible_end_overflow_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_end_overflow'));
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(AppStorage.get<string>('scrollToVisibleEndOverflow')).assertEqual('success');

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
    it('richEditorScrollToVisible_start_greater_end_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorScrollToVisible_start_greater_end_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn = await driver.findComponent(ON.id('btn_scrollToVisible_start_greater_end'));
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(1000);

      expect(AppStorage.get<string>('scrollToVisibleStartGreaterEnd')).assertEqual('success');

      console.info('[richEditorScrollToVisible_start_greater_end_0100] END');
      done();
    })

  })
}