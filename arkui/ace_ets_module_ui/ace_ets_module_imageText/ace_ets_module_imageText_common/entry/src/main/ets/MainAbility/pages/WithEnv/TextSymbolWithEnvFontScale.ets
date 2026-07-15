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
import { WithEnv } from '@kit.ArkUI';
@Entry
@Component
struct TextSymbolWithEnvFontScaleExample {
  @State fontScale: number = 1.0;

  build() {
    Column({ space: 5 }) {
      Row() {
        Button('缩小 0.5x')
          .onClick(() => {
            this.fontScale = 0.5;
          })
          .id('ReduceTo0.5Btn')
          .width('33%')
        Button('正常 1.0x')
          .onClick(() => {
            this.fontScale = 1.0;
          })
          .id('ReduceTo1.0Btn')
          .width('33%')
        Button('放大 1.5x')
          .onClick(() => {
            this.fontScale = 1.5;
          })
          .id('ReduceTo1.5Btn')
          .width('33%')
      }.height('5%')
      Column({ space: 8 }) {
        Text('当前字体缩放作用域外的文本')
          .fontSize(16)
        SymbolGlyph($r('sys.symbol.wifi'))
          .fontSize(14)
          .id('WithoutEnvSymbol')
        Text('不受WithEnv影响')
          .fontSize(14)
          .fontColor('#ff00ff')
          .id('WithoutEnvText')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      WithEnv() {
        Column({ space: 8 }) {
          Text('当前字体缩放作用域内的文本')
            .fontSize(16)
          SymbolGlyph($r('sys.symbol.wifi'))
            .fontSize(14)
            .id('WithEnvSymbol')
          Text('受WithEnv影响')
            .fontSize(14)
            .fontColor('#ff00ff')
            .id('WithEnvText')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .env(WritableEnvKey.FONT_SCALE, this.fontScale) // 设置局部字体缩放比例
    }
    .padding(12)
    .width('100%')
  }
}