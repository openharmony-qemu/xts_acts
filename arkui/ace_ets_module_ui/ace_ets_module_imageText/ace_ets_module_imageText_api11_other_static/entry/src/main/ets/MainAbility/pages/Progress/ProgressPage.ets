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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  RowOptions,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  ProgressType,
  Progress,
  LinearStyleOptions,
  RingStyleOptions,
  CapsuleStyleOptions,
  ProgressStyleOptions,
  ScaleRingStyleOptions
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ProgressPage {
  @State value: number = 20
  @State total: number = 100
  @State type: ProgressType = ProgressType.Linear
  @State color: Color = Color.Grey
  @State backColor: Color = Color.Red
  @State strokeWidth: number = 15
  @State scaleCount: int = 15
  @State scaleWidth: number = 5
  messageManager: MessageManager<number | ProgressType | Color> = new MessageManager<number | ProgressType | Color>()

  onPageShow() {
    console.info('ProgressPage onPageShow')
    AppStorage.setOrCreate<MessageManager<number | ProgressType | Color>>("messageManager", this.messageManager);
    let callback: Callback<number | ProgressType | Color> = (message: Message<number | ProgressType | Color>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'progressValue') {
        this.value = message.value as Double
      }
      if (message.name == 'progressTotal') {
        this.total = message.value as Double
      }
      if (message.name == 'ProgressType') {
        this.type = message.value as ProgressType
      }
      if (message.name == 'progressColor') {
        this.color = message.value as Color
      }
      if (message.name == 'backgroundColor') {
        this.backColor = message.value as Color
      }
      if (message.name == 'strokeWidth') {
        this.strokeWidth = message.value as Double
      }
      if (message.name == 'scaleCount') {
        this.scaleCount = message.value as int
      }
      if (message.name == 'scaleWidth') {
        this.scaleWidth = message.value as Double
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Text('Linear Progress').fontSize(9).fontColor(0xCCCCCC).width('90%').key('text')
      Progress({ value: this.value, total: this.total, type: this.type })
        .color(this.color)
        .value(this.value)
        .width(200)

        .backgroundColor(this.backColor)
        .key('pro1')
      Progress({ value: 10 }).width(100).key('pro2')

      Text('Eclipse Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 10, type: ProgressType.Eclipse }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.Eclipse }).color(this.color).value(50).width(100)
      }

      Text('ScaleRing Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 10, type: ProgressType.ScaleRing }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.ScaleRing })
          .color(this.color)
          .value(50)
          .width(100)
          .style({
            strokeWidth: this.strokeWidth,
            scaleCount: this.scaleCount,
            scaleWidth: this.scaleWidth
          } as ProgressStyleOptions)
          .key('pro3')
      }

      Text('Ring Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 10, type: ProgressType.Ring }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.ScaleRing })
          .color(this.color).value(50).width(100)
          .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 20 } as ProgressStyleOptions)
      }

      Text('Capsule Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 10, type: ProgressType.Capsule }).width(100).height(50)
        Progress({ value: this.value, total: 150, type: ProgressType.Capsule })
          .color(this.color)
          .value(50)
          .width(100)
          .height(50)
        Progress({ value: this.value, total: 150, type: ProgressType.Linear })
          .style({
            strokeWidth: 20,
            scaleCount: 30,
            scaleWidth: 20,
            //strokeRadius: 2
          } as ProgressStyleOptions)
          .color(this.color)
          .value(50)
          .width(100)
          .height(50)
      }
    }.width('100%').margin({ top: 30 } as Margin)
  }
}