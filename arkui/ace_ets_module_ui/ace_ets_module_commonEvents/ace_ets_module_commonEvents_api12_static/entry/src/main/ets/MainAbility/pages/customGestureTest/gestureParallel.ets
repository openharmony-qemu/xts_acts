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
  BorderStyle,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomBuilder,
  DragItemInfo,
  Entry,
  GestureEvent,
  GestureGroup,
  GestureMode,
  LongPressGesture,
  Margin,
  Row,
  TapGesture,
  Text,
  TouchEvent,
  TouchType
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct GestureGroupExample_2 {
  @State count: number = 0
  @State borderStyles: BorderStyle = BorderStyle.Solid
  @State message1: string = ''
  @State message2: string = ''

  build() {
    Column() {
      Text(this.message1)
        .id('tapGestureMsg')
        .fontSize(18)
        .margin(10)
      Text(this.message2)
        .id('longPressMsg')
        .fontSize(18)
        .margin(10)
      Column() {
        Text('Parallel')
          .fontSize(18)
          .fontColor(Color.Pink)
      }
      .id('columnParallel1')
      .key('parallelGestureKey')
      .height(200)
      .width(400)
      .padding(20)
      .margin(20)
      .border({ width: 3, style: this.borderStyles })
      .gesture(

        GestureGroup(GestureMode.Parallel,
          TapGesture({ count: 2 })
            .onAction(() => {
              this.borderStyles = BorderStyle.Dashed
              console.info('tapGesture onAction')
              this.message1 = 'tapGesture onAction'
            }),
          LongPressGesture({ repeat: true })
            .onAction((event?: GestureEvent) => {
              if (event && event.repeat) {
                this.count++
                console.info('LongPress onAction')
                this.message2 = 'LongPress onAction'
              }
            })
            .onActionEnd((event: GestureEvent) => {
              this.count = 0
              console.info('LongPress onActionEnd')
              this.message2 = 'LongPress onActionEnd'
            })
        )
      )
    }
  }
}