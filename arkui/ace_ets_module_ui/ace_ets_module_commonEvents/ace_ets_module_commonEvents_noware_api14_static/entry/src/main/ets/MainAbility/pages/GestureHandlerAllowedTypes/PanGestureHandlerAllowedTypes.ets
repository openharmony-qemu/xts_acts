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
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DragEvent,
  Entry,
  GestureEvent,
  GestureModifier,
  HorizontalAlign,
  Image,
  Margin,
  Padding,
  SourceTool,
  Text,
  UIGestureEvent,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Callback, Message } from '../../common/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

class PanGestureHandlerAllowedTypesModifier implements GestureModifier {
  toolTypes: Array<SourceTool | undefined | null> = [];

  constructor(types: Array<SourceTool | undefined | null>, callback: Callback<string>) {
    this.toolTypes = types;
    this.listener = callback;
  }

  listener: Callback<string> = (data: Message<string>) => {
  };

  applyGesture(event: UIGestureEvent): void {


  }
}

@Entry
@Component
struct PanGestureHandlerAllowedTypes {
  @State result: string = 'allowed types default';
  @State modifier: PanGestureHandlerAllowedTypesModifier = new PanGestureHandlerAllowedTypesModifier([], this.callback);

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('Pan')
        .fontSize(20)
        .width(240)
        .height(80)
        .margin({ left: 0, top: 0 } as Margin)
        .padding({ left: 0, top: 0 } as Padding)
        .backgroundColor(Color.Yellow)
        .key('PanGestureHandlerAllowedTypes_Text')
        .gestureModifier(this.modifier)

      Text(this.result).key('PanGestureHandlerAllowedTypes_result')

      Button('Mouse').id('Mouse_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default'
          this.modifier = new PanGestureHandlerAllowedTypesModifier([SourceTool.MOUSE], this.callback);
        })
      Button('Finger').id('Finger_Type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default'
          this.modifier = new PanGestureHandlerAllowedTypesModifier([SourceTool.Finger], this.callback);
        })
      Button('Invalid').id('Invalid_type')
        .onClick((e: ClickEvent) => {
          this.result = 'allowed types default';
          this.modifier = new PanGestureHandlerAllowedTypesModifier([null, undefined], this.callback);
        })
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor('#ffbebaba')
    .key('PanGestureHandlerAllowedTypes_Father')
  }

  private callback: Callback<string> = (data: Message<string>) => {
    this.result = data.value;
  }
}
