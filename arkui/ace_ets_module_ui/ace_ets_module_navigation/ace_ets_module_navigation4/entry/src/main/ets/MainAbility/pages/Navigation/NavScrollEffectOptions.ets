/*
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

import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct NavigationScrollEffectOptions {
  private arr: number[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('Navigation scrollEffectOptions 测试')

      // 1. scrollEffectOptions （不设置）
      Text('1. scrollEffectOptions default').fontSize(10)
      Navigation() {
        Column() {
          List({ space: 2, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height('50%')
                  .backgroundColor($r('sys.color.brand'))
                  .borderRadius(12)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }
            }, (item: number) => item.toString())
          }
          .height("100%")
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
      .id('navigation_scrollEffectOptions_default')
      .title('Title', { barStyle: BarStyle.STACK })
      .titleMode(NavigationTitleMode.Full)
      .height('12%')

      // 2. scrollEffectOptions COMMON_BLUR
      Text('2. scrollEffectType = COMMON_BLUR').fontSize(10)
      Navigation() {
        Column() {
          List({ space: 2, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height('50%')
                  .backgroundColor($r('sys.color.brand'))
                  .borderRadius(12)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }
            }, (item: number) => item.toString())
          }
          .height("100%")
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
      .id('navigation_scrollEffectOptions_common_blur')
      .title('COMMON_BLUR', {
        barStyle: BarStyle.STACK,
        scrollEffectOptions: {
          scrollEffectType: ScrollEffectType.COMMON_BLUR,
          blurEffectiveStartOffset: LengthMetrics.vp(8),
          blurEffectiveEndOffset: LengthMetrics.vp(56)
        }
      })
      .titleMode(NavigationTitleMode.Full)
      .height('12%')

      // 3. scrollEffectOptions GRADUAL_BLUR
      Text('3. scrollEffectType = GRADUAL_BLUR').fontSize(10)
      Navigation() {
        Column() {
          List({ space: 2, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height('50%')
                  .backgroundColor($r('sys.color.brand'))
                  .borderRadius(12)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }
            }, (item: number) => item.toString())
          }
          .height("100%")
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
      .id('navigation_scrollEffectOptions_gradual_blur')
      .title('GRADUAL_BLUR', {
        barStyle: BarStyle.STACK,
        scrollEffectOptions: {
          scrollEffectType: ScrollEffectType.GRADUAL_BLUR,
          blurEffectiveStartOffset: LengthMetrics.vp(8),
          blurEffectiveEndOffset: LengthMetrics.vp(56)
        }
      })
      .titleMode(NavigationTitleMode.Full)
      .height('12%')

      // 4. scrollEffectOptions scrollEffectType 为 null
      Text('4. scrollEffectType = null').fontSize(10)
      Navigation() {
        Column() {
          List({ space: 2, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height('50%')
                  .backgroundColor($r('sys.color.brand'))
                  .borderRadius(12)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }
            }, (item: number) => item.toString())
          }
          .height("100%")
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
      .id('navigation_scrollEffectOptions_scrollEffectType_null')
      .title('scrollEffectType null', {
        barStyle: BarStyle.STACK,
        scrollEffectOptions: {
          scrollEffectType: null,
          blurEffectiveStartOffset: LengthMetrics.vp(8),
          blurEffectiveEndOffset: LengthMetrics.vp(56)
        }
      })
      .titleMode(NavigationTitleMode.Full)
      .height('12%')

      // 5. scrollEffectOptions scrollEffectType 为 undefined
      Text('5. scrollEffectType = undefined').fontSize(10)
      Navigation() {
        Column() {
          List({ space: 2, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height('50%')
                  .backgroundColor($r('sys.color.brand'))
                  .borderRadius(12)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }
            }, (item: number) => item.toString())
          }
          .height("100%")
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
      .id('navigation_scrollEffectOptions_scrollEffectType_undefined')
      .title('scrollEffectType undefined', {
        barStyle: BarStyle.STACK,
        scrollEffectOptions: {
          scrollEffectType: undefined,
          blurEffectiveStartOffset: LengthMetrics.vp(8),
          blurEffectiveEndOffset: LengthMetrics.vp(56)
        }
      })
      .titleMode(NavigationTitleMode.Full)
      .height('12%')

      // 6. scrollEffectOptions null
      Text('6. scrollEffectOptions = null').fontSize(10)
      Navigation() {
        Column() {
          List({ space: 2, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height('50%')
                  .backgroundColor($r('sys.color.brand'))
                  .borderRadius(12)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }
            }, (item: number) => item.toString())
          }
          .height("100%")
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
      .id('navigation_scrollEffectOptions_null')
      .title('scrollEffectOptions null', {
        barStyle: BarStyle.STACK,
        scrollEffectOptions: null
      })
      .titleMode(NavigationTitleMode.Full)
      .height('12%')

      // 7. scrollEffectOptions undefined
      Text('7. scrollEffectOptions = undefined').fontSize(10)
      Navigation() {
        Column() {
          List({ space: 2, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height('50%')
                  .backgroundColor($r('sys.color.brand'))
                  .borderRadius(12)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }
            }, (item: number) => item.toString())
          }
          .height("100%")
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
      .id('navigation_scrollEffectOptions_undefined')
      .title('scrollEffectOptions undefined', {
        barStyle: BarStyle.STACK,
        scrollEffectOptions: undefined
      })
      .titleMode(NavigationTitleMode.Full)
      .height('12%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}