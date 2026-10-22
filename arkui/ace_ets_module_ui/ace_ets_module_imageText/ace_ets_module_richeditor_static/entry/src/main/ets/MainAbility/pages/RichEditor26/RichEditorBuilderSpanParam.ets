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

import {
  Entry,
  Component,
  RichEditor,
  RichEditorController,
  RichEditorBuilderSpan,
  BuilderSpanInfo,
  RichEditorRange,
  Column,
  Row,
  Button,
  Scroll,
  Text,
  Color,
  AppStorage
} from '@kit.ArkUI';

@Entry
@Component
struct RichEditorBuilderSpanParam {
  controller: RichEditorController = new RichEditorController();

  @Builder
  spanBuilder(): void {
    Text('BS').fontSize(16)
  }

  @Builder
  emptyBuilder(): void {
    Text('').fontSize(12)
  }

  private makeBaseSpan(): RichEditorBuilderSpan {
    return {
      builder: this.spanBuilder
    };
  }

  private makeFullSpan(): RichEditorBuilderSpan {
    return {
      builder: this.spanBuilder,
      onAttach: (info: BuilderSpanInfo): void => {
        AppStorage.setOrCreate('param_add_onAttach_id', info.id ?? 'undefined');
        AppStorage.setOrCreate('param_add_onAttach_offset', String(info.offset ?? -1));
      },
      onDetach: (info: BuilderSpanInfo): void => {
        AppStorage.setOrCreate('param_add_onDetach_id', info.id ?? 'undefined');
        AppStorage.setOrCreate('param_add_onDetach_offset', String(info.offset ?? -1));
      },
      accessibilitySpanOptions: {
        accessibilityText: 'a11y-text',
        accessibilityDescription: 'a11y-desc',
        accessibilityLevel: 'yes'
      }
    };
  }

  private storeGetResult(key: string, infos: BuilderSpanInfo[] | undefined): void {
    if (infos === undefined) {
      AppStorage.setOrCreate(key, 'undefined');
      return;
    }
    let parts: string[] = [];
    for (let i: int = 0; i < infos.length; i++) {
      let idVal: string = infos[i].id ?? 'undefined';
      let offVal: string = String(infos[i].offset ?? -1);
      parts.push(`${idVal}:${offVal}`);
    }
    AppStorage.setOrCreate(key, `${infos.length}|${parts.join(',')}`);
  }

  private resetEditor(): void {
    this.controller.deleteSpans();
    this.controller.addTextSpan('seed');
  }

  /* ===================== addRichEditorBuilderSpan ===================== */

  private onAddBasic(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan(), { id: 'span_a', offset: 0 });
      AppStorage.setOrCreate('param_add_basic', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_basic', 'failed:' + String(err));
    }
  }

  private onAddInfoUndefined(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeBaseSpan(), undefined);
      AppStorage.setOrCreate('param_add_info_undefined', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_info_undefined', 'failed:' + String(err));
    }
  }

  private onAddInfoEmptyId(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeBaseSpan(), { id: '', offset: 0 });
      AppStorage.setOrCreate('param_add_info_empty_id', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_info_empty_id', 'failed:' + String(err));
    }
  }

  private onAddInfoIdUndefined(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeBaseSpan(), { id: undefined, offset: 0 });
      AppStorage.setOrCreate('param_add_info_id_undefined', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_info_id_undefined', 'failed:' + String(err));
    }
  }

  private onAddInfoOffsetUndefined(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeBaseSpan(), { id: 'span_ou', offset: undefined });
      AppStorage.setOrCreate('param_add_info_offset_undefined', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_info_offset_undefined', 'failed:' + String(err));
    }
  }

  private onAddInfoOffsetZero(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeBaseSpan(), { id: 'span_z', offset: 0 });
      AppStorage.setOrCreate('param_add_info_offset_zero', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_info_offset_zero', 'failed:' + String(err));
    }
  }

  private onAddInfoOffsetNegative(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeBaseSpan(), { id: 'span_neg', offset: -1 });
      AppStorage.setOrCreate('param_add_info_offset_negative', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_info_offset_negative', 'failed:' + String(err));
    }
  }

  private onAddInfoOffsetLarge(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeBaseSpan(), { id: 'span_big', offset: 99999 });
      AppStorage.setOrCreate('param_add_info_offset_large', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_info_offset_large', 'failed:' + String(err));
    }
  }

  private onAddInfoEmptyObject(): void {
    this.resetEditor();
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeBaseSpan(), {});
      AppStorage.setOrCreate('param_add_info_empty_object', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_info_empty_object', 'failed:' + String(err));
    }
  }

  private onAddSpanNoCallbacks(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_nc', offset: 0 });
      AppStorage.setOrCreate('param_add_no_callbacks', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_no_callbacks', 'failed:' + String(err));
    }
  }

  private onAddSpanOnlyOnAttach(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        onAttach: (info: BuilderSpanInfo): void => {
          AppStorage.setOrCreate('param_add_only_onAttach', info.id ?? 'undefined');
        }
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_oa', offset: 0 });
      AppStorage.setOrCreate('param_add_only_onAttach_idx', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_only_onAttach_idx', 'failed:' + String(err));
    }
  }

  private onAddSpanOnlyOnDetach(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        onDetach: (info: BuilderSpanInfo): void => {
          AppStorage.setOrCreate('param_add_only_onDetach', info.id ?? 'undefined');
        }
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_od', offset: 0 });
      AppStorage.setOrCreate('param_add_only_onDetach_idx', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_only_onDetach_idx', 'failed:' + String(err));
    }
  }

  private onAddSpanUndefinedOnAttach(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        onAttach: undefined,
        onDetach: undefined
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_ua', offset: 0 });
      AppStorage.setOrCreate('param_add_undefined_callbacks', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_undefined_callbacks', 'failed:' + String(err));
    }
  }

  private onAddSpanWithA11yText(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        accessibilitySpanOptions: {
          accessibilityText: '',
          accessibilityDescription: '',
          accessibilityLevel: 'yes'
        }
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_a1y', offset: 0 });
      AppStorage.setOrCreate('param_add_a11y_empty_text', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_a11y_empty_text', 'failed:' + String(err));
    }
  }

  private onAddSpanWithA11yUndefined(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        accessibilitySpanOptions: {
          accessibilityText: undefined,
          accessibilityDescription: undefined,
          accessibilityLevel: undefined
        }
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_a1u', offset: 0 });
      AppStorage.setOrCreate('param_add_a11y_undefined', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_a11y_undefined', 'failed:' + String(err));
    }
  }

  private onAddSpanWithA11yInvalidLevel(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        accessibilitySpanOptions: {
          accessibilityText: 'text',
          accessibilityDescription: 'desc',
          accessibilityLevel: 'invalid_value'
        }
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_a1i', offset: 0 });
      AppStorage.setOrCreate('param_add_a11y_invalid_level', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_a11y_invalid_level', 'failed:' + String(err));
    }
  }

  private onAddSpanWithA11yAllLevels(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        accessibilitySpanOptions: {
          accessibilityText: 't2',
          accessibilityDescription: 'd2',
          accessibilityLevel: 'no'
        }
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_a1no', offset: 0 });
      AppStorage.setOrCreate('param_add_a11y_level_no', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_a11y_level_no', 'failed:' + String(err));
    }
  }

  private onAddSpanWithA11yNoHideDesc(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        accessibilitySpanOptions: {
          accessibilityText: 't3',
          accessibilityDescription: 'd3',
          accessibilityLevel: 'no-hide-descendants'
        }
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_a1hd', offset: 0 });
      AppStorage.setOrCreate('param_add_a11y_level_hide', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_a11y_level_hide', 'failed:' + String(err));
    }
  }

  private onAddSpanWithA11yAutoLevel(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        accessibilitySpanOptions: {
          accessibilityText: 't4',
          accessibilityDescription: 'd4',
          accessibilityLevel: 'auto'
        }
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_a1auto', offset: 0 });
      AppStorage.setOrCreate('param_add_a11y_level_auto', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_a11y_level_auto', 'failed:' + String(err));
    }
  }

  private onAddSpanA11yUndefined(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.spanBuilder,
        accessibilitySpanOptions: undefined
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_a1u2', offset: 0 });
      AppStorage.setOrCreate('param_add_a11y_undefined_opts', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_a11y_undefined_opts', 'failed:' + String(err));
    }
  }

  private onAddEmptyBuilder(): void {
    this.resetEditor();
    try {
      let span: RichEditorBuilderSpan = {
        builder: this.emptyBuilder
      };
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(span, { id: 'span_eb', offset: 0 });
      AppStorage.setOrCreate('param_add_empty_builder', String(idx));
    } catch (err) {
      AppStorage.setOrCreate('param_add_empty_builder', 'failed:' + String(err));
    }
  }

  private onAddMultipleSpans(): void {
    this.resetEditor();
    try {
      let idx1: int | undefined = this.controller.addRichEditorBuilderSpan(this.makeBaseSpan(), { id: 'm1', offset: 0 });
      let idx2: int | undefined = this.controller.addRichEditorBuilderSpan(this.makeBaseSpan(), { id: 'm2', offset: 2 });
      AppStorage.setOrCreate('param_add_multiple', `${idx1},${idx2}`);
    } catch (err) {
      AppStorage.setOrCreate('param_add_multiple', 'failed:' + String(err));
    }
  }

  private onAddDuplicateId(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeBaseSpan(), { id: 'dup', offset: 0 });
      let idx2: int | undefined = this.controller.addRichEditorBuilderSpan(this.makeBaseSpan(), { id: 'dup', offset: 1 });
      AppStorage.setOrCreate('param_add_duplicate_id', String(idx2));
    } catch (err) {
      AppStorage.setOrCreate('param_add_duplicate_id', 'failed:' + String(err));
    }
  }

  /* ===================== getRichEditorBuilderSpans ===================== */

  private onGetNoParam(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans();
      this.storeGetResult('param_get_no_param', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_no_param', 'failed:' + String(err));
    }
  }

  private onGetUndefined(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans(undefined);
      this.storeGetResult('param_get_undefined', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_undefined', 'failed:' + String(err));
    }
  }

  private onGetEmptyRange(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans({});
      this.storeGetResult('param_get_empty_range', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_empty_range', 'failed:' + String(err));
    }
  }

  private onGetRangeStartZeroEndTwo(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let range: RichEditorRange = { start: 0, end: 2 };
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans(range);
      this.storeGetResult('param_get_range_0_2', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_range_0_2', 'failed:' + String(err));
    }
  }

  private onGetRangeStartUndefined(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let range: RichEditorRange = { start: undefined, end: 2 };
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans(range);
      this.storeGetResult('param_get_range_start_undef', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_range_start_undef', 'failed:' + String(err));
    }
  }

  private onGetRangeEndUndefined(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let range: RichEditorRange = { start: 0, end: undefined };
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans(range);
      this.storeGetResult('param_get_range_end_undef', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_range_end_undef', 'failed:' + String(err));
    }
  }

  private onGetRangeStartNegative(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let range: RichEditorRange = { start: -1, end: 5 };
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans(range);
      this.storeGetResult('param_get_range_start_neg', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_range_start_neg', 'failed:' + String(err));
    }
  }

  private onGetRangeEndLarge(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let range: RichEditorRange = { start: 0, end: 99999 };
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans(range);
      this.storeGetResult('param_get_range_end_large', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_range_end_large', 'failed:' + String(err));
    }
  }

  private onGetRangeStartGreaterEnd(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_a', offset: 0 });
      let range: RichEditorRange = { start: 5, end: 1 };
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans(range);
      this.storeGetResult('param_get_range_start_gt_end', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_range_start_gt_end', 'failed:' + String(err));
    }
  }

  private onGetEmptyResult(): void {
    this.resetEditor();
    try {
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans();
      this.storeGetResult('param_get_empty_result', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_empty_result', 'failed:' + String(err));
    }
  }

  private onGetMultipleSpans(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 's1', offset: 0 });
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 's2', offset: 2 });
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans();
      this.storeGetResult('param_get_multiple', infos);
    } catch (err) {
      AppStorage.setOrCreate('param_get_multiple', 'failed:' + String(err));
    }
  }

  private onGetAssertNonEmpty(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_ne', offset: 0 });
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans();
      let isDefined: boolean = infos !== undefined && infos !== null;
      let isNonEmpty: boolean = isDefined && infos!.length > 0;
      AppStorage.setOrCreate('param_get_assert_non_empty', `${isDefined}|${isNonEmpty}|${infos!.length}`);
    } catch (err) {
      AppStorage.setOrCreate('param_get_assert_non_empty', 'failed:' + String(err));
    }
  }

  private onGetAssertEmpty(): void {
    this.resetEditor();
    try {
      let infos: BuilderSpanInfo[] | undefined = this.controller.getRichEditorBuilderSpans();
      let isDefined: boolean = infos !== undefined && infos !== null;
      let isEmpty: boolean = isDefined && infos!.length === 0;
      AppStorage.setOrCreate('param_get_assert_empty', `${isDefined}|${isEmpty}|${infos === undefined ? -1 : infos.length}`);
    } catch (err) {
      AppStorage.setOrCreate('param_get_assert_empty', 'failed:' + String(err));
    }
  }

  /* ===================== Delete triggers onDetach ===================== */

  private onAddThenDelete(): void {
    this.resetEditor();
    try {
      this.controller.addRichEditorBuilderSpan(this.makeFullSpan(), { id: 'span_del', offset: 0 });
      this.controller.deleteSpans();
      AppStorage.setOrCreate('param_delete_trigger', 'done');
    } catch (err) {
      AppStorage.setOrCreate('param_delete_trigger', 'failed:' + String(err));
    }
  }

  @Builder
  editorsBlock(): void {
    RichEditor({ controller: this.controller })
      .id('richEditor_builderSpanParam')
      .width('100%')
      .height('10%')
      .borderWidth(1)
      .borderColor(Color.Gray)
      .onReady(() => {
        this.controller.addTextSpan('seed');
      })
  }

  @Builder
  addButtonsBlock1(): void {
    Row() {
      Button('AddBasic')
        .id('btn_param_add_basic')
        .onClick(() => { this.onAddBasic(); })
        .width('45%')
      Button('AddInfoUndef')
        .id('btn_param_add_info_undefined')
        .onClick(() => { this.onAddInfoUndefined(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock2(): void {
    Row() {
      Button('AddEmptyId')
        .id('btn_param_add_info_empty_id')
        .onClick(() => { this.onAddInfoEmptyId(); })
        .width('45%')
      Button('AddIdUndef')
        .id('btn_param_add_info_id_undefined')
        .onClick(() => { this.onAddInfoIdUndefined(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock3(): void {
    Row() {
      Button('AddOffUndef')
        .id('btn_param_add_info_offset_undefined')
        .onClick(() => { this.onAddInfoOffsetUndefined(); })
        .width('45%')
      Button('AddOffZero')
        .id('btn_param_add_info_offset_zero')
        .onClick(() => { this.onAddInfoOffsetZero(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock4(): void {
    Row() {
      Button('AddOffNeg')
        .id('btn_param_add_info_offset_negative')
        .onClick(() => { this.onAddInfoOffsetNegative(); })
        .width('30%')
      Button('AddOffLarge')
        .id('btn_param_add_info_offset_large')
        .onClick(() => { this.onAddInfoOffsetLarge(); })
        .width('30%')
      Button('AddEmptyObj')
        .id('btn_param_add_info_empty_object')
        .onClick(() => { this.onAddInfoEmptyObject(); })
        .width('30%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock5(): void {
    Row() {
      Button('AddNoCb')
        .id('btn_param_add_no_callbacks')
        .onClick(() => { this.onAddSpanNoCallbacks(); })
        .width('30%')
      Button('AddOnlyOnAttach')
        .id('btn_param_add_only_onAttach')
        .onClick(() => { this.onAddSpanOnlyOnAttach(); })
        .width('30%')
      Button('AddOnlyOnDetach')
        .id('btn_param_add_only_onDetach')
        .onClick(() => { this.onAddSpanOnlyOnDetach(); })
        .width('30%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock6(): void {
    Row() {
      Button('AddUndefCb')
        .id('btn_param_add_undefined_callbacks')
        .onClick(() => { this.onAddSpanUndefinedOnAttach(); })
        .width('45%')
      Button('AddEmptyBld')
        .id('btn_param_add_empty_builder')
        .onClick(() => { this.onAddEmptyBuilder(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock7(): void {
    Row() {
      Button('AddA11yEmpty')
        .id('btn_param_add_a11y_empty_text')
        .onClick(() => { this.onAddSpanWithA11yText(); })
        .width('45%')
      Button('AddA11yUndef')
        .id('btn_param_add_a11y_undefined')
        .onClick(() => { this.onAddSpanWithA11yUndefined(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock8(): void {
    Row() {
      Button('AddA11yInvalid')
        .id('btn_param_add_a11y_invalid_level')
        .onClick(() => { this.onAddSpanWithA11yInvalidLevel(); })
        .width('30%')
      Button('AddA11yNo')
        .id('btn_param_add_a11y_level_no')
        .onClick(() => { this.onAddSpanWithA11yAllLevels(); })
        .width('30%')
      Button('AddA11yHide')
        .id('btn_param_add_a11y_level_hide')
        .onClick(() => { this.onAddSpanWithA11yNoHideDesc(); })
        .width('30%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock9(): void {
    Row() {
      Button('AddA11yAuto')
        .id('btn_param_add_a11y_level_auto')
        .onClick(() => { this.onAddSpanWithA11yAutoLevel(); })
        .width('30%')
      Button('AddA11yUndefOpts')
        .id('btn_param_add_a11y_undefined_opts')
        .onClick(() => { this.onAddSpanA11yUndefined(); })
        .width('30%')
      Button('AddMulti')
        .id('btn_param_add_multiple')
        .onClick(() => { this.onAddMultipleSpans(); })
        .width('30%')
    }.width('100%').height('5%')
  }

  @Builder
  addButtonsBlock10(): void {
    Row() {
      Button('AddDupId')
        .id('btn_param_add_duplicate_id')
        .onClick(() => { this.onAddDuplicateId(); })
        .width('45%')
      Button('AddThenDelete')
        .id('btn_param_delete_trigger')
        .onClick(() => { this.onAddThenDelete(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  getButtonsBlock1(): void {
    Row() {
      Button('GetNoParam')
        .id('btn_param_get_no_param')
        .onClick(() => { this.onGetNoParam(); })
        .width('45%')
      Button('GetUndef')
        .id('btn_param_get_undefined')
        .onClick(() => { this.onGetUndefined(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  getButtonsBlock2(): void {
    Row() {
      Button('GetEmptyRange')
        .id('btn_param_get_empty_range')
        .onClick(() => { this.onGetEmptyRange(); })
        .width('30%')
      Button('GetRange02')
        .id('btn_param_get_range_0_2')
        .onClick(() => { this.onGetRangeStartZeroEndTwo(); })
        .width('30%')
      Button('GetRangeStartUndef')
        .id('btn_param_get_range_start_undef')
        .onClick(() => { this.onGetRangeStartUndefined(); })
        .width('30%')
    }.width('100%').height('5%')
  }

  @Builder
  getButtonsBlock3(): void {
    Row() {
      Button('GetRangeEndUndef')
        .id('btn_param_get_range_end_undef')
        .onClick(() => { this.onGetRangeEndUndefined(); })
        .width('90%')
    }.width('100%').height('5%')
  }

  @Builder
  getButtonsBlock4(): void {
    Row() {
      Button('GetRangeStartNeg')
        .id('btn_param_get_range_start_neg')
        .onClick(() => { this.onGetRangeStartNegative(); })
        .width('30%')
      Button('GetRangeEndLarge')
        .id('btn_param_get_range_end_large')
        .onClick(() => { this.onGetRangeEndLarge(); })
        .width('30%')
      Button('GetRangeStartGtEnd')
        .id('btn_param_get_range_start_gt_end')
        .onClick(() => { this.onGetRangeStartGreaterEnd(); })
        .width('30%')
    }.width('100%').height('5%')
  }

  @Builder
  getButtonsBlock5(): void {
    Row() {
      Button('GetEmptyResult')
        .id('btn_param_get_empty_result')
        .onClick(() => { this.onGetEmptyResult(); })
        .width('45%')
      Button('GetMultiple')
        .id('btn_param_get_multiple')
        .onClick(() => { this.onGetMultipleSpans(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  getButtonsBlock6(): void {
    Row() {
      Button('GetAssertNonEmpty')
        .id('btn_param_get_assert_non_empty')
        .onClick(() => { this.onGetAssertNonEmpty(); })
        .width('45%')
      Button('GetAssertEmpty')
        .id('btn_param_get_assert_empty')
        .onClick(() => { this.onGetAssertEmpty(); })
        .width('45%')
    }.width('100%').height('5%')
  }

  build() {
    Scroll() {
      Column() {
        this.editorsBlock()
        this.addButtonsBlock1()
        this.addButtonsBlock2()
        this.addButtonsBlock3()
        this.addButtonsBlock4()
        this.addButtonsBlock5()
        this.addButtonsBlock6()
        this.addButtonsBlock7()
        this.addButtonsBlock8()
        this.addButtonsBlock9()
        this.addButtonsBlock10()
        this.getButtonsBlock1()
        this.getButtonsBlock2()
        this.getButtonsBlock3()
        this.getButtonsBlock4()
        this.getButtonsBlock5()
        this.getButtonsBlock6()
      }
      .width('100%')
      .padding(5)
    }
    .width('100%')
    .height('100%')
  }
}
