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

@Entry
@Component
struct RichEditorBuilderSpanParamPage {
  controller: RichEditorController = new RichEditorController();
  freshController: RichEditorController = new RichEditorController();

  @Builder
  spanBuilder() {
    Text('BS').fontSize(16)
  }

  private storeResult(key: string, value: string): void {
    AppStorage.setOrCreate(key, value);
  }

  private storeGetResult(key: string, infos: Array<BuilderSpanInfo> | undefined): void {
    if (infos === undefined) {
      this.storeResult(key, 'undefined');
      return;
    }
    let parts: string[] = [];
    for (let i = 0; i < infos.length; i++) {
      let idVal: string = infos[i].id ?? 'undefined';
      let offVal: string = String(infos[i].offset ?? -1);
      parts.push(`${idVal}:${offVal}`);
    }
    this.storeResult(key, `${infos.length}|${parts.join(',')}`);
  }

  private makeFullSpan(tag: string): RichEditorBuilderSpan {
    return {
      builder: (): void => {
        this.spanBuilder();
      },
      onAttach: (info: BuilderSpanInfo): void => {
        this.storeResult(`${tag}_onAttach_id`, info.id ?? 'undefined');
        this.storeResult(`${tag}_onAttach_offset`, String(info.offset ?? -1));
      },
      onDetach: (info: BuilderSpanInfo): void => {
        this.storeResult(`${tag}_onDetach_id`, info.id ?? 'undefined');
        this.storeResult(`${tag}_onDetach_offset`, String(info.offset ?? -1));
      },
      accessibilitySpanOptions: {
        accessibilityText: 'builder-span-text',
        accessibilityDescription: 'builder-span-desc',
        accessibilityLevel: 'yes'
      }
    };
  }

  private makeBuilderOnlySpan(): RichEditorBuilderSpan {
    return {
      builder: (): void => {
        this.spanBuilder();
      }
    };
  }

  private makeOnAttachSpan(tag: string): RichEditorBuilderSpan {
    return {
      builder: (): void => {
        this.spanBuilder();
      },
      onAttach: (info: BuilderSpanInfo): void => {
        this.storeResult(`${tag}_onAttach_id`, info.id ?? 'undefined');
        this.storeResult(`${tag}_onAttach_offset`, String(info.offset ?? -1));
      }
    };
  }

  private makeOnDetachSpan(tag: string): RichEditorBuilderSpan {
    return {
      builder: (): void => {
        this.spanBuilder();
      },
      onDetach: (info: BuilderSpanInfo): void => {
        this.storeResult(`${tag}_onDetach_id`, info.id ?? 'undefined');
        this.storeResult(`${tag}_onDetach_offset`, String(info.offset ?? -1));
      }
    };
  }

  private makeAccessibleTextSpan(): RichEditorBuilderSpan {
    return {
      builder: (): void => {
        this.spanBuilder();
      },
      accessibilitySpanOptions: {
        accessibilityText: 'acc-text',
        accessibilityDescription: 'acc-desc',
        accessibilityLevel: 'yes'
      }
    };
  }

  private onAddComplete(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_complete'),
        { id: 'id_complete', offset: 0 }
      );
      this.storeResult('param_add_complete', String(idx));
    } catch (err) {
      this.storeResult('param_add_complete', 'failed');
      console.info('addRichEditorBuilderSpan complete error' + err);
    }
  }

  private onAddInfoUndefined(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_info_undef'),
        undefined
      );
      this.storeResult('param_add_info_undefined', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_undefined', 'failed');
      console.info('addRichEditorBuilderSpan info undefined error' + err);
    }
  }

  private onAddInfoNull(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_info_null'),
        null
      );
      this.storeResult('param_add_info_null', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_null', 'failed');
      console.info('addRichEditorBuilderSpan info null error' + err);
    }
  }

  private onAddInfoIdEmpty(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_id_empty'),
        { id: '', offset: 0 }
      );
      this.storeResult('param_add_info_id_empty', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_id_empty', 'failed');
      console.info('addRichEditorBuilderSpan id empty error' + err);
    }
  }

  private onAddInfoIdUndefined(): void {
    try {
      let info: BuilderSpanInfo = { id: undefined, offset: 0 };
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_id_undef'),
        info
      );
      this.storeResult('param_add_info_id_undefined', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_id_undefined', 'failed');
      console.info('addRichEditorBuilderSpan id undefined error' + err);
    }
  }

  private onAddInfoOffsetZero(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_off_zero'),
        { id: 'id_off_zero', offset: 0 }
      );
      this.storeResult('param_add_info_offset_zero', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_offset_zero', 'failed');
      console.info('addRichEditorBuilderSpan offset zero error' + err);
    }
  }

  private onAddInfoOffsetNegative(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_off_neg'),
        { id: 'id_off_neg', offset: -1 }
      );
      this.storeResult('param_add_info_offset_negative', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_offset_negative', 'failed');
      console.info('addRichEditorBuilderSpan offset negative error' + err);
    }
  }

  private onAddInfoOffsetLarge(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_off_large'),
        { id: 'id_off_large', offset: 999999 }
      );
      this.storeResult('param_add_info_offset_large', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_offset_large', 'failed');
      console.info('addRichEditorBuilderSpan offset large error' + err);
    }
  }

  private onAddInfoOffsetUndefined(): void {
    try {
      let info: BuilderSpanInfo = { id: 'id_off_undef', offset: undefined };
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_off_undef'),
        info
      );
      this.storeResult('param_add_info_offset_undefined', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_offset_undefined', 'failed');
      console.info('addRichEditorBuilderSpan offset undefined error' + err);
    }
  }

  private onAddInfoOnlyId(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_only_id'),
        { id: 'id_only' }
      );
      this.storeResult('param_add_info_only_id', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_only_id', 'failed');
      console.info('addRichEditorBuilderSpan only id error' + err);
    }
  }

  private onAddInfoOnlyOffset(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeFullSpan('add_only_off'),
        { offset: 0 }
      );
      this.storeResult('param_add_info_only_offset', String(idx));
    } catch (err) {
      this.storeResult('param_add_info_only_offset', 'failed');
      console.info('addRichEditorBuilderSpan only offset error' + err);
    }
  }

  private onAddSpanBuilderOnly(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeBuilderOnlySpan(),
        { id: 'id_builder_only', offset: 0 }
      );
      this.storeResult('param_add_span_builder_only', String(idx));
    } catch (err) {
      this.storeResult('param_add_span_builder_only', 'failed');
      console.info('addRichEditorBuilderSpan builder only error' + err);
    }
  }

  private onAddSpanOnAttach(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeOnAttachSpan('add_onAttach'),
        { id: 'id_onAttach', offset: 0 }
      );
      this.storeResult('param_add_span_onAttach', String(idx));
    } catch (err) {
      this.storeResult('param_add_span_onAttach', 'failed');
      console.info('addRichEditorBuilderSpan onAttach error' + err);
    }
  }

  private onAddSpanOnDetach(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeOnDetachSpan('add_onDetach'),
        { id: 'id_onDetach', offset: 0 }
      );
      this.storeResult('param_add_span_onDetach', String(idx));
    } catch (err) {
      this.storeResult('param_add_span_onDetach', 'failed');
      console.info('addRichEditorBuilderSpan onDetach error' + err);
    }
  }

  private onAddSpanAccessibleText(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        this.makeAccessibleTextSpan(),
        { id: 'id_acc', offset: 0 }
      );
      this.storeResult('param_add_span_accessibleText', String(idx));
    } catch (err) {
      this.storeResult('param_add_span_accessibleText', 'failed');
      console.info('addRichEditorBuilderSpan accessibleText error' + err);
    }
  }

  private onAddSpanBuilderUndefined(): void {
    try {
      let span: RichEditorBuilderSpan = {
        builder: undefined,
        onAttach: (info: BuilderSpanInfo): void => {
          this.storeResult('add_builder_undef_onAttach', info.id ?? 'undefined');
        }
      };
      let idx: number = this.controller.addRichEditorBuilderSpan(
        span,
        { id: 'id_builder_undef', offset: 0 }
      );
      this.storeResult('param_add_span_builder_undefined', String(idx));
    } catch (err) {
      this.storeResult('param_add_span_builder_undefined', 'failed');
      console.info('addRichEditorBuilderSpan builder undefined error' + err);
    }
  }

  private onAddSpanNull(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        null,
        { id: 'id_span_null', offset: 0 }
      );
      this.storeResult('param_add_span_null', String(idx));
    } catch (err) {
      this.storeResult('param_add_span_null', 'failed');
      console.info('addRichEditorBuilderSpan span null error' + err);
    }
  }

  private onAddSpanUndefined(): void {
    try {
      let idx: number = this.controller.addRichEditorBuilderSpan(
        undefined,
        { id: 'id_span_undefined', offset: 0 }
      );
      this.storeResult('param_add_span_undefined', String(idx));
    } catch (err) {
      this.storeResult('param_add_span_undefined', 'failed');
      console.info('addRichEditorBuilderSpan span undefined error' + err);
    }
  }

  private onGetAll(): void {
    try {
      this.storeGetResult('param_get_all', this.controller.getRichEditorBuilderSpans());
    } catch (err) {
      this.storeResult('param_get_all', 'failed');
      console.info('getRichEditorBuilderSpans all error' + err);
    }
  }

  private onGetUndefined(): void {
    try {
      this.storeGetResult('param_get_undefined', this.controller.getRichEditorBuilderSpans(undefined));
    } catch (err) {
      this.storeResult('param_get_undefined', 'failed');
      console.info('getRichEditorBuilderSpans undefined error' + err);
    }
  }

  private onGetNull(): void {
    try {
      this.storeGetResult('param_get_null', this.controller.getRichEditorBuilderSpans(null));
    } catch (err) {
      this.storeResult('param_get_null', 'failed');
      console.info('getRichEditorBuilderSpans null error' + err);
    }
  }

  private onGetRangeNormal(): void {
    try {
      this.storeGetResult(
        'param_get_range_normal',
        this.controller.getRichEditorBuilderSpans({ start: 0, end: 2 })
      );
    } catch (err) {
      this.storeResult('param_get_range_normal', 'failed');
      console.info('getRichEditorBuilderSpans range normal error' + err);
    }
  }

  private onGetRangeEmpty(): void {
    try {
      this.storeGetResult(
        'param_get_range_empty',
        this.controller.getRichEditorBuilderSpans({ start: 0, end: 0 })
      );
    } catch (err) {
      this.storeResult('param_get_range_empty', 'failed');
      console.info('getRichEditorBuilderSpans range empty error' + err);
    }
  }

  private onGetRangeOnlyStart(): void {
    try {
      this.storeGetResult(
        'param_get_range_only_start',
        this.controller.getRichEditorBuilderSpans({ start: 0 })
      );
    } catch (err) {
      this.storeResult('param_get_range_only_start', 'failed');
      console.info('getRichEditorBuilderSpans only start error' + err);
    }
  }

  private onGetRangeOnlyEnd(): void {
    try {
      this.storeGetResult(
        'param_get_range_only_end',
        this.controller.getRichEditorBuilderSpans({ end: 5 })
      );
    } catch (err) {
      this.storeResult('param_get_range_only_end', 'failed');
      console.info('getRichEditorBuilderSpans only end error' + err);
    }
  }

  private onGetRangeNegative(): void {
    try {
      this.storeGetResult(
        'param_get_range_negative',
        this.controller.getRichEditorBuilderSpans({ start: -1, end: -1 })
      );
    } catch (err) {
      this.storeResult('param_get_range_negative', 'failed');
      console.info('getRichEditorBuilderSpans negative error' + err);
    }
  }

  private onGetRangeLargeEnd(): void {
    try {
      this.storeGetResult(
        'param_get_range_large_end',
        this.controller.getRichEditorBuilderSpans({ start: 0, end: 999999 })
      );
    } catch (err) {
      this.storeResult('param_get_range_large_end', 'failed');
      console.info('getRichEditorBuilderSpans large end error' + err);
    }
  }

  private onGetRangeReversed(): void {
    try {
      this.storeGetResult(
        'param_get_range_reversed',
        this.controller.getRichEditorBuilderSpans({ start: 999999, end: 0 })
      );
    } catch (err) {
      this.storeResult('param_get_range_reversed', 'failed');
      console.info('getRichEditorBuilderSpans reversed error' + err);
    }
  }

  private onGetNoSpan(): void {
    try {
      this.storeGetResult(
        'param_get_no_span',
        this.freshController.getRichEditorBuilderSpans()
      );
    } catch (err) {
      this.storeResult('param_get_no_span', 'failed');
      console.info('getRichEditorBuilderSpans no span error' + err);
    }
  }

  private onGetAfterDelete(): void {
    try {
      this.controller.deleteSpans();
      this.storeGetResult(
        'param_get_after_delete',
        this.controller.getRichEditorBuilderSpans()
      );
    } catch (err) {
      this.storeResult('param_get_after_delete', 'failed');
      console.info('getRichEditorBuilderSpans after delete error' + err);
    }
  }

  private onDeleteSpans(): void {
    try {
      this.controller.deleteSpans();
      this.storeResult('param_delete_spans', 'success');
    } catch (err) {
      this.storeResult('param_delete_spans', 'failed');
      console.info('deleteSpans error' + err);
    }
  }

  private onSeedContent(): void {
    try {
      this.controller.addTextSpan('seed');
      this.storeResult('param_seed_content', 'success');
    } catch (err) {
      this.storeResult('param_seed_content', 'failed');
      console.info('seed content error' + err);
    }
  }

  build() {
    Scroll() {
      Column() {
        RichEditor({ controller: this.controller })
          .id('richEditor_builderSpan_param')
          .width('100%')
          .height('8%')
          .borderWidth(1)
          .borderColor(Color.Gray)
          .onReady(() => {
            this.controller.addTextSpan('seed');
          })
        RichEditor({ controller: this.freshController })
          .id('richEditor_builderSpan_fresh')
          .width('100%')
          .height('6%')
          .borderWidth(1)
          .borderColor(Color.Blue)
        Row() {
          Button('SeedContent')
            .id('btn_param_seed')
            .onClick(() => {
              this.onSeedContent();
            })
            .width('45%')
          Button('DeleteSpans')
            .id('btn_param_delete')
            .onClick(() => {
              this.onDeleteSpans();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddComplete')
            .id('btn_add_complete')
            .onClick(() => {
              this.onAddComplete();
            })
            .width('45%')
          Button('AddInfoUndef')
            .id('btn_add_info_undefined')
            .onClick(() => {
              this.onAddInfoUndefined();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddInfoNull')
            .id('btn_add_info_null')
            .onClick(() => {
              this.onAddInfoNull();
            })
            .width('45%')
          Button('AddIdEmpty')
            .id('btn_add_info_id_empty')
            .onClick(() => {
              this.onAddInfoIdEmpty();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddIdUndef')
            .id('btn_add_info_id_undefined')
            .onClick(() => {
              this.onAddInfoIdUndefined();
            })
            .width('45%')
          Button('AddOffZero')
            .id('btn_add_info_offset_zero')
            .onClick(() => {
              this.onAddInfoOffsetZero();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddOffNeg')
            .id('btn_add_info_offset_negative')
            .onClick(() => {
              this.onAddInfoOffsetNegative();
            })
            .width('45%')
          Button('AddOffLarge')
            .id('btn_add_info_offset_large')
            .onClick(() => {
              this.onAddInfoOffsetLarge();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddOffUndef')
            .id('btn_add_info_offset_undefined')
            .onClick(() => {
              this.onAddInfoOffsetUndefined();
            })
            .width('45%')
          Button('AddOnlyId')
            .id('btn_add_info_only_id')
            .onClick(() => {
              this.onAddInfoOnlyId();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddOnlyOff')
            .id('btn_add_info_only_offset')
            .onClick(() => {
              this.onAddInfoOnlyOffset();
            })
            .width('45%')
          Button('AddBuilderOnly')
            .id('btn_add_span_builder_only')
            .onClick(() => {
              this.onAddSpanBuilderOnly();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddOnAttach')
            .id('btn_add_span_onAttach')
            .onClick(() => {
              this.onAddSpanOnAttach();
            })
            .width('45%')
          Button('AddOnDetach')
            .id('btn_add_span_onDetach')
            .onClick(() => {
              this.onAddSpanOnDetach();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddAcc')
            .id('btn_add_span_accessibleText')
            .onClick(() => {
              this.onAddSpanAccessibleText();
            })
            .width('45%')
          Button('AddBuilderUndef')
            .id('btn_add_span_builder_undefined')
            .onClick(() => {
              this.onAddSpanBuilderUndefined();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('AddSpanNull')
            .id('btn_add_span_null')
            .onClick(() => {
              this.onAddSpanNull();
            })
            .width('45%')
          Button('AddSpanUndef')
            .id('btn_add_span_undefined')
            .onClick(() => {
              this.onAddSpanUndefined();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('GetAll')
            .id('btn_get_all')
            .onClick(() => {
              this.onGetAll();
            })
            .width('45%')
          Button('GetUndef')
            .id('btn_get_undefined')
            .onClick(() => {
              this.onGetUndefined();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('GetNull')
            .id('btn_get_null')
            .onClick(() => {
              this.onGetNull();
            })
            .width('45%')
          Button('GetRangeNormal')
            .id('btn_get_range_normal')
            .onClick(() => {
              this.onGetRangeNormal();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('GetRangeEmpty')
            .id('btn_get_range_empty')
            .onClick(() => {
              this.onGetRangeEmpty();
            })
            .width('45%')
          Button('GetOnlyStart')
            .id('btn_get_range_only_start')
            .onClick(() => {
              this.onGetRangeOnlyStart();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('GetOnlyEnd')
            .id('btn_get_range_only_end')
            .onClick(() => {
              this.onGetRangeOnlyEnd();
            })
            .width('45%')
          Button('GetNegative')
            .id('btn_get_range_negative')
            .onClick(() => {
              this.onGetRangeNegative();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('GetLargeEnd')
            .id('btn_get_range_large_end')
            .onClick(() => {
              this.onGetRangeLargeEnd();
            })
            .width('45%')
          Button('GetReversed')
            .id('btn_get_range_reversed')
            .onClick(() => {
              this.onGetRangeReversed();
            })
            .width('45%')
        }.width('100%').height('5%')
        Row() {
          Button('GetNoSpan')
            .id('btn_get_no_span')
            .onClick(() => {
              this.onGetNoSpan();
            })
            .width('45%')
          Button('GetAfterDelete')
            .id('btn_get_after_delete')
            .onClick(() => {
              this.onGetAfterDelete();
            })
            .width('45%')
        }.width('100%').height('5%')
      }
      .width('100%')
      .padding(5)
    }
    .width('100%')
    .height('100%')
  }
}
