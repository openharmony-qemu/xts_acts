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
  List,
  ListItem,
  ListItemGroup,
  PreDragStatus,
  RenderingContextSettings,
  Row,
  Scroller,
  Text,
  TextAlign,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

interface TimeTable {
  title: string;
  projects: string[];
}

@Entry
@Component
struct comSizeAbilityTest_06 {
  scroller: Scroller = new Scroller()
  private timetable: TimeTable[] = [
    {
      title: '星期一',
      projects: ['语文', '数学']
    } as TimeTable,
    {
      title: '星期二',
      projects: ['物理', '化学']
    } as TimeTable
  ]
  private arr_list: string[] = ['0', '1', '2', '3', '4', '5']
  private arr: string[] = ['0']

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(10)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + "节课")
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(5)
  }

  build() {
    Column() {
      Row() {
        Button('to_1').onClick((e: ClickEvent) => {
          this.scroller.scrollToIndex(0)
        }).key('comSizeAbilityTest_06_to_1')

        Button('to_2').onClick((e: ClickEvent) => {
          this.scroller.scrollToIndex(1)
        }).key('comSizeAbilityTest_06_to_2')

        Button('to_3').onClick((e: ClickEvent) => {
          this.scroller.scrollToIndex(2)
        }).key('comSizeAbilityTest_06_to_3')
      }

      List({ space: 5, initialIndex: 0, scroller: this.scroller }) {
        ListItem() {
          List({ space: 20 }) {
            ForEach(this.timetable, (item: TimeTable) => {


            })
          }.backgroundColor('red').height(200)
        }

        ListItem() {
          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
              }
              .key("ListItem_Size")
              .size({ width: 200, height: 240 })
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
              .backgroundColor('gray')
            }, (item: string) => item)
          }.backgroundColor('blue')
        }

        ListItem() {
          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr_list, (item: string) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(50)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor('gray')
              }
            }, (item: string) => item)
          }
          .backgroundColor('black')
          .key("List_Size")
          .size({ width: 200, height: 200 })
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
        }
      }.width('100%')
    }.height('100%')
  }
}
