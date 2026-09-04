'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry, Component, Stack, StackOptions, Scroll, Scroller, Flex, FlexOptions, FlexDirection,
  Row, Text, TextAlign, ForEach, BarState, Alignment, Margin } from '@ohos.arkui.component';
import { ArcScrollBar, ArcScrollBarOptions } from '@ohos.arkui.ArcScrollBar';

@Entry
@Component
struct ArcScrollBarExample {
  private scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  build() {
    Stack({ alignContent: Alignment.Center } as StackOptions) {
      Scroll(this.scroller) {
        Flex({ direction: FlexDirection.Column } as FlexOptions) {
          ForEach(this.arr, (item: number) => {
            Row() {
              Text('N' + item.toString())
                .width('80%')
                .height(60)
                .backgroundColor('#3366CC')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 2 } as Margin)
            }
            // ForEach的key生成函数需显式指定返回类型string。
          }, (item: number): string => item.toString())
        }.margin({ right: 15 } as Margin)
      }
      .width('90%')
      .scrollBar(BarState.Off)

      ArcScrollBar({ scroller: this.scroller, state: BarState.Auto } as ArcScrollBarOptions)
    }
    .width('100%')
    .height('100%')
  }
}
