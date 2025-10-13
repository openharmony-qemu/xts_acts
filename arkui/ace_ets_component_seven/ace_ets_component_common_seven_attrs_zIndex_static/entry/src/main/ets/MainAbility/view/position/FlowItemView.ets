/*
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
  DataReloadOperation,
  DataOperationType,
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Stack,
  WaterFlow,
  LazyForEach,
  FlowItem,
  DataOperation,
  Color,
  TextAlign,
  DataChangeListener,
  IDataSource,
  Button,
  ButtonAttribute,
  ClickEvent,

  Image,
  Search,
  Row,FlexOptions,
  Column,Flex,FlexDirection,ItemAlign,FlexAlign,FontWeight,
  SearchController,ComponentV2,ForEach,
  ColumnOptions,WaterFlowSections,Scroller,SectionOptions,
  Position,Builder,Margin,Padding,ItemState,StickyStyle,AlphabetIndexer,IndexerAlign
} from '@ohos.arkui.component'
import { State, Link,  } from '@ohos.arkui.stateManagement'

@Component
export struct FlowItemView {
  @Link _position: Position;
  private componentKey: string = '';
  private parentWidth: number;
  private parentHeight: number;
  private parentComponentKey: string = '';
  private referenceComponentKey: string = '';

  build() {
    Column({ space: 2 } as ColumnOptions) {
      WaterFlow() {
        FlowItem() {
          Column() {
            Text('N1').fontSize(12).height('16')
          }
        }
        .width('100%')
        .height('100%')
        .position(this._position)
        .backgroundColor(Color.White)
        .key(this.componentKey)

        FlowItem() {
          Column() {
            Text('N2').fontSize(12).height('16')
          }
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.White)
        .key(this.referenceComponentKey)
      }
      .columnsTemplate('1fr 1fr')
      .backgroundColor(0xFAEEE0)
      .width(this.parentWidth)
      .height(this.parentHeight)
      .key(this.parentComponentKey)
      .layoutDirection(FlexDirection.Column)
    }
  }
}