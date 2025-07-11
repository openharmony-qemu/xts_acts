/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroll,
  GestureEvent,
  LongPressGesture,
  TapGesture,
  ClickEvent,
  FlexAlign,
  GestureInfo,
  BaseGestureEvent,
  DragEvent,
  GestureControl,
  GestureJudgeResult,
  Scroller,
  GestureRecognizer,
  Visibility,
  Flex,
  ScrollDirection,
  BarState,
  EdgeEffect,
  Edge,
  PanRecognizer,
  ScrollableTargetInfo,
  PanGestureEvent,
  Stack,
  FlexDirection,
  ItemAlign,
  TextAlign,
  ForEach,
  Alignment,
  GestureJudgeResult,
  GestureRecognizerState
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct FatherControlChildStateTest1 {
  scroller: Scroller = new Scroller()
  scroller2: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  private childRecognizer: GestureRecognizer = new GestureRecognizer()
  private currentRecognizer: GestureRecognizer = new GestureRecognizer()
  private lastOffset: number = 0

  @State text: string = 'GestureRecognizerState'



  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scroller) { // 外部滚动容器
        Column() {
          Text(this.text).id('GestureRecognizerState_text')
          Text("Scroll Area")
            .width('90%')
            .height(150)
            .backgroundColor(0xFFFFFF)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 } as Margin)
          Scroll(this.scroller2) { // 内部滚动容器
            Column() {
              Text("Scroll Area2")
                .width('90%')
                .height(150)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
              Column() {
                ForEach(this.arr, (item: number) => {
                  Text(item.toString())
                    .width('90%')
                    .height(150)
                    .backgroundColor(0xFFFFFF)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .margin({ top: 10 } as Margin)
                }, (item: number, index:number):string => String(item))
              }.width('100%')
            }
          }
          .id("inner")
          .width('100%')
          .height(800)
        }.width('100%')
      }
      .id("outer")
      .height(600)
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .edgeEffect(EdgeEffect.None)
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer, others: Array<GestureRecognizer>):GestureJudgeResult => {
        if (current) {
          if (current.getState() == GestureRecognizerState.READY) {
            this.text = 'GestureRecognizerState.READY'
          } else if (current.getState() == GestureRecognizerState.DETECTING) {
            this.text = 'GestureRecognizerState.DETECTING'
          } else if (current.getState() == GestureRecognizerState.PENDING) {
            this.text = 'GestureRecognizerState.PENDING'
          } else if (current.getState() == GestureRecognizerState.BLOCKED) {
            this.text = 'GestureRecognizerState.BLOCKED'
          } else if (current.getState() == GestureRecognizerState.SUCCESSFUL) {
            this.text = 'GestureRecognizerState.SUCCESSFUL'
          } else if (current.getState() == GestureRecognizerState.FAILED) {
            this.text = 'GestureRecognizerState.FAILED'
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}