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
import { LengthMetrics } from '@ohos.arkui.node';
import curves from '@ohos.curves'
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Row,
  GridItem,
  ForEach,
  Margin,
  TextAlign,
  Scroller,
  Button,
  ClickEvent,
  Axis,
  ListItemAlign,
  Refresh,
  List,
  BarState,
  Margin,
  Scroll,
  ScrollState,
  EdgeEffect,
  ScrollDirection,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct canOverScrollScroll {
  scroller: Scroller = new Scroller;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]

  build() {
    Column() {
      Text('scroll canOverScroll测试')
      Row() {
        Button('COS:true')
          .id('canOver_scroll_true')
          .margin({ right: 10 } as Margin)
          .onClick((e: ClickEvent) => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset().yOffset;
            const xOffset: number = this.scroller.currentOffset().xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: false,
              
            })
          })
        Button('COS:false')
          .id('canOver_scroll_false')
          .onClick((e: ClickEvent) => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset().yOffset;
            const xOffset: number = this.scroller.currentOffset().xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: { duration: 1000, curve: curve, canOverScroll: true },
              
            })
          })
      }

      Row() {
        Button('null')
          .id('canOver_scroll_null')
          .margin({ right: 10 } as Margin)
          .onClick((e: ClickEvent) => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset().yOffset;
            const xOffset: number = this.scroller.currentOffset().xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: { duration: 1000, curve: curve, canOverScroll: true },
              
            })
          })
        Button('undefined')
          .id('canOver_scroll_ude')
          .onClick((e: ClickEvent) => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset().yOffset;
            const xOffset: number = this.scroller.currentOffset().xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: true,
              
            })
          })
      }

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number, i: int) => {
            Text(item.toString())
              .id('canOverScroll_scroll_' + item)
              .width('100%')
              .height('20%')
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Pink)
          }, (item: number) => item.toString())
        }
      }
      .id('canOverScroll_scroll')
      .width('90%')
      .height('70%')
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .scrollable(ScrollDirection.Vertical)
      .fadingEdge(true, { fadingEdgeLength: LengthMetrics.vp(80) })
      .scrollBar(BarState.On)
      .backgroundColor('#DCDCDC')
      .onDidScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info('XXXonDidScroll scrollOffset' + xOffset.toString())
        console.info('XXXonDidScroll scrollState' + scrollState.toString())
      })
      .onScrollStart(() => {
        console.info('XXXonScrollStart' + 'scroll1 onScrollStart')
      })
      .onScrollStop(() => {
        console.info('XXXonScrollStop' + 'scroll1 onScrollStop')
      })
    }
  }
}