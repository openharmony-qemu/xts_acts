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

import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct SwiperIndicatorIcon {
  @State arr: string[] = ['0', '1', '2', '3'];
  private symbolModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @State iconDiff: Array<IndicatorIconInfo> = [{index:0, icon: $r('app.media.icon')},
    {index:1, icon: $r('sys.media.ohos_ic_public_clock')},
    {index:2, icon: new SymbolGlyphModifier($r('sys.symbol.trash')).fontColor([Color.Red])},
    {index:3, icon: new SymbolGlyphModifier($r('sys.symbol.cake')).fontColor([Color.Black])}]

  build() {
    Scroll() {
      Column() {
        Text('indicatorIcon ResourceStr').fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .width('90%')
        .height('10%')
        .id('swiper_indicator_icon_resourceStr')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon([
              { index: 0, icon: $r('sys.media.ohos_ic_public_albums') },
              { index: 1, icon: $r('sys.media.ohos_ic_public_albums') }
            ]))

        Text('indicatorIcon SymbolGlyphModifier').fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .width('90%')
        .height('10%')
        .id('swiper_indicator_icon_symbolGlyph')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon([
              { index: 0, icon: this.symbolModifier },
              { index: 1, icon: this.symbolModifier }
            ]))

        Text('indicatorIcon null').fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .width('90%')
        .height('10%')
        .id('swiper_indicator_icon_null')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon(null))

        Text('indicatorIcon undefined').fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .width('90%')
        .height('10%')
        .id('swiper_indicator_icon_undefined')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon(undefined))

        Text('indicatorIcon empty').fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .width('90%')
        .height('10%')
        .id('swiper_indicator_icon_empty_array')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon([]))

        Text('indicatorIcon index all diff').fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .width('90%')
        .height('10%')
        .id('swiper_indicator_icon_index')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon(this.iconDiff))

        Text('indicatorIcon invalid icon').fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .width('90%')
        .height('10%')
        .id('swiper_indicator_icon_invalid_icon')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon([
              { index: 0, icon: '' }
            ]))

        Text('indicatorIcon without').fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .width('90%')
        .height('10%')
        .id('swiper_indicator_default')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue))
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}