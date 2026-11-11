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
  Entry,
  Component,
  Column,
  Row,
  RowOptions,
  Text,
  Button,
  Scroll,
  Scroller,
  ScrollDirection,
  ForEach,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

/**
 * Scroll组件enableScrollWithKeyboard从API 26.2.0开始新增，设置是否支持键盘方向键滚动：
 * 组件获焦且未激活焦点态时会响应键盘方向键滚动。
 * 属性值设置为undefined表示使用默认值，默认值：false。
 * 本页面为纵向Scroll响应键盘方向键(上/下)滚动的验证页面，
 * 通过按钮切换覆盖true、false、undefined全部参数类型。
 */
@Entry
@Component
struct ScrollKeyboard {
  private readonly ten: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  // enableScrollWithKeyboard属性值：undefined表示使用默认值
  @State keyboardScroll: boolean | undefined = false;
  @State vOff: string = '0';
  private vScroller: Scroller = new Scroller();

  build() {
    Column() {
      Text(`enableScrollWithKeyboard: ${this.keyboardScroll}`)
        .id('V_SCROLL_KB_STATE')
        .fontSize(12)
        .fontColor('#666666')
        .height('4%')

      Row() {
        Button('true')
          .id('V_SCROLL_KB_TRUE')
          .fontSize(14)
          .onClick(() => {
            this.keyboardScroll = true;
          })

        Button('false')
          .id('V_SCROLL_KB_FALSE')
          .fontSize(14)
          .onClick(() => {
            this.keyboardScroll = false;
          })
      }
      .height('5%')

      Row() {
        Button('undefined')
          .id('V_SCROLL_KB_UNDEF')
          .fontSize(14)
          .onClick(() => {
            this.keyboardScroll = undefined;
          })

        Button('reset')
          .id('V_SCROLL_KB_RESET')
          .fontSize(14)
          .onClick(() => {
            this.vScroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }
      .height('5%')

      Text(`offset=${this.vOff}`)
        .id('V_SCROLL_KB_OFFSET')
        .fontSize(10)
        .height('4%')

      Scroll(this.vScroller) {
        Column() {
          ForEach(this.ten, (item: int) => {
            Text(`${item}`)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
              .fontSize(12)
              .backgroundColor(item % 2 === 0 ? '#E8F3FF' : '#D6E4FF')
              .borderRadius(6)
              .focusable(true)
          }, (item: int) => `vkb_${item}`)
        }
        .width('100%')
      }
      .id('V_SCROLL_KB')
      .scrollable(ScrollDirection.Vertical)
      .enableScrollWithKeyboard(this.keyboardScroll)
      .focusOnTouch(true)
      .backgroundColor('#E3E8F0')
      .borderRadius(6)
      .width('100%')
      .height('60%')
      .onDidScroll(() => {
        let yOffset: number = this.vScroller.currentOffset()?.yOffset!
        this.vOff = '' + Math.round(yOffset)
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}
