/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct SwiperIgnoreHiddenItemAbnormal {
  private swiperController: SwiperController = new SwiperController()
  private swiperController1: SwiperController = new SwiperController()
  private swiperController2: SwiperController = new SwiperController()
  private swiperController3: SwiperController = new SwiperController()
  @State item1Visible: Visibility = Visibility.None
  @State item2Visible: Visibility = Visibility.Visible
  @State item3Visible: Visibility = Visibility.None
  @State item4Visible: Visibility = Visibility.Visible
  @State item5Visible: Visibility = Visibility.None
  @State item6Visible: Visibility = Visibility.Visible
  @State item7Visible: Visibility = Visibility.None
  @State item8Visible: Visibility = Visibility.Visible

  build() {
    Column() {
      Swiper(this.swiperController) {
        Text('0-None')
          .width('100%')
          .height('100%')
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(14)
          .visibility(this.item1Visible)
        Text('1')
          .width('100%')
          .height('100%')
          .backgroundColor(0xFFD700)
          .textAlign(TextAlign.Center)
          .fontSize(14)
          .visibility(this.item2Visible)
      }
      .id('swiper_ignoreHiddenItem_true')
      .width('100%')
      .height('20%')
      .loop(false)
      .indicator(false)
      .ignoreHiddenItem(true)
      .borderWidth(1)

      Swiper(this.swiperController1) {
        Text('0-None')
          .width('100%')
          .height('100%')
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(14)
          .visibility(this.item3Visible)
        Text('1')
          .width('100%')
          .height('100%')
          .backgroundColor(0xFFD700)
          .textAlign(TextAlign.Center)
          .fontSize(14)
          .visibility(this.item4Visible)
      }
      .id('swiper_ignoreHiddenItem_false')
      .width('100%')
      .height('20%')
      .loop(false)
      .indicator(false)
      .ignoreHiddenItem(false)
      .borderWidth(1)

      Swiper(this.swiperController2) {
        Text('0-None')
          .width('100%')
          .height('100%')
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(14)
          .visibility(this.item5Visible)
        Text('1')
          .width('100%')
          .height('100%')
          .backgroundColor(0xFFD700)
          .textAlign(TextAlign.Center)
          .fontSize(14)
          .visibility(this.item6Visible)
      }
      .id('swiper_ignoreHiddenItem_undefined')
      .width('100%')
      .height('20%')
      .loop(false)
      .indicator(false)
      .ignoreHiddenItem(undefined)
      .borderWidth(1)

      Swiper(this.swiperController3) {
        Text('0-None')
          .width('100%')
          .height('100%')
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(14)
          .visibility(this.item7Visible)
        Text('1')
          .width('100%')
          .height('100%')
          .backgroundColor(0xFFD700)
          .textAlign(TextAlign.Center)
          .fontSize(14)
          .visibility(this.item8Visible)
      }
      .id('swiper_ignoreHiddenItem_null')
      .width('100%')
      .height('20%')
      .loop(false)
      .indicator(false)
      .ignoreHiddenItem(null)
      .borderWidth(1)
    }
    .width('100%')
    .padding(10)
  }
}
