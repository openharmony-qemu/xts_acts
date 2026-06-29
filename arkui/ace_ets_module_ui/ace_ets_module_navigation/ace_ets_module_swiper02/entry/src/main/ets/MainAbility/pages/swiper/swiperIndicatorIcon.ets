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
  private symbolModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @State arr: string[] = ['0', '1'];

  build() {
    Scroll() {
      Column() {
        // Test 1: indicatorIcon with ResourceStr type (using $r)
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
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([
              { index: 0, icon: $r('sys.media.ohos_ic_public_albums') },
              { index: 1, icon: $r('sys.media.ohos_ic_public_albums') }
            ]))

        // Test 2: indicatorIcon with SymbolGlyphModifier type
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
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([
              { index: 0, icon: this.symbolModifier },
              { index: 1, icon: this.symbolModifier }
            ]))

        // Test 3: indicatorIcon with null parameter
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
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon(null))

        // Test 4: indicatorIcon with undefined parameter
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
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon(undefined))

        // Test 5: indicatorIcon with empty array
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
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([]))

        // Test 6: indicatorIcon with index out of range
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
        .id('swiper_indicator_icon_index_out_of_range')
        .indicator(
          new DotIndicator()
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([
              { index: 999, icon: $r('sys.media.ohos_ic_public_albums') }
            ]))

        // Test 7: indicatorIcon with invalid icon (show default dot indicator)
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
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([
              { index: 0, icon: '' }
            ]))

        // Test 8: default indicator without indicatorIcon
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
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20))
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}