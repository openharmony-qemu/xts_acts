/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

const SLEEP_TIME = 500;

export default function richEditorBuilderSpanApi26Test() {
  describe('richEditorBuilderSpanApi26Test', () => {
    beforeEach(async (done: Function) => {
      console.info('richEditorBuilderSpanApi26Test beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/RichEditorBuilderSpan',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('RichEditorBuilderSpanPage' == pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RichEditorBuilderSpan page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterAll(() => {
      AppStorage.delete('builderSpan_add_with_info');
      AppStorage.delete('builderSpan_add_undefined_info');
      AppStorage.delete('builderSpan_add_null_info');
      AppStorage.delete('builderSpan_get_all');
      AppStorage.delete('builderSpan_get_range');
      AppStorage.delete('builderSpan_get_undefined');
      AppStorage.delete('builderSpan_get_null');
      AppStorage.delete('builderSpan_delete');
      AppStorage.delete('builderSpan_global_controller');
      AppStorage.delete('builderSpan_info_onAttach_id');
      AppStorage.delete('builderSpan_info_onDetach_id');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0100
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo id/offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_builderSpan_add_with_info'));
      expect(btn).not().assertNull();
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('builderSpan_add_with_info') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(AppStorage.get<string>('builderSpan_info_onAttach_id')).assertEqual('span_a');
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0200
     * @tc.desc   Test addRichEditorBuilderSpan with undefined BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_builderSpan_add_undefined_info'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('builderSpan_add_undefined_info') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0200] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0300
     * @tc.desc   Test addRichEditorBuilderSpan with null BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_builderSpan_add_null_info'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('builderSpan_add_null_info') as string;
      expect(idx !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_ADD_0300] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0100
     * @tc.desc   Test getRichEditorBuilderSpans returns BuilderSpanInfo list
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_add_with_info'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_get_all'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('builderSpan_get_all') as string;
      expect(result !== undefined && result !== 'failed' && result !== 'undefined').assertTrue();
      expect(result.includes('span_a')).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0200
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_add_with_info'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_get_range'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('builderSpan_get_range') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0200] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0300
     * @tc.desc   Test getRichEditorBuilderSpans with undefined range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_add_with_info'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_get_undefined'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('builderSpan_get_undefined') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0300] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0400
     * @tc.desc   Test getRichEditorBuilderSpans with null range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0400', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_add_with_info'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_get_null'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('builderSpan_get_null') as string;
      expect(result !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GET_0400] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_DETACH_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_DETACH_0100
     * @tc.desc   Test RichEditorBuilderSpan onDetach after deleteSpans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_DETACH_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_DETACH_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_add_with_info'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_delete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      expect(AppStorage.get<string>('builderSpan_delete')).assertEqual('success');
      expect(AppStorage.get<string>('builderSpan_info_onDetach_id')).assertEqual('span_a');
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_DETACH_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GLOBAL_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GLOBAL_0100
     * @tc.desc   Test global RichEditorController addTextSpan and getSpans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GLOBAL_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GLOBAL_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_builderSpan_global_controller'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let count: string = AppStorage.get<string>('builderSpan_global_controller') as string;
      expect(count !== undefined && count !== 'failed').assertTrue();
      expect(Number(count) > 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_GLOBAL_0100] END');
    });
  });
}
