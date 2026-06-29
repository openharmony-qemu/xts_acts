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
  LengthMetrics,
  Entry,
  Component,
  ParagraphStyle,
  StyledString,
  StyledStringKey,
  TextController,
  Row,
  Column,
  Text,
  CopyOptions,
  AppStorage,
  ColumnOptions,
} from '@kit.ArkUI';

@Entry
@Component
struct ParagraphStyleTailIndents {
  paragraphStyleAttr0: ParagraphStyle = new ParagraphStyle({ tailIndents: LengthMetrics.vp(20) });
  paragraphStyleAttr1: ParagraphStyle = new ParagraphStyle({ tailIndents: [LengthMetrics.vp(10), LengthMetrics.vp(30)] });
  paragraphStyleAttr2: ParagraphStyle = new ParagraphStyle({ tailIndents: undefined });
  paragraphStyleAttr3: ParagraphStyle = new ParagraphStyle({});
  paragraphStyleAttr4: ParagraphStyle = new ParagraphStyle({ tailIndents: LengthMetrics.vp(0) });
  paragraphStyleAttr5: ParagraphStyle = new ParagraphStyle({ tailIndents: LengthMetrics.vp(2147483647) });
  paragraphStyleAttr6: ParagraphStyle = new ParagraphStyle({ tailIndents: LengthMetrics.vp(-10) });

  paragraphStyledString: StyledString = new StyledString('AAAA\nBBBB\nCCCC\nDDDD\nEEEE\nFFFF\nGGGG', [
    {
      start: 0, length: 4, styledKey: StyledStringKey.PARAGRAPH_STYLE, styledValue: this.paragraphStyleAttr0
    },
    {
      start: 5, length: 4, styledKey: StyledStringKey.PARAGRAPH_STYLE, styledValue: this.paragraphStyleAttr1
    },
    {
      start: 10, length: 4, styledKey: StyledStringKey.PARAGRAPH_STYLE, styledValue: this.paragraphStyleAttr2
    },
    {
      start: 15, length: 4, styledKey: StyledStringKey.PARAGRAPH_STYLE, styledValue: this.paragraphStyleAttr3
    },
    {
      start: 20, length: 4, styledKey: StyledStringKey.PARAGRAPH_STYLE, styledValue: this.paragraphStyleAttr4
    },
    {
      start: 25, length: 4, styledKey: StyledStringKey.PARAGRAPH_STYLE, styledValue: this.paragraphStyleAttr5
    },
    {
      start: 30, length: 4, styledKey: StyledStringKey.PARAGRAPH_STYLE, styledValue: this.paragraphStyleAttr6
    }
  ]);

  controller: TextController = new TextController();

  onPageShow() {
    this.controller.setStyledString(this.paragraphStyledString)
  }

  build() {
    Row() {
      Column({ space: 5 } as ColumnOptions) {
        Text(undefined, { controller: this.controller })
          .width(240)
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)

        Text('点击查询tailIndents')
          .id('textParagraphStyleTailIndentsTest')
          .onClick(() => {
            let styles = this.paragraphStyledString.getStyles(0, this.paragraphStyledString.length)
            if (styles!.length !== 0) {
              for (let i: int = 0; i < styles!.length; i++) {
                if (styles![i].styledKey === 200) {
                  let paraAttr = styles![i].styledValue as ParagraphStyle
                  if (paraAttr.tailIndents !== undefined) {
                    AppStorage.setOrCreate('StyledStringTailIndents_' + i + '_tailIndents',
                      JSON.stringify(paraAttr.tailIndents))
                  } else {
                    AppStorage.setOrCreate('StyledStringTailIndents_' + i + '_tailIndents', 'undefined')
                  }
                }
              }
            }
          })
          .margin({ top: 10 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
