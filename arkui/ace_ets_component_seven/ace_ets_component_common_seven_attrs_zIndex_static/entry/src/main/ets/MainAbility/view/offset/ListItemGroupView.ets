'use static';
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
  Position,Builder,Margin,Padding,ItemState,StickyStyle,List
} from '@ohos.arkui.component'
import { State, Link,  } from '@ohos.arkui.stateManagement'

@Component
export struct ListItemGroupView {
  @Link _offset: Position;
  private componentKey: string = '';
  private parentWidth: number;
  private parentHeight: number;
  private subassemblyWidth: number;
  private subassemblyHeight: number;
  private parentComponentKey: string = '';
  private referenceComponentKey: string = '';
  private projects: string[] = ['Chinese', 'mathematics', 'English']

  @Builder itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(10)
  }

  @Builder itemFoot(num: number) {
    Text('have ' + num + 'classes')
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(5)
  }

  @Builder content(project: string) {
    Text(project)
      .width('100%')
      .height(100)
      .fontSize(20)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xFFFFFF)
  }

  build() {
    List({ space: 20 }) {

    }
    .width(this.parentWidth)
    .height(this.parentHeight)
    .key(this.parentComponentKey)
    .sticky((StickyStyle.Header | StickyStyle.Footer) as StickyStyle)
  }
}