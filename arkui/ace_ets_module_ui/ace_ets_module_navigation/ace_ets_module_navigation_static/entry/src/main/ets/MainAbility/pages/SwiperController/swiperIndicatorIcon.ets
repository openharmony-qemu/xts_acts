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
'use static'

import { SymbolGlyphModifier } from '@kit.ArkUI'
import {
  Entry, Text, Column, Component, Swiper, Scroll, Color, DotIndicator, ForEach
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SwiperIndicatorIconPage {
  private symbolModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @State arr: string[] = ['0', '1'];

  build() {
    Scroll() {
      Column() {
        Text('Swiper indicatorIcon test')
        Text('indicatorIcon with ResourceStr type')
          .fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .id('swiper_indicator_icon_resourceStr')
        .width('90%')
        .height('10%')
        .indicator(
          DotIndicator()
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([
              { index: 0, icon: $r('sys.media.ohos_ic_public_albums') },
              { index: 1, icon: $r('sys.media.ohos_ic_public_albums') }
            ]))

        Text('indicatorIcon with SymbolGlyphModifier type')
          .fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .id('swiper_indicator_icon_symbolGlyph')
        .width('90%')
        .height('10%')
        .indicator(
          DotIndicator()
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([
              { index: 0, icon: this.symbolModifier },
              { index: 1, icon: this.symbolModifier }
            ]))

        Text('indicatorIcon with null parameter')
          .fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .id('swiper_indicator_icon_null')
        .width('90%')
        .height('10%')
        .indicator(
          DotIndicator()
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon(null))

        Text('indicatorIcon with undefined parameter')
          .fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .id('swiper_indicator_icon_undefined')
        .width('90%')
        .height('10%')
        .indicator(
          DotIndicator()
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon(undefined))

        Text('indicatorIcon with empty array')
          .fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .id('swiper_indicator_icon_empty_array')
        .width('90%')
        .height('10%')
        .indicator(
          DotIndicator()
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([]))

        Text('indicatorIcon with index out of range')
          .fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .id('swiper_indicator_icon_index_out_of_range')
        .width('90%')
        .height('10%')
        .indicator(
          DotIndicator()
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([
              { index: 999, icon: $r('sys.media.ohos_ic_public_albums') }
            ]))

        Text('indicatorIcon with invalid icon')
          .fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .id('swiper_indicator_icon_invalid_icon')
        .width('90%')
        .height('10%')
        .indicator(
          DotIndicator()
            .itemWidth(20)
            .itemHeight(20)
            .selectedItemWidth(20)
            .selectedItemHeight(20)
            .indicatorIcon([
              { index: 0, icon: '' }
            ]))

        Text('default indicator without indicatorIcon')
          .fontSize(10)
        Swiper() {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height('50%')
              .backgroundColor(0xAFEEEE)
          })
        }
        .id('swiper_indicator_default')
        .width('90%')
        .height('10%')
        .indicator(
          DotIndicator()
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