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
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  GestureEvent,
  ItemAlign,
  List,
  ListItem,
  LongPressGesture,
  Margin,
  Padding,
  PanDirection,
  PanGesture,
  PanGestureOptions,
  Row,
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
struct gestureEnabled1 {
  @State value: string = 'Gesture enabled false'

  build() {
    Column() {
      Text('初始值').key("value")
        .onClick((e: ClickEvent) => {
          this.value = 'Gesture enabled false'
        })

      Text(this.value).key('gestureText')
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('TapGesture enabled_true').fontSize(15).key('gestureOnce')
            .gesture(
              TapGesture()
                .onAction((event: GestureEvent) => {
                  this.value = 'TapGesture单击 已触发'
                })
            ).enabled(true)
        }

        ListItem() {
          Text('TapGesture once').fontSize(15).key('gesture1')
            .gesture(
              TapGesture()
                .onAction((event: GestureEvent) => {
                  this.value = 'TapGesture单击 已触发'
                })
            ).enabled(false)
        }

        ListItem() {
          Text('TapGesture twice').fontSize(15).key('gesture2')
            .gesture(
              TapGesture({ count: 2 })
                .onAction((event: GestureEvent) => {
                  this.value = 'TapGesture双击 已触发'
                })
            ).enabled(false)
        }

        ListItem() {
          Text('LongPress').fontSize(15).key('gesture3')

            .gesture(
              LongPressGesture({ repeat: true })

                .onAction((event: GestureEvent) => {
                  if (event.repeat) {
                    this.value = 'LongPress onAction 已触发'
                  }
                })
                .onActionEnd(() => {
                  this.value = 'LongPress onActionEnd 已触发'
                })
                .onActionCancel(() => {
                  this.value = 'LongPress onActionCancel 已触发'
                })
            ).enabled(false)
        }

        ListItem() {
          Text('PanGesture').fontSize(15).id('gesture4')


            .enabled(false)
        }
      }
    }
    .height('90%')
    .width('100%')
  }
}


