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
const PAGE_NAME = 'RichEditorBuilderSpanParamPage';
const PAGE_URL = 'MainAbility/pages/RichEditorApi26/RichEditorBuilderSpanParam';

export default function richEditorBuilderSpanParamTest() {
  describe('richEditorBuilderSpanParamTest', () => {
    beforeEach(async (done: Function) => {
      console.info('richEditorBuilderSpanParamTest beforeEach start');
      let options: router.RouterOptions = {
        url: PAGE_URL,
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!(PAGE_NAME == pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RichEditorBuilderSpanParam page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterAll(() => {
      let keys: string[] = [
        'param_add_complete', 'param_add_info_undefined', 'param_add_info_null',
        'param_add_info_id_empty', 'param_add_info_id_undefined',
        'param_add_info_offset_zero', 'param_add_info_offset_negative',
        'param_add_info_offset_large', 'param_add_info_offset_undefined',
        'param_add_info_only_id', 'param_add_info_only_offset',
        'param_add_span_builder_only', 'param_add_span_onAttach',
        'param_add_span_onDetach', 'param_add_span_accessibleText',
        'param_add_span_builder_undefined', 'param_add_span_null',
        'param_add_span_undefined',
        'param_get_all', 'param_get_undefined', 'param_get_null',
        'param_get_range_normal', 'param_get_range_empty',
        'param_get_range_only_start', 'param_get_range_only_end',
        'param_get_range_negative', 'param_get_range_large_end',
        'param_get_range_reversed', 'param_get_no_span',
        'param_get_after_delete', 'param_delete_spans', 'param_seed_content'
      ];
      for (let i = 0; i < keys.length; i++) {
        AppStorage.delete(keys[i]);
      }
      let tagKeys: string[] = [
        'add_complete_onAttach_id', 'add_complete_onAttach_offset',
        'add_complete_onDetach_id', 'add_complete_onDetach_offset',
        'add_info_undef_onAttach_id', 'add_info_null_onAttach_id',
        'add_onAttach_onAttach_id', 'add_onAttach_onAttach_offset',
        'add_onDetach_onDetach_id', 'add_onDetach_onDetach_offset',
        'add_builder_undef_onAttach'
      ];
      for (let i = 0; i < tagKeys.length; i++) {
        AppStorage.delete(tagKeys[i]);
      }
    });

    // ===================== addRichEditorBuilderSpan tests =====================

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0100
     * @tc.desc   Test addRichEditorBuilderSpan with complete RichEditorBuilderSpan and complete BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_complete'));
      expect(btn).not().assertNull();
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_complete') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      let onAttachId: string = AppStorage.get<string>('add_complete_onAttach_id') as string;
      expect(onAttachId).assertEqual('id_complete');
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0200
     * @tc.desc   Test addRichEditorBuilderSpan with undefined BuilderSpanInfo (omitted)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_undefined'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_undefined') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0200] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0300
     * @tc.desc   Test addRichEditorBuilderSpan with null BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_null'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_null') as string;
      expect(idx !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0300] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0400
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo.id as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0400', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_id_empty'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_id_empty') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0400] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0500
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0500
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo.id as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0500', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_id_undefined'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_id_undefined') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0500] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0600
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0600
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo.offset as 0 (boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0600', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_offset_zero'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_offset_zero') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0600] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0700
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0700
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo.offset as -1 (negative)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0700', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_offset_negative'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_offset_negative') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0700] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0800
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0800
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo.offset as 999999 (beyond content)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0800', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_offset_large'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_offset_large') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0800] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0900
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0900
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo.offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0900', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_offset_undefined'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_offset_undefined') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_0900] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1000
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1000
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo containing only id (no offset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1000', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1000] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_only_id'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_only_id') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1000] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1100
     * @tc.desc   Test addRichEditorBuilderSpan with BuilderSpanInfo containing only offset (no id)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_info_only_offset'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_info_only_offset') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1200
     * @tc.desc   Test addRichEditorBuilderSpan with RichEditorBuilderSpan containing only builder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1200', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_span_builder_only'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_span_builder_only') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1200] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1300
     * @tc.desc   Test addRichEditorBuilderSpan with RichEditorBuilderSpan containing builder and onAttach only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1300', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_span_onAttach'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_span_onAttach') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      let onAttachId: string = AppStorage.get<string>('add_onAttach_onAttach_id') as string;
      expect(onAttachId).assertEqual('id_onAttach');
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1300] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1400
     * @tc.desc   Test addRichEditorBuilderSpan with RichEditorBuilderSpan containing builder and onDetach only,
     *            verify onDetach fires after deleteSpans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1400', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let addBtn = await driver.findComponent(ON.id('btn_add_span_onDetach'));
      await addBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_span_onDetach') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      let delBtn = await driver.findComponent(ON.id('btn_param_delete'));
      await delBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let onDetachId: string = AppStorage.get<string>('add_onDetach_onDetach_id') as string;
      expect(onDetachId).assertEqual('id_onDetach');
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1400] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1500
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1500
     * @tc.desc   Test addRichEditorBuilderSpan with RichEditorBuilderSpan containing builder and accessibilitySpanOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1500', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_span_accessibleText'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string = AppStorage.get<string>('param_add_span_accessibleText') as string;
      expect(idx !== undefined && idx !== 'failed').assertTrue();
      expect(Number(idx) >= 0).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1500] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1600
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1600
     * @tc.desc   Test addRichEditorBuilderSpan with RichEditorBuilderSpan containing undefined builder (abnormal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1600', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_span_builder_undefined'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_add_span_builder_undefined') as string;
      expect(result !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1600] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1700
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1700
     * @tc.desc   Test addRichEditorBuilderSpan with null RichEditorBuilderSpan (abnormal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1700', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_span_null'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_add_span_null') as string;
      expect(result !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1700] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1800
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1800
     * @tc.desc   Test addRichEditorBuilderSpan with undefined RichEditorBuilderSpan (abnormal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1800', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_add_span_undefined'));
      await btn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_add_span_undefined') as string;
      expect(result !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_ADD_1800] END');
    });

    // ===================== getRichEditorBuilderSpans tests =====================

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0100
     * @tc.desc   Test getRichEditorBuilderSpans with no parameter (omitted) after adding spans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_all'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_all') as string;
      expect(result !== undefined && result !== 'failed' && result !== 'undefined').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0200
     * @tc.desc   Test getRichEditorBuilderSpans with undefined parameter after adding spans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_undefined'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_undefined') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0200] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0300
     * @tc.desc   Test getRichEditorBuilderSpans with null parameter after adding spans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_null'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_null') as string;
      expect(result !== undefined).assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0300] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0400
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange {start:0, end:2}
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0400', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_range_normal'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_range_normal') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0400] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0500
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0500
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange {start:0, end:0} (empty range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0500', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_range_empty'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_range_empty') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0500] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0600
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0600
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange containing only start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0600', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_range_only_start'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_range_only_start') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0600] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0700
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0700
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange containing only end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0700', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_range_only_end'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_range_only_end') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0700] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0800
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0800
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange {start:-1, end:-1} (negative values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0800', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_range_negative'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_range_negative') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0800] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0900
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0900
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange {start:0, end:999999} (end beyond content)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0900', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_range_large_end'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_range_large_end') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_0900] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1000
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1000
     * @tc.desc   Test getRichEditorBuilderSpans with RichEditorRange {start:999999, end:0} (reversed range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1000', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1000] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_range_reversed'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_range_reversed') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1000] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1100
     * @tc.desc   Test getRichEditorBuilderSpans when no BuilderSpan has been added (fresh controller)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_no_span'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_no_span') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1200
     * @tc.desc   Test getRichEditorBuilderSpans after deleteSpans (should return empty or reduced result)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1200', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_add_complete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      await (await driver.findComponent(ON.id('btn_get_after_delete'))).click();
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string = AppStorage.get<string>('param_get_after_delete') as string;
      expect(result !== undefined && result !== 'failed').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_BUILDERSPAN_PARAM_GET_1200] END');
    });
  });
}
