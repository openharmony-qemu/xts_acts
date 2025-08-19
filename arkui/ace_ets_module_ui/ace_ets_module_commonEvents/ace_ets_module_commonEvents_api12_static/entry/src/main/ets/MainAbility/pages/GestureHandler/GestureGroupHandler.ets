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
  GestureHandler,
  GestureInfo,
  GestureJudgeResult,
  GestureMode,
  GestureModifier,
  LongPressGesture,
  Margin,
  PanGestureHandler,
  Row,
  Scroll,
  TapGesture,
  TapGestureHandler,
  Text,
  TouchEvent,
  TouchType,
  UIGestureEvent
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

class GestureGroupModifier implements GestureModifier {
  supportDoubleTap: boolean = true
  supportPan: boolean = true
  value: string = 'succ'

  applyGesture(event: UIGestureEvent): void {
    if (this.supportDoubleTap) {


    } else {
      event.addGesture(
        new TapGestureHandler()
          .tag("tap gesture")


      )
    }
    if (this.supportPan) {
      event.addGesture(
        new PanGestureHandler()
          .tag("pan gesture")


      )
    }
  }
}

@Entry
@Component
struct GestureGroupHandler1 {
  @State modifier: GestureGroupModifier = new GestureGroupModifier()

  build() {
    Row() {
      Column() {
        Button(this.modifier.value).margin({ bottom: 20 } as Margin).id('GestureGroupHandler1')
        Column()
          .id('GestureGroupHandlerColumn')
          .gestureModifier(this.modifier)
          .width(400)
          .height(400)
          .backgroundColor(Color.Blue)
      }
      .width('100%')
    }
    .height('100%')
  }
}