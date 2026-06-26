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
  Scroll,
  ForEach,
  Text,
  Column,
  Component,
  Button,
  TextAlign,
  ClickEvent,
  ScrollBar,
  BarState,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@ohos.arkui.node'

@Entry
@Component
struct scrollBarHeightScroll {
  private arr: double[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  build() {
    Column(){
      Text('scrollBarHeight test').fontSize(14)
      Scroll() {
        Column() {
          ForEach(this.arr, (item: Double, index: int) => {
            Text(item.toString())
              .width('90%')
              .height('30%')
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }, (item: Double, index: int) => item.toString())
        }.width('100%')
      }
      .id('scroll_scrollBarHeight')
      .scrollBarHeight(LengthMetrics.vp(50))
      .scrollBar(BarState.On)
      .scrollBarWidth(30)
      .backToTop(true)
      .height('30%')

      Text('scrollBarHeight undefined').fontSize(14)
      Scroll() {
        Column() {
          ForEach(this.arr, (item: Double, index: int) => {
            Text(item.toString())
              .width('90%')
              .height('30%')
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }, (item: Double, index: int) => item.toString())
        }.width('100%')
      }
      .id('scroll_scrollBarHeight_undefined')
      .scrollBarHeight(undefined)
      .scrollBar(BarState.On)
      .scrollBarWidth(30)
      .backToTop(true)
      .height('30%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}