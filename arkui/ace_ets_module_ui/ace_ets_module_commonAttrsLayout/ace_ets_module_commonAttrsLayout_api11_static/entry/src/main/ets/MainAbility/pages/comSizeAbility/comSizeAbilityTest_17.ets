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
  Builder,
  Button,
  Callback,
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
  ForEach,
  Gauge,
  Grid,
  GridCol,
  GridItem,
  GridRow,
  Image,
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
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

class bottom {
  bottom: number = 50
}

let bott: bottom = new bottom()

@Entry
@Component
struct comSizeAbilityTest_17 {
  scroller: Scroller = new Scroller();
  private select: int = 1;
  private apfruits: string[] = ['选项1', '选项2', '选项3', '选项4'];

  build() {
    Column() {
      Row() {
        Button('to_1').onClick((e: ClickEvent) => {
          this.scroller.scrollToIndex(0)
        }).key('comSizeAbilityTest_17_to_1')

        Button('to_2').onClick((e: ClickEvent) => {
          this.scroller.scrollToIndex(1)
        }).key('comSizeAbilityTest_17_to_2')

        Button('to_3').onClick((e: ClickEvent) => {
          this.scroller.scrollToIndex(2)
        }).key('comSizeAbilityTest_17_to_3')
      }

      List({ space: 5, initialIndex: 0, scroller: this.scroller }) {
        ListItem() {
          TextPicker({ range: this.apfruits, selected: this.select })


            .backgroundColor(0XBDDB69)
            .key("TextPicker_Size")
            .size({ width: 130, height: 110 })
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
        }.key('TextPicker_Father')

        ListItem() {
          Text('显示文本组件')
            .key("Text_Size")
            .textAlign(TextAlign.Center)
            .backgroundColor(0XBDDB69)
            .size({ width: 155, height: 100 })
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
        }.key('Text_Father')

        ListItem() {
          TextInput({ text: '文本内容' })
            .backgroundColor(0XBDDB69)
            .key("TextInput_Size")
            .size({ width: 135, height: 110 })
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
        }.key('TextInput_Father')
      }.width('100%')
    }.height('100%')
  }
}


