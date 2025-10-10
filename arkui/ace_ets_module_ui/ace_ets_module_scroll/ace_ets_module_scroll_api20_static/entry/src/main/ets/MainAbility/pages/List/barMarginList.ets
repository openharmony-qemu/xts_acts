/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { LengthMetrics } from '@ohos.arkui.node';
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
  List,
  ListItem,
  EdgeEffect,
  Direction
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct scrollBarMarginList {
  listScroller: Scroller = new Scroller();
  @State arr: string[] = [] as string[];

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    Column() {
      List({ scroller: this.listScroller }) {
        ForEach(this.arr, (item1: string, index: int) => {
          ListItem() {
            Text('item' + item1)
              .fontSize(16)
              .width('80%')
              .height('20%')
              .borderRadius(10)
              .backgroundColor(Color.Pink)
          }
        }, (item1: string) => `arr_${item1}`)
      }
      .id('list_bar_margin')
      .scrollBarColor(Color.Blue)
      .scrollBarWidth(20)
      .width('90%')
      .height('50%')
      
      
      
      
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.Spring)
      .direction(Direction.Ltr)
      .border({
        color: Color.Red,
        width: 4
      })
    }.backgroundColor(0xDCDCDC)

  }
}