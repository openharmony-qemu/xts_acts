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

import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  Scroll,
  RichEditor,
  RichEditorController,
  RichEditorOptions,
  RichEditorTextSpanResult,
  RichEditorImageSpanResult,
  Color,
  StrokeJoinStyle
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RichEditorStrokeJoinStyle {
  controllerMiterJoin: RichEditorController = new RichEditorController();
  optionsMiterJoin: RichEditorOptions = { controller: this.controllerMiterJoin };

  controllerRoundJoin: RichEditorController = new RichEditorController();
  optionsRoundJoin: RichEditorOptions = { controller: this.controllerRoundJoin };

  controllerBevelJoin: RichEditorController = new RichEditorController();
  optionsBevelJoin: RichEditorOptions = { controller: this.controllerBevelJoin };

  controllerNull: RichEditorController = new RichEditorController();
  optionsNull: RichEditorOptions = { controller: this.controllerNull };

  controllerUndefined: RichEditorController = new RichEditorController();
  optionsUndefined: RichEditorOptions = { controller: this.controllerUndefined };

  controllerDefault: RichEditorController = new RichEditorController();
  optionsDefault: RichEditorOptions = { controller: this.controllerDefault };

  @State miterJoinResult: string = '';
  @State roundJoinResult: string = '';
  @State bevelJoinResult: string = '';
  @State nullResult: string = '';
  @State undefinedResult: string = '';
  @State defaultResult: string = '';

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Button('Get MITER_JOIN Value')
          .id('btn_strokeJoinStyle_miter_join')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerMiterJoin.getSpans();
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.textStyle) {
                let strokeJoinStyle: StrokeJoinStyle | undefined = spanResult.textStyle.strokeJoinStyle;
                this.miterJoinResult = String(strokeJoinStyle);
              }
            }
          })

        Text(`miterJoinResult=${this.miterJoinResult}`)
          .id('text_strokeJoinStyle_miter_join')
          .height('5%')
          .width('100%')

        RichEditor(this.optionsMiterJoin)
          .id('richEditor_strokeJoinStyle_miter_join')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            this.controllerMiterJoin.addTextSpan('test miter join', {
              style: {
                strokeJoinStyle: StrokeJoinStyle.MITER_JOIN
              }
            });
          })

        Button('Get ROUND_JOIN Value')
          .id('btn_strokeJoinStyle_round_join')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerRoundJoin.getSpans();
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.textStyle) {
                let strokeJoinStyle: StrokeJoinStyle | undefined = spanResult.textStyle.strokeJoinStyle;
                this.roundJoinResult = String(strokeJoinStyle);
              }
            }
          })

        Text(`roundJoinResult=${this.roundJoinResult}`)
          .id('text_strokeJoinStyle_round_join')
          .height('5%')
          .width('100%')

        RichEditor(this.optionsRoundJoin)
          .id('richEditor_strokeJoinStyle_round_join')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            this.controllerRoundJoin.addTextSpan('test round join', {
              style: {
                strokeJoinStyle: StrokeJoinStyle.ROUND_JOIN
              }
            });
          })

        Button('Get BEVEL_JOIN Value')
          .id('btn_strokeJoinStyle_bevel_join')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerBevelJoin.getSpans();
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.textStyle) {
                let strokeJoinStyle: StrokeJoinStyle | undefined = spanResult.textStyle.strokeJoinStyle;
                this.bevelJoinResult = String(strokeJoinStyle);
              }
            }
          })

        Text(`bevelJoinResult=${this.bevelJoinResult}`)
          .id('text_strokeJoinStyle_bevel_join')
          .height('5%')
          .width('100%')

        RichEditor(this.optionsBevelJoin)
          .id('richEditor_strokeJoinStyle_bevel_join')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            this.controllerBevelJoin.addTextSpan('test bevel join', {
              style: {
                strokeJoinStyle: StrokeJoinStyle.BEVEL_JOIN
              }
            });
          })

        Button('Get NULL Value')
          .id('btn_strokeJoinStyle_null')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerNull.getSpans();
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.textStyle) {
                let strokeJoinStyle: StrokeJoinStyle | undefined = spanResult.textStyle.strokeJoinStyle;
                this.nullResult = String(strokeJoinStyle);
              }
            }
          })

        Text(`nullResult=${this.nullResult}`)
          .id('text_strokeJoinStyle_null')
          .height('5%')
          .width('100%')

        RichEditor(this.optionsNull)
          .id('richEditor_strokeJoinStyle_null')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            this.controllerNull.addTextSpan('test null', {
              style: {
                strokeJoinStyle: null
              }
            });
          })

        Button('Get UNDEFINED Value')
          .id('btn_strokeJoinStyle_undefined')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerUndefined.getSpans();
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.textStyle) {
                let strokeJoinStyle: StrokeJoinStyle | undefined = spanResult.textStyle.strokeJoinStyle;
                this.undefinedResult = String(strokeJoinStyle);
              }
            }
          })

        Text(`undefinedResult=${this.undefinedResult}`)
          .id('text_strokeJoinStyle_undefined')
          .height('5%')
          .width('100%')

        RichEditor(this.optionsUndefined)
          .id('richEditor_strokeJoinStyle_undefined')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            this.controllerUndefined.addTextSpan('test undefined', {
              style: {
                strokeJoinStyle: undefined
              }
            });
          })

        Button('Get DEFAULT Value')
          .id('btn_strokeJoinStyle_default')
          .height('5%')
          .width('100%')
          .onClick(() => {
            let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] =
              this.controllerDefault.getSpans();
            if (spans.length > 0) {
              let spanResult: RichEditorTextSpanResult = spans[0] as RichEditorTextSpanResult;
              if (spanResult.textStyle) {
                let strokeJoinStyle: StrokeJoinStyle | undefined = spanResult.textStyle.strokeJoinStyle;
                this.defaultResult = String(strokeJoinStyle);
              }
            }
          })

        Text(`defaultResult=${this.defaultResult}`)
          .id('text_strokeJoinStyle_default')
          .height('5%')
          .width('100%')

        RichEditor(this.optionsDefault)
          .id('richEditor_strokeJoinStyle_default')
          .height('5%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Blue)
          .onReady(() => {
            this.controllerDefault.addTextSpan('test default');
          })
      }
      .width('100%')
      .height('100%')
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}