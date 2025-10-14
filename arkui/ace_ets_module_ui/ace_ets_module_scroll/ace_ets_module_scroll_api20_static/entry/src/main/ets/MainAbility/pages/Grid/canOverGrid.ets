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
  Grid,
  ScrollState,
  EdgeEffect,
  EffectEdge,
  BarState
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct canOverScrollGrid {
  scroller: Scroller = new Scroller;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] as number[]

  build() {
    Column() {
      Text('Grid canOverScroll测试')
      Row() {
        Button('COS:true')
          .id('canOver_grid_true')
          .onClick((e: ClickEvent) => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset()!.yOffset;
            const xOffset: number = this.scroller.currentOffset()!.xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: { duration: 1000, curve: curve, canOverScroll: true },
              
              
            })
          })
        Button('COS:false')
          .id('canOver_grid_false')
          .onClick((e: ClickEvent) => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset()!.yOffset;
            const xOffset: number = this.scroller.currentOffset()!.xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: { duration: 1000, curve: curve, canOverScroll: true },
              
            })
          })
      }

      Row() {
        Button('null')
          .id('canOver_grid_null')
          .onClick((e: ClickEvent) => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset()!.yOffset;
            const xOffset: number = this.scroller.currentOffset()!.xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: { duration: 1000, curve: curve, canOverScroll: true },
              
            })
          })
        Button('undefined')
          .id('canOver_grid_ude')
          .onClick((e: ClickEvent) => {
            let curve = curves.interpolatingSpring(0.5, 5, 10, 15)
            const yOffset: number = this.scroller.currentOffset()!.yOffset;
            const xOffset: number = this.scroller.currentOffset()!.xOffset;
            this.scroller.scrollTo({
              xOffset: xOffset - 30,
              yOffset: yOffset - 30,
              animation: true,
              
            })
          })
      }

      Grid(this.scroller) {
        ForEach(this.arr, (item: number, i: int) => {
          GridItem() {
            Text(item.toString())
              .id('canOverScroll_grid_' + item)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('23%')
              .textAlign(TextAlign.Center)
          }
        }, (item: number) => item.toString())

      }
      .id('canOverScroll_grid')
      .columnsGap(10)
      .rowsGap(10)
      .friction(0.6)
      .columnsTemplate('1fr')
      .enableScrollInteraction(true)
      .supportAnimation(false)
      .multiSelectable(false)
      .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true, effectEdge: EffectEdge.START }) 
      .fadingEdge(true, { fadingEdgeLength: LengthMetrics.vp(80) }) 
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Grey)
      .scrollBarWidth(4)
      .width('90%')
      .height('50%')
      .backgroundColor(0xFAEEE0)
      .onScrollIndex((first: int, last: int) => {
        console.info(first.toString())
        console.info(last.toString())
      })
      .onScrollBarUpdate((index: int, offset: number) => {
        console.info('XXX' + 'Grid onScrollBarUpdate,index : ' + index.toString() + ',offset' + offset.toString())
        return { totalOffset: (index / 5) * (80 + 10) - offset, totalLength: 80 * 5 + 10 * 4 }
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info('XXXonDidScroll scrollOffset' + scrollOffset.toString())
        console.info('XXXonDidScroll scrollState' + scrollState.toString())
      })
      .onScrollStart(() => {
        console.info('XXXonScrollStart' + 'Grid1 onScrollStart')
      })
      .onReachStart(() => {
        console.info('XXXonScrollStart' + 'Grid1 onReachStart')
      })
      .onReachEnd(() => {
        console.info('XXXonReachEnd' + 'Grid1 onReachEnd')
      })
      .onScrollStop(() => {
        console.info('XXXonScrollStop' + 'Grid1 onScrollStop')
      })
    }
  }
}