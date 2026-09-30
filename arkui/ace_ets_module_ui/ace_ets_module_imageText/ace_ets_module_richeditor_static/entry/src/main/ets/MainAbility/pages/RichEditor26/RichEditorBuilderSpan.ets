'use static';
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

import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  Scroll,
  Row,
  RichEditor,
  RichEditorController,
  BuilderSpanInfo,
  RichEditorBuilderSpan as RichEditorBuilderSpanValue,
  Color
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RichEditorBuilderSpan {
  controller: RichEditorController = new RichEditorController();
  globalController: RichEditorController = new RichEditorController();

  @Builder
  spanBuilder(): void {
    Text('BS').fontSize(16)
  }

  private storeAttach(tag: string, info: BuilderSpanInfo): void {
    AppStorage.setOrCreate(`${tag}_onAttach_id`, info.id ?? 'undefined');
    AppStorage.setOrCreate(`${tag}_onAttach_offset`, String(info.offset ?? -1));
  }

  private storeDetach(tag: string, info: BuilderSpanInfo): void {
    AppStorage.setOrCreate(`${tag}_onDetach_id`, info.id ?? 'undefined');
    AppStorage.setOrCreate(`${tag}_onDetach_offset`, String(info.offset ?? -1));
  }

  private makeSpan(tag: string): RichEditorBuilderSpanValue {
    return {
      builder: this.spanBuilder,
      onAttach: (info: BuilderSpanInfo): void => {
        this.storeAttach(tag, info);
      },
      onDetach: (info: BuilderSpanInfo): void => {
        this.storeDetach(tag, info);
      },
      accessibilitySpanOptions: {
        accessibilityText: 'builder-span-text',
        accessibilityDescription: 'builder-span-desc',
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

  private onAddWithInfo(): void {
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeSpan('builderSpan_info'),
        { id: 'span_a', offset: 0 }
      );
      AppStorage.setOrCreate('builderSpan_add_with_info', String(idx ?? -1));
    } catch (err) {
      AppStorage.setOrCreate('builderSpan_add_with_info', 'failed');
      console.log('addRichEditorBuilderSpan info error' + err);
    }
  }

  private onAddUndefinedInfo(): void {
    try {
      let idx: int | undefined = this.controller.addRichEditorBuilderSpan(
        this.makeSpan('builderSpan_undef'),
        undefined
      );
      AppStorage.setOrCreate('builderSpan_add_undefined_info', String(idx ?? -1));
    } catch (err) {
      AppStorage.setOrCreate('builderSpan_add_undefined_info', 'failed');
      console.log('addRichEditorBuilderSpan undefined error' + err);
    }
  }

  private onGetAll(): void {
    try {
      this.storeGetResult('builderSpan_get_all', this.controller.getRichEditorBuilderSpans());
    } catch (err) {
      AppStorage.setOrCreate('builderSpan_get_all', 'failed');
      console.log('getRichEditorBuilderSpans all error' + err);
    }
  }

  private onGetRange(): void {
    try {
      this.storeGetResult(
        'builderSpan_get_range',
        this.controller.getRichEditorBuilderSpans({ start: 0, end: 2 })
      );
    } catch (err) {
      AppStorage.setOrCreate('builderSpan_get_range', 'failed');
      console.log('getRichEditorBuilderSpans range error' + err);
    }
  }

  private onGetUndefinedRange(): void {
    try {
      this.storeGetResult(
        'builderSpan_get_undefined',
        this.controller.getRichEditorBuilderSpans(undefined)
      );
    } catch (err) {
      AppStorage.setOrCreate('builderSpan_get_undefined', 'failed');
      console.log('getRichEditorBuilderSpans undefined error' + err);
    }
  }

  private onDeleteSpans(): void {
    try {
      this.controller.deleteSpans();
      AppStorage.setOrCreate('builderSpan_delete', 'success');
    } catch (err) {
      AppStorage.setOrCreate('builderSpan_delete', 'failed');
      console.log('deleteSpans error' + err);
    }
  }

  private onGlobalController(): void {
    try {
      this.globalController.addTextSpan('global-ctrl');
      let spans = this.globalController.getSpans();
      let count: int = spans !== undefined ? spans.length : -1;
      AppStorage.setOrCreate('builderSpan_global_controller', String(count));
    } catch (err) {
      AppStorage.setOrCreate('builderSpan_global_controller', 'failed');
      console.log('global RichEditorController error' + err);
    }
  }

  @Builder
  editorsBlock(): void {
    RichEditor({ controller: this.controller })
      .id('richEditor_builderSpan')
      .width('100%')
      .height('12%')
      .borderWidth(1)
      .borderColor(Color.Gray)
      .onReady(() => {
        this.controller.addTextSpan('seed');
      })
    RichEditor({ controller: this.globalController })
      .id('richEditor_builderSpan_global')
      .width('100%')
      .height('8%')
      .borderWidth(1)
      .borderColor(Color.Blue)
  }

  @Builder
  addButtonsBlock(): void {
    Row() {
      Button('AddWithInfo')
        .id('btn_builderSpan_add_with_info')
        .onClick(() => {
          this.onAddWithInfo();
        })
        .width('45%')
      Button('AddUndefInfo')
        .id('btn_builderSpan_add_undefined_info')
        .onClick(() => {
          this.onAddUndefinedInfo();
        })
        .width('45%')
    }.width('100%').height('5%')
  }

  @Builder
  getButtonsBlock(): void {
    Row() {
      Button('GetAll')
        .id('btn_builderSpan_get_all')
        .onClick(() => {
          this.onGetAll();
        })
        .width('30%')
      Button('GetRange')
        .id('btn_builderSpan_get_range')
        .onClick(() => {
          this.onGetRange();
        })
        .width('30%')
      Button('GetUndef')
        .id('btn_builderSpan_get_undefined')
        .onClick(() => {
          this.onGetUndefinedRange();
        })
        .width('30%')
    }.width('100%').height('5%')
  }

  @Builder
  actionButtonsBlock(): void {
    Row() {
      Button('DeleteSpans')
        .id('btn_builderSpan_delete')
        .onClick(() => {
          this.onDeleteSpans();
        })
        .width('45%')
      Button('GlobalCtrl')
        .id('btn_builderSpan_global_controller')
        .onClick(() => {
          this.onGlobalController();
        })
        .width('45%')
    }.width('100%').height('5%')
  }

  build() {
    Scroll() {
      Column() {
        this.editorsBlock()
        this.addButtonsBlock()
        this.getButtonsBlock()
        this.actionButtonsBlock()
      }
      .width('100%')
      .padding(5)
    }
    .width('100%')
    .height('100%')
  }
}
