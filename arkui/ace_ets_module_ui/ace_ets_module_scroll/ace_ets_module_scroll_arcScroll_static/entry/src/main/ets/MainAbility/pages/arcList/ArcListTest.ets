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
  Entry, Component, Builder, Stack, Column, Text, ForEach, Button, ButtonOptions,
  LengthMetrics, FontWeight, Color, ButtonType, FlexAlign, Alignment, HorizontalAlign,
  BorderOptions } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ArcList, ArcListItem, ArkListOptions } from '@ohos.arkui.ArcList';
import { ComponentContent, UIContext, wrapBuilder } from '@kit.ArkUI';
import { CircleShape } from '@ohos.arkui.shape';

@Builder
function buildText(): void {
  Column() {
    Text('header')
      .fontSize('60px')
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.Black)
  }.margin(0)
}

@Entry
@Component
struct ArcListTest {
  @State private numItems: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  private watchSize: string = '466px'; // Wearable默认宽高：466*466
  private listSize: string = '414px'; // item宽度

  context: UIContext = this.getUIContext();
  tabBar1: ComponentContent<Object> = new ComponentContent<Object>(this.context, wrapBuilder(buildText));

  @Builder
  buildList2() {
    Stack() {
      Column() {
      }
      .justifyContent(FlexAlign.Center)
      .width(this.watchSize)
      .height(this.watchSize)
      .clipShape(new CircleShape({ width: '100%', height: '100%' }))
      .backgroundColor(Color.White)

      ArcList({ initialIndex: 0, header: this.tabBar1 } as ArkListOptions) {
        ForEach(this.numItems, (item: int, index: int) => {
          ArcListItem() {
            Button('N' + item, { type: ButtonType.Capsule } as ButtonOptions)
              .width(this.listSize)
              .height('100px')
              .fontSize('40px')
              .focusable(true)
              .focusOnTouch(true)
              .backgroundColor(0x17A98D)
          }.align(Alignment.Center)
          // ForEach的key生成函数需显式指定返回类型string。
        }, (item: int, index: int): string => (item + index).toString())
      }
      .space(LengthMetrics.px(10))
      .borderRadius(this.watchSize)
      .focusable(true)
      .focusOnTouch(true)
      .defaultFocus(true)
      .onScrollIndex((start: int, end: int, center: int) => {
        console.info('start:' + start + ', end:' + end + ', center:' + center)
      })
      .onReachStart(() => {
        console.info('onReachStart succ')
      })
      .onReachEnd(() => {
        console.info('onReachEnd succ')
      })
      .onScrollStart(() => {
        console.info('onScrollStart succ')
      })
      .onScrollStop(() => {
        console.info('onScrollStop  succ')
      })
      .onWillScroll(() => {
        console.info('onWillScroll succ')
      })
      .onDidScroll(()=>{
        console.info('onDidScroll succ')
      })
    }
    .align(Alignment.Center)
    .width(this.watchSize)
    .height(this.watchSize)
    .border({color: Color.Black, width: 1} as BorderOptions)
    .borderRadius(this.watchSize)
  }

  build() {
    Column() {
      this.buildList2()
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
