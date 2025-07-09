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
// xxx.ets
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  UserView,
  Image,
  ImageFit,
  Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  HorizontalAlign,
  FlexAlign,
  GridLayoutOptions,
  ColumnOptions,
  Grid,
  GridItem,
  Margin,
  TextAlign
} from '@ohos.arkui.component'
import {
  State,
  MutableState,
  stateOf,
  observableProxy,
  AppStorage
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct onGetIrregular {
  @State Number: String[] = ['0', '1', '2'];
  scroller: Scroller = new Scroller();
  layoutOptions2: GridLayoutOptions = {
    regularSize: [1, 1],
    irregularIndexes: [0, 7], // 索引为0和7的GridItem占用的列数由onGetIrregularSizeByIndex指定
    onGetIrregularSizeByIndex: (index: number) => {
      return [-1, 1] as [number, number];
    }
  } as GridLayoutOptions;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      // 不使用scroll，需要undefined占位
      Grid(undefined, this.layoutOptions2) {
        // ForEach(this.Number, (day: string) => {
        ForEach(this.Number, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
              .key('onGetRegular' + day)
          }
        }, (day: string) => day)
        // }, (day: string) => day)
      }
      .columnsTemplate('1fr')
      .columnsGap(10)
      .rowsGap(10)
      .scrollBar(BarState.Off)
      .width('60%')
      .backgroundColor(0xFAEEE0)
      .height(270)
      .key('GridGetIrregular')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}