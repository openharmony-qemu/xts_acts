/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  VisibleListContentInfo,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  ForEach,
  Axis,
  BarState,
  EdgeEffect,
  ListItemGroup
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct singleListHorizontalDiffHeight {
  scroller: ListScroller = new ListScroller()
  @State arr: number[] = [1, 2] as number[]
  @State arr2: number[] = [1, 2, 3, 4, 5] as number[]
  @State mheight: string[] = ['45%', '80%']
  @State mheightIndex: number = 0

  build() {
    Column() {
      Button('scrollToItemInGroup(1, 2)')
        .id('scroller_group_hoz_diff')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollToItemInGroup(1, 2)
        })
      List({ scroller: this.scroller }) {
        ForEach(this.arr, (item0: number, groupIndex: int) => {
          
          
          
          
          
          
          
          
          
          
          
          
          
        })
      }
      .id('group_hoz_diff_list')
      .width('90%')
      .height('40%')
      .listDirection(Axis.Horizontal) 
      .scrollBar(BarState.Off)
      .friction(0.6)
      .backgroundColor(0xDCDCDC)
      .edgeEffect(EdgeEffect.Spring) 
      .onScrollIndex((firstIndex: int, lastIndex: int, centerIndex: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
        console.info('center' + centerIndex)
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo): void => {
        console.log(' start index: ' + start.index +
          ' start item group area: ' + start.itemGroupArea +
          ' start index in group: ' + start.itemIndexInGroup)
        console.log(' end index: ' + end.index +
          ' end item group area: ' + end.itemGroupArea +
          ' end index in group: ' + end.itemIndexInGroup)
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState): void => {
        console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset)
      })
    }
    .width('100%')
    .borderWidth(2)
    .borderColor(Color.Blue)
    .backgroundColor(0xDCDCDC)
    .margin({ top: 5 } as Margin)
  }
}