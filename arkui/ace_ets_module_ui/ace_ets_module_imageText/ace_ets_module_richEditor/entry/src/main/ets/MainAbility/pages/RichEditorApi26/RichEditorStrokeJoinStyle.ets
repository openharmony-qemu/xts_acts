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
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).textStyle) {
              let strokeJoinStyle: StrokeJoinStyle | undefined = 
                (spans[0] as RichEditorTextSpanResult).textStyle.strokeJoinStyle;
              AppStorage.setOrCreate('strokeJoinStyle_miter_join', String(strokeJoinStyle));
            }
          })

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
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).textStyle) {
              let strokeJoinStyle: StrokeJoinStyle | undefined = 
                (spans[0] as RichEditorTextSpanResult).textStyle.strokeJoinStyle;
              AppStorage.setOrCreate('strokeJoinStyle_round_join', String(strokeJoinStyle));
            }
          })

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
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).textStyle) {
              let strokeJoinStyle: StrokeJoinStyle | undefined = 
                (spans[0] as RichEditorTextSpanResult).textStyle.strokeJoinStyle;
              AppStorage.setOrCreate('strokeJoinStyle_bevel_join', String(strokeJoinStyle));
            }
          })

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
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).textStyle) {
              let strokeJoinStyle: StrokeJoinStyle | undefined = 
                (spans[0] as RichEditorTextSpanResult).textStyle.strokeJoinStyle;
              AppStorage.setOrCreate('strokeJoinStyle_null', String(strokeJoinStyle));
            }
          })

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
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).textStyle) {
              let strokeJoinStyle: StrokeJoinStyle | undefined = 
                (spans[0] as RichEditorTextSpanResult).textStyle.strokeJoinStyle;
              AppStorage.setOrCreate('strokeJoinStyle_undefined', String(strokeJoinStyle));
            }
          })

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
            if (spans.length > 0 && (spans[0] as RichEditorTextSpanResult).textStyle) {
              let strokeJoinStyle: StrokeJoinStyle | undefined = 
                (spans[0] as RichEditorTextSpanResult).textStyle.strokeJoinStyle;
              AppStorage.setOrCreate('strokeJoinStyle_default', String(strokeJoinStyle));
            }
          })

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