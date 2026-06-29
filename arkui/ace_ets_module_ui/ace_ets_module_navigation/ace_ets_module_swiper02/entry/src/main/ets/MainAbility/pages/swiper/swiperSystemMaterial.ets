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

import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct SwiperSystemMaterial {
  private indicatorController1: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController2: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController3: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController4: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController5: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController6: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController7: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController8: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController9: IndicatorComponentController = new IndicatorComponentController();

  private swiperController1: SwiperController = new SwiperController();
  private swiperController2: SwiperController = new SwiperController();
  private swiperController3: SwiperController = new SwiperController();
  private swiperController4: SwiperController = new SwiperController();
  private swiperController5: SwiperController = new SwiperController();
  private swiperController6: SwiperController = new SwiperController();
  private swiperController7: SwiperController = new SwiperController();
  private swiperController8: SwiperController = new SwiperController();
  private swiperController9: SwiperController = new SwiperController();

  @State list: number[] = [];

  aboutToAppear(): void {
    for (let i = 1; i <= 6; i++) {
      this.list.push(i);
    }
  }

  build() {
    Column() {
      Text('systemMaterial ULTRA_THIN').fontSize(10)
      Column() {
        Swiper(this.swiperController1) {
          ForEach(this.list, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => item.toString())
        }
        .cachedCount(2)
        .index(0)
        .id('swiper_ultra_thin')
        .indicator(this.indicatorController1)
        .loop(true)
        .vertical(false)
        .itemSpace(5)

        IndicatorComponent(this.indicatorController1)
          .initialIndex(0)
          .id('indicator_ultra_thin')
          .style(
            new DotIndicator()
              .itemWidth(15)
              .itemHeight(15)
              .selectedItemWidth(15)
              .selectedItemHeight(15)
              .color(Color.Gray)
              .selectedColor(Color.Blue)
          )
          .loop(true)
          .count(6)
          .vertical(false)
          .systemMaterial(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
            colorInvert: true,
            interactive: true,
            lightEffect: {}
          }))
      }
      .width('100%')
      .height('30%')

      Text('systemMaterial THIN').fontSize(10)
      Column() {
        Swiper(this.swiperController2) {
          ForEach(this.list, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => item.toString())
        }
        .cachedCount(2)
        .index(0)
        .id('swiper_thin_colorInvert')
        .indicator(this.indicatorController2)
        .loop(true)
        .vertical(false)
        .itemSpace(5)

        IndicatorComponent(this.indicatorController2)
          .initialIndex(0)
          .id('indicator_thin_colorInvert')
          .style(
            new DotIndicator()
              .itemWidth(15)
              .itemHeight(15)
              .selectedItemWidth(15)
              .selectedItemHeight(15)
              .color(Color.Gray)
              .selectedColor(Color.Blue)
          )
          .loop(true)
          .count(6)
          .vertical(false)
          .systemMaterial(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THIN,
            materialColor: '#80FF0000',
            colorInvert: false,
            applyShadow: false,
            interactive: false,
            lightEffect: { color: Color.White }
          }))
      }
      .width('100%')
      .height('20%')

      Text('systemMaterial REGULAR').fontSize(10)
      Column() {
        Swiper(this.swiperController3) {
          ForEach(this.list, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => item.toString())
        }
        .cachedCount(2)
        .index(0)
        .id('swiper_regular_applyShadow')
        .indicator(this.indicatorController3)
        .loop(true)
        .vertical(false)
        .itemSpace(5)

        IndicatorComponent(this.indicatorController3)
          .initialIndex(0)
          .id('indicator_regular_applyShadow')
          .style(
            new DotIndicator()
              .itemWidth(15)
              .itemHeight(15)
              .selectedItemWidth(15)
              .selectedItemHeight(15)
              .color(Color.Gray)
              .selectedColor(Color.Blue)
          )
          .loop(true)
          .count(6)
          .vertical(false)
          .systemMaterial(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.REGULAR,
            materialColor: undefined,
            colorInvert: undefined,
            applyShadow: undefined,
            interactive: undefined,
            lightEffect: undefined
          }))
      }
      .width('100%')
      .height('20%')

      Text('systemMaterial ULTRA_THICK').fontSize(10)
      Column() {
        Swiper(this.swiperController4) {
          ForEach(this.list, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => item.toString())
        }
        .cachedCount(2)
        .index(0)
        .id('swiper_ultra_thick_interactive')
        .indicator(this.indicatorController4)
        .loop(true)
        .vertical(false)
        .itemSpace(5)

        IndicatorComponent(this.indicatorController4)
          .initialIndex(0)
          .id('indicator_ultra_thick_interactive')
          .style(
            new DotIndicator()
              .itemWidth(15)
              .itemHeight(15)
              .selectedItemWidth(15)
              .selectedItemHeight(15)
              .color(Color.Gray)
              .selectedColor(Color.Blue)
          )
          .loop(true)
          .count(6)
          .vertical(false)
          .systemMaterial(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            materialColor: null,
            colorInvert: null,
            applyShadow: null,
            interactive: null,
            lightEffect: null
          }))
      }
      .width('100%')
      .height('20%')

      Text('systemMaterial null').fontSize(10)
      Column() {
        Swiper(this.swiperController5) {
          ForEach(this.list, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => item.toString())
        }
        .cachedCount(2)
        .index(0)
        .id('swiper_null')
        .indicator(this.indicatorController5)
        .loop(true)
        .vertical(false)
        .itemSpace(5)

        IndicatorComponent(this.indicatorController5)
          .initialIndex(0)
          .id('indicator_null')
          .style(
            new DotIndicator()
              .itemWidth(15)
              .itemHeight(15)
              .selectedItemWidth(15)
              .selectedItemHeight(15)
              .color(Color.Gray)
              .selectedColor(Color.Blue)
          )
          .loop(true)
          .count(6)
          .vertical(false)
          .systemMaterial(null)
      }
      .width('100%')
      .height('20%')

      Text('systemMaterial undefined').fontSize(10)
      Column() {
        Swiper(this.swiperController6) {
          ForEach(this.list, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => item.toString())
        }
        .cachedCount(2)
        .index(0)
        .id('swiper_undefined')
        .indicator(this.indicatorController6)
        .loop(true)
        .vertical(false)
        .itemSpace(5)

        IndicatorComponent(this.indicatorController6)
          .initialIndex(0)
          .id('indicator_undefined')
          .style(
            new DotIndicator()
              .itemWidth(15)
              .itemHeight(15)
              .selectedItemWidth(15)
              .selectedItemHeight(15)
              .color(Color.Gray)
              .selectedColor(Color.Blue)
          )
          .loop(true)
          .count(6)
          .vertical(false)
          .systemMaterial(undefined)
      }
      .width('100%')
      .height('20%')

      Text('systemMaterial default (not set)').fontSize(10)
      Column() {
        Swiper(this.swiperController7) {
          ForEach(this.list, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => item.toString())
        }
        .cachedCount(2)
        .index(0)
        .id('swiper_default')
        .indicator(this.indicatorController7)
        .loop(true)
        .vertical(false)
        .itemSpace(5)

        IndicatorComponent(this.indicatorController7)
          .initialIndex(0)
          .id('indicator_default')
          .style(
            new DotIndicator()
              .itemWidth(15)
              .itemHeight(15)
              .selectedItemWidth(15)
              .selectedItemHeight(15)
              .color(Color.Gray)
              .selectedColor(Color.Blue)
          )
          .loop(true)
          .count(6)
          .vertical(false)
      }
      .width('100%')
      .height('20%')
    }
    .width('100%')
    .height('100%')
  }
}