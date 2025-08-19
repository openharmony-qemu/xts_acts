/*
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
  BaseGestureEvent,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomBuilder,
  DragEvent,
  DragItemInfo,
  Entry,
  FlexAlign,
  GestureControl,
  GestureEvent,
  GestureGroupGestureHandlerOptions,
  GestureGroupHandler,
  GestureInfo,
  GestureJudgeResult,
  GestureModifier,
  LongPressGesture,
  Margin,
  PanDirection,
  PanGesture,
  PanGestureHandler,
  PanGestureOptions,
  Row,
  Scroll,
  SourceTool,
  TapGesture,
  TapGestureHandler,
  Text,
  TouchEvent,
  TouchType,
  UIGestureEvent
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct PanGestureSourceTool {
  @State sourceTool1: SourceTool = SourceTool.MOUSE
  @State sourceTool2: SourceTool = SourceTool.TOUCHPAD
  @State sourceTool3: SourceTool = SourceTool.JOYSTICK
  @State axisHorizontal: number = 0
  @State axisVertical: number = 0

  build() {
    Column() {
      Column() {
        Button('' + this.axisHorizontal).id("axisHorizontal_id")
        Button('' + this.axisVertical).id("axisVertical_id")
        Button('' + this.sourceTool1).id("sourceTool1_id")
      }
      .id("PanGestureSourceToolColumn")
      .height('30%')
      .width('30%')
      .padding(20)
      .border({ width: 3 })
      .margin(50)


      .gesture(
        TapGesture()
          .onAction((event: GestureEvent) => {
            console.info('tap start')
            if (event) {
              this.sourceTool1 = event.sourceTool
            }
          })
      )

      Button('change SourceTool2').id("changeSourceTool2_id")
        .onClick((e: ClickEvent) => {
          this.sourceTool1 = this.sourceTool2
        })
      Button('change SourceTool3').id("changeSourceTool3_id")
        .onClick((e: ClickEvent) => {
          this.sourceTool1 = this.sourceTool3
        })
    }
  }
}