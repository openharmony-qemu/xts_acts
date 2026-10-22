'use static';
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

import { describe, beforeAll, beforeEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const SLEEP_TIME: int = 500;

export default function richEditorBuilderSpanParamTest(): void {
  describe('richEditorBuilderSpanParamTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('richEditorBuilderSpanParamTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('richEditorBuilderSpanParamTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor26/RichEditorBuilderSpanParam',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('richEditorBuilderSpanParamTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'RichEditorBuilderSpanParam') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('richEditorBuilderSpanParamTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterAll(() => {
      let keys: string[] = [
        'param_add_basic', 'param_add_onAttach_id', 'param_add_onAttach_offset',
        'param_add_onDetach_id', 'param_add_onDetach_offset',
        'param_add_info_offset_zero', 'param_add_info_offset_negative', 'param_add_info_offset_large',
        'param_add_info_empty_object',
        'param_add_no_callbacks', 'param_add_only_onAttach', 'param_add_only_onAttach_idx',
        'param_add_only_onDetach', 'param_add_only_onDetach_idx',
        'param_add_empty_builder',
        'param_add_a11y_invalid_level', 'param_add_a11y_level_no', 'param_add_a11y_level_hide',
        'param_add_a11y_level_auto', 'param_add_a11y_undefined_opts',
        'param_add_multiple', 'param_add_duplicate_id',
        'param_get_empty_range', 'param_get_range_0_2',
        'param_get_range_start_undef', 'param_get_range_end_undef',
        'param_get_range_start_neg', 'param_get_range_end_large',
        'param_get_range_start_gt_end',
        'param_get_empty_result', 'param_get_multiple',
        'param_get_assert_non_empty', 'param_get_assert_empty',
        'param_delete_trigger'
      ];
      for (let i: int = 0; i < keys.length; i++) {
        AppStorage.delete(keys[i]);
      }
    });

    /* ===================== addRichEditorBuilderSpan tests ===================== */

    /**
     * @tc.name   richEditorBuilderSpanParam_add_basic_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_0100
     * @tc.desc   Test addRichEditorBuilderSpan with full span and BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_basic_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_basic_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_basic'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_basic');
      expect(result !== undefined).assertTrue();
      expect(result !== 'failed' && !result!.startsWith('failed')).assertTrue();
      expect(Number(result) >= 0).assertTrue();
      expect(AppStorage.get<string>('param_add_onAttach_id')).assertEqual('span_a');
      console.info('[richEditorBuilderSpanParam_add_basic_0100] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_info_undefined_0200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_0200
     * @tc.desc   Test addRichEditorBuilderSpan with undefined BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_info_undefined_0200', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_info_undefined_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_info_undefined'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_info_undefined');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      expect(Number(result) >= 0).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_info_undefined_0200] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_info_empty_id_0400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_0400
     * @tc.desc   Test addRichEditorBuilderSpan with empty string id in BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_info_empty_id_0400', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_info_empty_id_0400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_info_empty_id'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_info_empty_id');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_info_empty_id_0400] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_info_id_undefined_0500
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_0500
     * @tc.desc   Test addRichEditorBuilderSpan with undefined id in BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_info_id_undefined_0500', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_info_id_undefined_0500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_info_id_undefined'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_info_id_undefined');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_info_id_undefined_0500] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_info_offset_undefined_0700
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_0700
     * @tc.desc   Test addRichEditorBuilderSpan with undefined offset in BuilderSpanInfo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_info_offset_undefined_0700', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_info_offset_undefined_0700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_info_offset_undefined'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_info_offset_undefined');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_info_offset_undefined_0700] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_info_offset_zero_0900
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_BOUNDARY_0100
     * @tc.desc   Test addRichEditorBuilderSpan with offset 0 (boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_info_offset_zero_0900', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_info_offset_zero_0900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_info_offset_zero'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_info_offset_zero');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      expect(Number(result) >= 0).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_info_offset_zero_0900] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_info_offset_negative_1000
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_BOUNDARY_0200
     * @tc.desc   Test addRichEditorBuilderSpan with negative offset (boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_info_offset_negative_1000', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_info_offset_negative_1000] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_info_offset_negative'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_info_offset_negative');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_info_offset_negative_1000] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_info_offset_large_1100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_BOUNDARY_0300
     * @tc.desc   Test addRichEditorBuilderSpan with very large offset (boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_info_offset_large_1100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_info_offset_large_1100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_info_offset_large'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_info_offset_large');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_info_offset_large_1100] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_info_empty_object_1200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_0900
     * @tc.desc   Test addRichEditorBuilderSpan with empty BuilderSpanInfo object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_info_empty_object_1200', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_info_empty_object_1200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_info_empty_object'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_info_empty_object');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_info_empty_object_1200] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_no_callbacks_1300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_1000
     * @tc.desc   Test addRichEditorBuilderSpan with span that has no callbacks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_no_callbacks_1300', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_no_callbacks_1300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_no_callbacks'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_no_callbacks');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_no_callbacks_1300] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_only_onAttach_1400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_1100
     * @tc.desc   Test addRichEditorBuilderSpan with only onAttach callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_only_onAttach_1400', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_only_onAttach_1400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_only_onAttach'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string | undefined = AppStorage.get<string>('param_add_only_onAttach_idx');
      expect(idx !== undefined).assertTrue();
      expect(!idx!.startsWith('failed')).assertTrue();
      expect(AppStorage.get<string>('param_add_only_onAttach')).assertEqual('span_oa');
      console.info('[richEditorBuilderSpanParam_add_only_onAttach_1400] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_only_onDetach_1500
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_1200
     * @tc.desc   Test addRichEditorBuilderSpan with only onDetach callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_only_onDetach_1500', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_only_onDetach_1500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_only_onDetach'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let idx: string | undefined = AppStorage.get<string>('param_add_only_onDetach_idx');
      expect(idx !== undefined).assertTrue();
      expect(!idx!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_only_onDetach_1500] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_undefined_callbacks_1700
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_1400
     * @tc.desc   Test addRichEditorBuilderSpan with undefined onAttach and onDetach
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_undefined_callbacks_1700', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_undefined_callbacks_1700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_undefined_callbacks'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_undefined_callbacks');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_undefined_callbacks_1700] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_empty_builder_1800
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_1500
     * @tc.desc   Test addRichEditorBuilderSpan with empty builder content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_empty_builder_1800', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_empty_builder_1800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_empty_builder'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_empty_builder');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_empty_builder_1800] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_a11y_empty_text_1900
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_1600
     * @tc.desc   Test addRichEditorBuilderSpan with empty accessibilityText and accessibilityDescription
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_a11y_empty_text_1900', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_a11y_empty_text_1900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_a11y_empty_text'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_a11y_empty_text');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_a11y_empty_text_1900] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_a11y_undefined_2000
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_1700
     * @tc.desc   Test addRichEditorBuilderSpan with undefined accessibileText properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_a11y_undefined_2000', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_a11y_undefined_2000] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_a11y_undefined'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_a11y_undefined');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_a11y_undefined_2000] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_a11y_invalid_level_2200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_1900
     * @tc.desc   Test addRichEditorBuilderSpan with invalid accessibilityLevel value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_a11y_invalid_level_2200', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_a11y_invalid_level_2200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_a11y_invalid_level'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_a11y_invalid_level');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_a11y_invalid_level_2200] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_a11y_level_no_2300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_2000
     * @tc.desc   Test addRichEditorBuilderSpan with accessibilityLevel 'no'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_a11y_level_no_2300', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_a11y_level_no_2300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_a11y_level_no'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_a11y_level_no');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_a11y_level_no_2300] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_a11y_level_hide_2400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_2100
     * @tc.desc   Test addRichEditorBuilderSpan with accessibilityLevel 'no-hide-descendants'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_a11y_level_hide_2400', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_a11y_level_hide_2400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_a11y_level_hide'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_a11y_level_hide');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_a11y_level_hide_2400] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_a11y_level_auto_2500
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_2200
     * @tc.desc   Test addRichEditorBuilderSpan with accessibilityLevel 'auto'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_a11y_level_auto_2500', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_a11y_level_auto_2500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_a11y_level_auto'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_a11y_level_auto');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_a11y_level_auto_2500] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_a11y_undefined_opts_2600
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_2300
     * @tc.desc   Test addRichEditorBuilderSpan with undefined accessibilitySpanOptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_a11y_undefined_opts_2600', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_a11y_undefined_opts_2600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_a11y_undefined_opts'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_a11y_undefined_opts');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_a11y_undefined_opts_2600] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_multiple_2700
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_2400
     * @tc.desc   Test addRichEditorBuilderSpan called multiple times with different ids
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_multiple_2700', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_multiple_2700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_multiple'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_multiple');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      let parts: string[] = result!.split(',');
      expect(parts.length === 2).assertTrue();
      expect(Number(parts[0]) >= 0).assertTrue();
      expect(Number(parts[1]) >= 0).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_multiple_2700] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_add_duplicate_id_2800
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_2500
     * @tc.desc   Test addRichEditorBuilderSpan with duplicate id does not crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_add_duplicate_id_2800', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_add_duplicate_id_2800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_add_duplicate_id'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_add_duplicate_id');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_add_duplicate_id_2800] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_delete_trigger_2900
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_ADD_PARAM_2600
     * @tc.desc   Test deleteSpans triggers onDetach callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_delete_trigger_2900', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_delete_trigger_2900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_delete_trigger'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(AppStorage.get<string>('param_delete_trigger')).assertEqual('done');
      expect(AppStorage.get<string>('param_add_onDetach_id')).assertEqual('span_del');
      console.info('[richEditorBuilderSpanParam_delete_trigger_2900] END');
    });

    /* ===================== getRichEditorBuilderSpans tests ===================== */

    /**
     * @tc.name   richEditorBuilderSpanParam_get_no_param_3000
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_PARAM_0100
     * @tc.desc   Test getRichEditorBuilderSpans with no parameter returns all spans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_no_param_3000', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_no_param_3000] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_no_param'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_no_param');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      expect(result !== 'undefined').assertTrue();
      expect(result!.includes('span_a')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_no_param_3000] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_undefined_3100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_PARAM_0200
     * @tc.desc   Test getRichEditorBuilderSpans with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_undefined_3100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_undefined_3100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_undefined'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_undefined');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      expect(result !== 'undefined').assertTrue();
      console.info('[richEditorBuilderSpanParam_get_undefined_3100] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_empty_range_3300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_PARAM_0400
     * @tc.desc   Test getRichEditorBuilderSpans with empty RichEditorRange object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_empty_range_3300', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_empty_range_3300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_empty_range'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_empty_range');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_empty_range_3300] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_range_0_2_3400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_PARAM_0500
     * @tc.desc   Test getRichEditorBuilderSpans with start=0, end=2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_range_0_2_3400', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_range_0_2_3400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_range_0_2'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_range_0_2');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_range_0_2_3400] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_range_start_undef_3500
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_PARAM_0600
     * @tc.desc   Test getRichEditorBuilderSpans with undefined start in range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_range_start_undef_3500', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_range_start_undef_3500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_range_start_undef'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_range_start_undef');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_range_start_undef_3500] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_range_end_undef_3600
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_PARAM_0700
     * @tc.desc   Test getRichEditorBuilderSpans with undefined end in range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_range_end_undef_3600', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_range_end_undef_3600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_range_end_undef'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_range_end_undef');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_range_end_undef_3600] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_range_start_neg_3900
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_BOUNDARY_0100
     * @tc.desc   Test getRichEditorBuilderSpans with negative start (boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_range_start_neg_3900', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_range_start_neg_3900] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_range_start_neg'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_range_start_neg');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_range_start_neg_3900] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_range_end_large_4000
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_BOUNDARY_0200
     * @tc.desc   Test getRichEditorBuilderSpans with very large end (boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_range_end_large_4000', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_range_end_large_4000] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_range_end_large'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_range_end_large');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_range_end_large_4000] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_range_start_gt_end_4100
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_BOUNDARY_0300
     * @tc.desc   Test getRichEditorBuilderSpans with start greater than end (boundary)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_range_start_gt_end_4100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_range_start_gt_end_4100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_range_start_gt_end'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_range_start_gt_end');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_range_start_gt_end_4100] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_empty_result_4200
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_PARAM_1000
     * @tc.desc   Test getRichEditorBuilderSpans returns empty array when no BuilderSpan added
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_empty_result_4200', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_empty_result_4200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_empty_result'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_empty_result');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      expect(result!.startsWith('0|')).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_empty_result_4200] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_multiple_4300
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_PARAM_1100
     * @tc.desc   Test getRichEditorBuilderSpans returns multiple spans after adding multiple
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_multiple_4300', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_multiple_4300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_multiple'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_multiple');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      expect(result !== 'undefined').assertTrue();
      expect(result!.includes('s1')).assertTrue();
      expect(result!.includes('s2')).assertTrue();
      let countStr: string = result!.split('|')[0];
      expect(Number(countStr) >= 2).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_multiple_4300] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_non_empty_assert_4400
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_ASSERT_0100
     * @tc.desc   Test getRichEditorBuilderSpans returns non-empty array when BuilderSpan added
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_non_empty_assert_4400', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_non_empty_assert_4400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_assert_non_empty'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_assert_non_empty');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      let parts: string[] = result!.split('|');
      expect(parts[0]).assertEqual('true');
      expect(parts[1]).assertEqual('true');
      expect(Number(parts[2]) > 0).assertTrue();
      console.info('[richEditorBuilderSpanParam_get_non_empty_assert_4400] END');
    });

    /**
     * @tc.name   richEditorBuilderSpanParam_get_empty_assert_4500
     * @tc.number SUB_ARKUI_RICHEDITOR_BUILDERSPANPARAM_GET_ASSERT_0200
     * @tc.desc   Test getRichEditorBuilderSpans returns empty array when no BuilderSpan added
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorBuilderSpanParam_get_empty_assert_4500', Level.LEVEL2, async (): Promise<void> => {
      console.info('[richEditorBuilderSpanParam_get_empty_assert_4500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn = await driver.findComponent(ON.id('btn_param_get_assert_empty'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME);
      let result: string | undefined = AppStorage.get<string>('param_get_assert_empty');
      expect(result !== undefined).assertTrue();
      expect(!result!.startsWith('failed')).assertTrue();
      let parts: string[] = result!.split('|');
      expect(parts[0]).assertEqual('true');
      expect(parts[1]).assertEqual('true');
      expect(Number(parts[2])).assertEqual(0);
      console.info('[richEditorBuilderSpanParam_get_empty_assert_4500] END');
    });
  });
}
