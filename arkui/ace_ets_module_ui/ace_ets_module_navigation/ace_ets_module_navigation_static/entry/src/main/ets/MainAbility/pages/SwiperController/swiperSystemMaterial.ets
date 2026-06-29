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

import uiMaterial from '@ohos.arkui.uiMaterial'
import {
  Entry, Text, Column, Component, Swiper, Scroll, Color, DotIndicator, ForEach, 
  IndicatorComponent, IndicatorComponentController, SwiperController
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SwiperSystemMaterialPage {
  private indicatorController1: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController2: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController3: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController4: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController5: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController6: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController7: IndicatorComponentController = new IndicatorComponentController();
  private indicatorController8: IndicatorComponentController = new IndicatorComponentController();
  private swiperController1: SwiperController = new SwiperController();
  private swiperController2: SwiperController = new SwiperController();
  private swiperController3: SwiperController = new SwiperController();
  private swiperController4: SwiperController = new SwiperController();
  private swiperController5: SwiperController = new SwiperController();
  private swiperController6: SwiperController = new SwiperController();
  private swiperController7: SwiperController = new SwiperController();
  private swiperController8: SwiperController = new SwiperController();
  @State list: number[] = [];

  aboutToAppear(): void {
    for (let i = 1; i <= 3; i++) {
      this.list.push(i);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('Swiper IndicatorComponent systemMaterial test')
        Text('systemMaterial ULTRA_THIN')
          .fontSize(10)
        Column() {
          Swiper(this.swiperController1) {
            ForEach(this.list, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            })
          }
          .cachedCount(2)
          .index(0)
          .indicator(this.indicatorController1)
          .loop(true)
          .vertical(false)
          .itemSpace(5)

          IndicatorComponent(this.indicatorController1)
            .initialIndex(0)
            .id('swiper_systemMaterial_ultra_thin')
            .style(
              DotIndicator()
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(15)
                .selectedItemHeight(15)
                .color(Color.Gray)
                .selectedColor(Color.Blue)
            )
            .loop(true)
            .count(3)
            .vertical(false)
            .systemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
              materialColor: Color.Transparent,
              colorInvert: true,
              applyShadow: true,
              interactive: true,
              lightEffect: { color: Color.White }
            } as uiMaterial.ImmersiveOptions))
        }

        Text('systemMaterial THIN')
          .fontSize(10)
        Column() {
          Swiper(this.swiperController2) {
            ForEach(this.list, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            })
          }
          .cachedCount(2)
          .index(0)
          .indicator(this.indicatorController2)
          .loop(true)
          .vertical(false)
          .itemSpace(5)

          IndicatorComponent(this.indicatorController2)
            .initialIndex(0)
            .id('swiper_systemMaterial_thin')
            .style(
              DotIndicator()
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(15)
                .selectedItemHeight(15)
                .color(Color.Gray)
                .selectedColor(Color.Blue)
            )
            .loop(true)
            .count(3)
            .vertical(false)
            .systemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THIN,
              materialColor: '#80FF0000',
              colorInvert: false,
              applyShadow: false,
              interactive: false,
              lightEffect: { color: Color.White }
            } as uiMaterial.ImmersiveOptions))
        }

        Text('systemMaterial REGULAR')
          .fontSize(10)
        Column() {
          Swiper(this.swiperController3) {
            ForEach(this.list, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            })
          }
          .cachedCount(2)
          .index(0)
          .indicator(this.indicatorController3)
          .loop(true)
          .vertical(false)
          .itemSpace(5)

          IndicatorComponent(this.indicatorController3)
            .initialIndex(0)
            .id('swiper_systemMaterial_regular')
            .style(
              DotIndicator()
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(15)
                .selectedItemHeight(15)
                .color(Color.Gray)
                .selectedColor(Color.Blue)
            )
            .loop(true)
            .count(3)
            .vertical(false)
            .systemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.REGULAR,
              materialColor: undefined,
              colorInvert: undefined,
              applyShadow: undefined,
              interactive: undefined,
              lightEffect: undefined
            } as uiMaterial.ImmersiveOptions))
        }

        Text('systemMaterial THICK')
          .fontSize(10)
        Column() {
          Swiper(this.swiperController4) {
            ForEach(this.list, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            })
          }
          .cachedCount(2)
          .index(0)
          .indicator(this.indicatorController4)
          .loop(true)
          .vertical(false)
          .itemSpace(5)

          IndicatorComponent(this.indicatorController4)
            .initialIndex(0)
            .id('swiper_systemMaterial_thick')
            .style(
              DotIndicator()
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(15)
                .selectedItemHeight(15)
                .color(Color.Gray)
                .selectedColor(Color.Blue)
            )
            .loop(true)
            .count(3)
            .vertical(false)
            .systemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THICK,
              materialColor: Color.Blue,
              colorInvert: true,
              applyShadow: true,
              interactive: true,
              lightEffect: { color: Color.White }
            } as uiMaterial.ImmersiveOptions))
        }

        Text('systemMaterial ULTRA_THICK')
          .fontSize(10)
        Column() {
          Swiper(this.swiperController5) {
            ForEach(this.list, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            })
          }
          .cachedCount(2)
          .index(0)
          .indicator(this.indicatorController5)
          .loop(true)
          .vertical(false)
          .itemSpace(5)

          IndicatorComponent(this.indicatorController5)
            .initialIndex(0)
            .id('swiper_systemMaterial_ultra_thick')
            .style(
              DotIndicator()
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(15)
                .selectedItemHeight(15)
                .color(Color.Gray)
                .selectedColor(Color.Blue)
            )
            .loop(true)
            .count(3)
            .vertical(false)
            .systemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
              materialColor: null,
              colorInvert: null,
              applyShadow: null,
              interactive: null,
              lightEffect: null
            } as uiMaterial.ImmersiveOptions))
        }

        Text('systemMaterial with undefined')
          .fontSize(10)
        Column() {
          Swiper(this.swiperController6) {
            ForEach(this.list, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            })
          }
          .cachedCount(2)
          .index(0)
          .indicator(this.indicatorController6)
          .loop(true)
          .vertical(false)
          .itemSpace(5)

          IndicatorComponent(this.indicatorController6)
            .initialIndex(0)
            .id('swiper_systemMaterial_undefined')
            .style(
              DotIndicator()
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(15)
                .selectedItemHeight(15)
                .color(Color.Gray)
                .selectedColor(Color.Blue)
            )
            .loop(true)
            .count(3)
            .vertical(false)
            .systemMaterial(undefined)
        }

        Text('systemMaterial with null')
          .fontSize(10)
        Column() {
          Swiper(this.swiperController7) {
            ForEach(this.list, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            })
          }
          .cachedCount(2)
          .index(0)
          .indicator(this.indicatorController7)
          .loop(true)
          .vertical(false)
          .itemSpace(5)

          IndicatorComponent(this.indicatorController7)
            .initialIndex(0)
            .id('swiper_systemMaterial_null')
            .style(
              DotIndicator()
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(15)
                .selectedItemHeight(15)
                .color(Color.Gray)
                .selectedColor(Color.Blue)
            )
            .loop(true)
            .count(3)
            .vertical(false)
            .systemMaterial(null)
        }

        Text('IndicatorComponent without systemMaterial')
          .fontSize(10)
        Column() {
          Swiper(this.swiperController8) {
            ForEach(this.list, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            })
          }
          .cachedCount(2)
          .index(0)
          .indicator(this.indicatorController8)
          .loop(true)
          .vertical(false)
          .itemSpace(5)

          IndicatorComponent(this.indicatorController8)
            .initialIndex(0)
            .id('swiper_indicator_default')
            .style(
              DotIndicator()
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(15)
                .selectedItemHeight(15)
                .color(Color.Gray)
                .selectedColor(Color.Blue)
            )
            .loop(true)
            .count(3)
            .vertical(false)
        }
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}