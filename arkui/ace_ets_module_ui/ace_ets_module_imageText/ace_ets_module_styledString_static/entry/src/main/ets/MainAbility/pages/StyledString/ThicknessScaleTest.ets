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
  Entry, Component, DecorationStyle, StyledString, StyledStringKey,
  TextController, Row, Column, Text, Button, TextDecorationType, CopyOptions,
  AppStorage, ColumnOptions, $r
} from '@kit.ArkUI';

@Entry
@Component
struct ThicknessScaleTest {
  decorationStyle0: DecorationStyle = new DecorationStyle({ type: TextDecorationType.LineThrough, thicknessScale: 2 });
  decorationStyle1: DecorationStyle = new DecorationStyle({ type: TextDecorationType.LineThrough, thicknessScale: 0 });
  decorationStyle2: DecorationStyle = new DecorationStyle({ type: TextDecorationType.LineThrough, thicknessScale: undefined });
  decorationStyle3: DecorationStyle = new DecorationStyle({ type: TextDecorationType.LineThrough });

  styledString: StyledString = new StyledString('AAAAABBBBBCCCCCDDDDD', [
    { start: 0, length: 5, styledKey: StyledStringKey.DECORATION, styledValue: this.decorationStyle0 },
    { start: 5, length: 5, styledKey: StyledStringKey.DECORATION, styledValue: this.decorationStyle1 },
    { start: 10, length: 5, styledKey: StyledStringKey.DECORATION, styledValue: this.decorationStyle2 },
    { start: 15, length: 5, styledKey: StyledStringKey.DECORATION, styledValue: this.decorationStyle3 },
  ]);

  controller: TextController = new TextController();

  onPageShow() {
    this.controller.setStyledString(this.styledString);
  }

  build() {
    Row() {
      Column({ space: 5 } as ColumnOptions) {
        Text(undefined, { controller: this.controller })
          .width(240)
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)

        Button('查询thicknessScale')
          .id('btnThicknessScaleTest')
          .onClick(() => {
            let styles = this.styledString.getStyles(0, this.styledString.length);
            if (styles!.length !== 0) {
              for (let i: int = 0; i < styles!.length; i++) {
                if (styles![i].styledKey === 1) {
                  let decoAttr = styles![i].styledValue as DecorationStyle;
                  if (decoAttr.thicknessScale !== undefined) {
                    AppStorage.setOrCreate('StyledStringThicknessScale_' + i + '_thicknessScale',
                      JSON.stringify(decoAttr.thicknessScale));
                  } else {
                    AppStorage.setOrCreate('StyledStringThicknessScale_' + i + '_thicknessScale', 'undefined');
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
