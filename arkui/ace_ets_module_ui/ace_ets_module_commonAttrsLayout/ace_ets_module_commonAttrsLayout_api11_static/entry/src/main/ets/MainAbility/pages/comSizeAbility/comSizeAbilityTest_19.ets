/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  $r,
  Alignment,
  AlphabetIndexer,
  Builder,
  Button,
  Canvas,
  CanvasRenderingContext2D,
  CheckboxGroup,
  Circle,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Counter,
  Divider,
  Ellipse,
  Entry,
  FontWeight,
  ForEach,
  Gauge,
  Grid,
  GridCol,
  GridItem,
  GridRow,
  Image,
  IndexerAlign,
  LineJoinStyle,
  List,
  ListItem,
  ListItemGroup,
  Menu,
  MenuItem,
  MenuItemGroup,
  Path,
  Polygon,
  Polyline,
  PreDragStatus,
  QRCode,
  Radio,
  Rect,
  Refresh,
  RenderingContextSettings,
  ResourceStr,
  RichText,
  Row,
  Scroller,
  Search,
  Stack,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
  OnAlphabetIndexerRequestPopupDataCallback
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

@Entry
@Component
struct comSizeAbilityTest_19 {
  private arrayA: string[] = ['安']
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙']
  private arrayC: string[] = ['曹', '成', '陈', '催']
  private value: string[] = ['#', 'A', 'B', 'C']

  build() {
    Column() {
      Stack({ alignContent: Alignment.Start }) {
        Row() {
          List({}) {
            ForEach(this.arrayA, (item: string) => {
              ListItem() {
                Text(item)
                  .width('50%')
                  .height('5%')
                  .fontSize(30)
                  .textAlign(TextAlign.Center)
              } /*.editable(true)*/
            }, (item: string) => item)
            ForEach(this.arrayB, (item: string) => {
              ListItem() {
                Text(item)
                  .width('50%')
                  .height('5%')
                  .fontSize(30)
                  .textAlign(TextAlign.Center)
              } /*.editable(true)*/
            }, (item: string) => item)
            ForEach(this.arrayC, (item: string) => {
              ListItem() {
                Text(item)
                  .width('50%')
                  .height('5%')
                  .fontSize(30)
                  .textAlign(TextAlign.Center)
              } /*.editable(true)*/
            }, (item: string) => item)
          }
          .width('30%')
          .backgroundColor('green')
          AlphabetIndexer({ arrayValue: this.value, selected: 0 as int })
            .size({ width: 80, height: 80 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({
              x: 1,
              y: 1,
              z: 1,
              centerX: 1,
              centerY: 1
            })
            .rotate({
              x: 1,
              y: 1,
              z: 1,
              angle: 0,
              centerX: 1,
              centerY: 1
            })
            .transform(matrix)
            .key("AlphabetIndexer_Size")
            .backgroundColor('red')
            .selectedColor(0xFFFFFF)
            .popupColor(0xFFFAF0)
            .selectedBackgroundColor(0xCCCCCC)
            .popupBackground(0xD2B48C)
            .usingPopup(true)
            .selectedFont({ size: 16, weight: FontWeight.Bolder })
            .popupFont({ size: 30, weight: FontWeight.Bolder })
            .itemSize(28)
            .alignStyle(IndexerAlign.Left)
            .onSelect((index: int): void => {
            
            })
            .onRequestPopupData(((index: int): Array<String> | undefined => {
              if (this.value[index as int] == 'A') {
                return this.arrayA
              } else if (this.value[index as int] == 'B') {
                return this.arrayB
              } else if (this.value[index as int] == 'C') {
                return this.arrayC
              } else {
                return []
              }
            }) as OnAlphabetIndexerRequestPopupDataCallback)
            .onPopupSelect((index: int): void => {
              console.info('onPopupSelected:' + index)
            })
        }
        .width('100%')
      }
    }.key('AlphabetIndex_Father')
  }
}