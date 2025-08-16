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
import { ComponentContent, LengthMetrics } from '@ohos.arkui.node';
import { CircleShape } from '@ohos.arkui.shape';
import { UIContext } from '@ohos.arkui.UIContext';
import {
  Entry,
  Component,
  $r,
  Column,
  Row,
  Text,
  Button,
  Stack,
  Builder,
  FontWeight,
  ChildrenMainSize,
  Scroller,
  Color,
  Margin,
  ClickEvent,
  FlexAlign,
  Alignment,
  HorizontalAlign,
  wrapBuilder,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct swipeActionArcList {
  @State  private numItems: Array<Double> | Array<Int> = [0, 1, 2, 3, 4];
  scroller: Scroller = new Scroller()
  @State listItemOffset: string = 'swipeAction'
  @State listItemState: string = 'swipeAction'

  private watchSize: string = '466px' // 手表默认宽高：466*466
  private listSize: string = '414px'

  @Builder
  itemStart() {
    Row() {
      Button('Del').margin('4vp')
    }.justifyContent(FlexAlign.SpaceEvenly)
  }
  @Builder
  itemEnd() {
    Row() {
      Button('Del').margin('4vp')
    }.justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      Text(this.listItemOffset)
        .id('arcList_listItemOffset')
        .height('5%')
        .margin({top: 5} as Margin)
      Text(this.listItemState)
        .id('arcList_listItemState')
        .height('5%')
      Stack() {
        Column() {
        }
        .justifyContent(FlexAlign.Center)
        .width(this.watchSize)
        .height(this.watchSize)
        .clipShape(new CircleShape({ width: '100%', height: '100%' }))
        .backgroundColor(Color.White)

      }
      .align(Alignment.Center)
      .width(this.watchSize)
      .height(this.watchSize)
      .border({color: Color.Black, width: 1})
      .borderRadius(this.watchSize)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
