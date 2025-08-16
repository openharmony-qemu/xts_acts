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
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  GestureEvent,
  HorizontalAlign,
  LongPressGesture,
  Margin,
  Padding,
  PanDirection,
  RotationGesture,
  SourceTool,
  Text
} from '@ohos.arkui.component'

@Entry
@Component
struct RotationGestureAllowedTypes {
  @State types: Array<SourceTool | undefined | null> = new Array<SourceTool | undefined | null>();
  @State result: string = 'allowed types default';
  @State angle: number = 0;

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Column() {
        Text('RotationGesture').fontSize(20)
      }
      .rotate({ angle: this.angle })
      .width(160)
      .height(160)
      .backgroundColor(Color.Yellow)
      .key('RotationGestureAllowedTypes_Text')
      .gesture(
        RotationGesture()

          .onActionStart((event: GestureEvent) => {
            console.info('RotationGestureAllowedTypes onActionStart')
            this.result = 'allowed types success'
          })
          .onActionUpdate((event: GestureEvent) => {
            console.info('RotationGestureAllowedTypes onActionUpdate')
            this.result = 'allowed types success'
          })
      )

      Text(this.result).key('RotationGestureAllowedTypes_result')

      Button('Mouse').id('Mouse_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default';
          this.types = [SourceTool.MOUSE];
        })
      Button('Finger').id('Finger_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default';
          this.types = [SourceTool.Finger];
        })
      Button('Invalid').id('Invalid_type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default';
          this.types = [null, undefined];
        })
    }
    .padding({ top: 10, left: 40 } as Padding)
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor('#ffbebaba')
    .key('RotationGestureAllowedTypes_Father')
  }
}
