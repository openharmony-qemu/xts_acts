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
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  ForEach,
  Axis,
  BarState,
  StickyStyle,
  ListItemGroup,
  ListItem,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct footerGroupExample {
  scroller: ListScroller = new ListScroller()
  @State arr2: number[] = [1, 2, 3, 4, 5, 6] as number[]

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '个')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(10)
  }

  build() {
    Column() {
      List({ space: 5, scroller: this.scroller }) {
        ListItemGroup({ footer: () => {this.itemFoot(this.arr2.length)} }) {
          ForEach(this.arr2, (item: number, itemIndex:int) => {
            ListItem() {
              Text('Item:' + item)
                .width('100%')
                .height('20%')
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: number) => item.toString())
        }
      }
      .id('group_sticky_only_footer')
      .width('90%')
      .height('60%')
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.On)
      .sticky(StickyStyle.Footer)

    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .margin({ top: 5 } as Margin)
  }
}