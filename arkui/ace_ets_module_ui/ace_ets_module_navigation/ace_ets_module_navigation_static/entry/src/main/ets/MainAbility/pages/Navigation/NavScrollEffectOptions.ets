'use static'
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
import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  TextAlign,
  Row,
  List,
  ListItem,
  ForEach,
  Navigation,
  NavigationTitleMode,
  Builder,
  $r,
  ToolbarItem,
  BarStyle,
  ScrollEffectType
} from '@ohos.arkui.component'
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct NavigationScrollEffectOptions {
  private arr: int[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('Navigation scrollEffectOptions')

      // scrollEffectOptions （不设置）
      Text('scrollEffectOptions default').fontSize(10)
      Navigation() {
        Column() {
          List({ initialIndex: 0 }) {
            ForEach(this.arr, (item: int) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height('50%')
                  .backgroundColor($r('sys.color.brand'))
                  .borderRadius(12)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }
            }, (item: int) => item.toString())
          }
          .height('100%')
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
      .id('navigation_scrollEffectOptions_default')
      .title('Title', { barStyle: BarStyle.STACK })
      .titleMode(NavigationTitleMode.Mini)
      .height('25%')

      Text('scrollEffectType = COMMON_BLUR / GRADUAL_BLUR').fontSize(10)
      Row(){
        Navigation() {
          Column() {
            List({ initialIndex: 0 }) {
              ForEach(this.arr, (item: int) => {
                ListItem() {
                  Text('' + item)
                    .width('90%')
                    .height('50%')
                    .backgroundColor($r('sys.color.brand'))
                    .borderRadius(12)
                    .fontSize(14)
                    .textAlign(TextAlign.Center)
                }
              }, (item: int) => item.toString())
            }
            .height('100%')
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
        .titleMode(NavigationTitleMode.Mini)
        .width('50%')

        Navigation() {
          Column() {
            List({ space: 2, initialIndex: 0 }) {
              ForEach(this.arr, (item: int) => {
                ListItem() {
                  Text('' + item)
                    .width('90%')
                    .height('50%')
                    .backgroundColor($r('sys.color.brand'))
                    .borderRadius(12)
                    .fontSize(14)
                    .textAlign(TextAlign.Center)
                }
              }, (item: int) => item.toString())
            }
            .height('100%')
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
        .titleMode(NavigationTitleMode.Mini)
        .width('50%')
      }
      .height('25%')

      Text('scrollEffectOptions / scrollEffectType = undefined').fontSize(10)
      Row(){
        Navigation() {
          Column() {
            List({ space: 2, initialIndex: 0 }) {
              ForEach(this.arr, (item: int) => {
                ListItem() {
                  Text('' + item)
                    .width('90%')
                    .height('50%')
                    .backgroundColor($r('sys.color.brand'))
                    .borderRadius(12)
                    .fontSize(14)
                    .textAlign(TextAlign.Center)
                }
              }, (item: int) => item.toString())
            }
            .height('100%')
            .width('100%')
          }
          .width('100%')
          .height('100%')
        }
        .id('navigation_scrollEffectOptions_scrollEffectType_undefined')
        .title('Type undefined', {
          barStyle: BarStyle.STACK,
          scrollEffectOptions: {
            scrollEffectType: undefined,
            blurEffectiveStartOffset: LengthMetrics.vp(8),
            blurEffectiveEndOffset: LengthMetrics.vp(56)
          }
        })
        .titleMode(NavigationTitleMode.Mini)
        .width('50%')

        Navigation() {
          Column() {
            List({ space: 2, initialIndex: 0 }) {
              ForEach(this.arr, (item: int) => {
                ListItem() {
                  Text('' + item)
                    .width('90%')
                    .height('50%')
                    .backgroundColor($r('sys.color.brand'))
                    .borderRadius(12)
                    .fontSize(14)
                    .textAlign(TextAlign.Center)
                }
              }, (item: int) => item.toString())
            }
            .height('100%')
            .width('100%')
          }
          .width('100%')
          .height('100%')
        }
        .id('navigation_scrollEffectOptions_undefined')
        .title('undefined', {
          barStyle: BarStyle.STACK,
          scrollEffectOptions: undefined
        })
        .titleMode(NavigationTitleMode.Mini)
        .width('50%')
      }
      .height('25%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#C0C0C0')
  }
}
