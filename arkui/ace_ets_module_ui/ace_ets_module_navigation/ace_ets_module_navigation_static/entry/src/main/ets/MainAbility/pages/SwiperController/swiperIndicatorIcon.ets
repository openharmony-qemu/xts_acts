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
  $r,Button,ClickEvent,Color,Column,ColumnOptions,Component,Counter,Curve,Entry,IDataSource,
  LazyForEach,ForEach,Margin,ResourceStr,Row,Scroll,Scroller,Swiper,SwiperController,
  Text,TextAlign,DotIndicator,IndicatorIconInfo
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { SymbolGlyphModifier } from '@kit.ArkUI';
import inspector from '@ohos.arkui.inspector'

@Entry
@Component
struct SwiperIndicatorIconPage {
  @State arr: string[] = ['0', '1', '2', '3'];
  private symbolModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @State iconDiff: IndicatorIconInfo[] = [{index:0, icon: $r('app.media.background')} as IndicatorIconInfo,
    {index:1, icon: $r('app.media.background')} as IndicatorIconInfo,
    {index:2, icon: new SymbolGlyphModifier($r('sys.symbol.trash')).fontColor([Color.Red])} as IndicatorIconInfo,
    {index:3, icon: new SymbolGlyphModifier($r('sys.symbol.cake')).fontColor([Color.Black])} as IndicatorIconInfo]

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
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
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
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon([]))

        Text('indicatorIcon index all diff').fontSize(10)
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
        .id('swiper_indicator_icon_index')
        .width('90%')
        .height('10%')
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(16)
            .selectedItemHeight(16)
            .color(Color.Gray)
            .selectedColor(Color.Blue)
            .indicatorIcon(this.iconDiff))

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