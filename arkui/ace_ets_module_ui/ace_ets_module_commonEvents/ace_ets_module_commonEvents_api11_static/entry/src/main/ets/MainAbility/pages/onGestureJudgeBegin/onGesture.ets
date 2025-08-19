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
  $rawfile,
  BaseGestureEvent,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragEvent,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  GestureControl,
  GestureInfo,
  GestureJudgeResult,
  ItemAlign,
  LongPressGesture,
  LongPressGestureEvent,
  Margin,
  Padding,
  PanGesture,
  PanGestureEvent,
  PinchGesture,
  RotationGesture,
  Row,
  RowOptions,
  SwipeGesture,
  SwipeGestureEvent,
  TapGesture,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct onGesture1 {
  @State message: string = 'hello';

  build() {
    Column() {
      Text(this.message)
        .key('onGesture_Text')
        .width(100).height(40).backgroundColor(Color.Pink)
    }
    .margin({ top: 20 } as Margin)
    .width('100%')
    .height(200)
    .gesture(
      LongPressGesture()
        .tag("longPress1")
    )
    .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent): GestureJudgeResult => {
      if (gestureInfo.type == GestureControl.GestureType.LONG_PRESS_GESTURE) {
        this.message = 'longPress'
      }
      return GestureJudgeResult.CONTINUE;
    })
  }
}