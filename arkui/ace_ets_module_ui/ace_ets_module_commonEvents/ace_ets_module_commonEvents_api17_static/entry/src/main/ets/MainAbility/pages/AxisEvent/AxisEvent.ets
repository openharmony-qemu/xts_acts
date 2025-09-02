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
  $r,
  AxisAction,
  AxisEvent,
  Checkbox,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  ForEach,
  Grid,
  HorizontalAlign,
  Image,
  Line,
  List,
  Margin,
  Padding,
  Scroll,
  Swiper,
  Text,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct Index {
  @State count: number = 0;
  @State color: number = 0X330000FF;
  @State x: string = 'Int'
  @State y: string = 'Int'
  @State displayY: string = 'Int'
  @State displayX: string = 'Int'
  @State windowX: string = 'Int'
  @State windowY: string = 'Int'
  @State scrollStep: string = 'Int'
  @State action: string = 'Int'
  @State getVerticalAxisValue: string = 'Int'
  @State getHorizontalAxisValue: string = 'Int'
  @State propagationValue: string = 'Int'
  @State None: string = '123'
  @State Begin: string = '123'
  @State UPDATE: string = '123'
  @State END: string = '123'
  @State Cancel: string = '123'

  build() {
    Column() {
      Text('Mouse AxisEvent')
        .fontSize(20)
        .width(240)
        .height(80)
        .margin({ left: 0, top: 0 } as Margin)
        .padding({ left: 0, top: 0 } as Padding)
        .backgroundColor(Color.Yellow)
        .key('AxisEvent001')
        .onAxisEvent((event: AxisEvent): void => {
          this.x = event.x + ''
          this.y = event.y + ''
          this.displayX = event.displayX + ''
          this.displayY = event.displayY + ''
          this.windowX = event.windowX + ''
          this.windowY = event.windowY + ''
          this.scrollStep = event.scrollStep + ''
          this.action = event.action + ''
          this.getVerticalAxisValue = event.getVerticalAxisValue() + ''
          this.getHorizontalAxisValue = event.getHorizontalAxisValue() + ''

          if (event.action == AxisAction.NONE) {
            console.log("NONE");
            this.None = "NONE"
          } else {
            console.log("error");
          }
          if (event.action == AxisAction.BEGIN) {
            console.log("BEGIN ");
            this.Begin = "BEGIN"
          } else {
            console.log("error");
          }
          if (event.action == AxisAction.UPDATE) {
            console.log("UPDATE ");
            this.UPDATE = "UPDATE"
          } else {
            console.log("error");
          }
          if (event.action == AxisAction.END) {
            console.log("END ");
            this.END = "END"
          } else {
            console.log("error");
          }
          if (event.action == AxisAction.CANCEL) {
            console.log("CANCEL  ");
            this.Cancel = "CANCEL"
          } else {
            console.log("error");
          }
        })
      Text(this.x).key('x')
      Text(this.y).key('y')
      Text(this.displayX).key('displayX')
      Text(this.displayY).key('displayY')
      Text(this.windowX).key('windowX')
      Text(this.windowY).key('windowY')
      Text(this.scrollStep).key('scrollStep')
      Text(this.action).key('action')
      Text(this.getVerticalAxisValue).key('getVerticalAxisValue')
      Text(this.getHorizontalAxisValue).key('getHorizontalAxisValue')
      Text(this.propagationValue).key('propagationValue')
      Text(this.None).key('None')
      Text(this.Begin).key('Begin')
      Text(this.UPDATE).key('UPDATE')
      Text(this.END).key('END')
      Text(this.Cancel).key('Cancel')
    }
    .alignItems(HorizontalAlign.Start).width('100%').height('100%').key('AxisEvent_Father')
  }
}