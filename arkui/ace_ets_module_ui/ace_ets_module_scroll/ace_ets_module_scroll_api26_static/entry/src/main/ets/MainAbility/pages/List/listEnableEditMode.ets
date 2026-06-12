'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Flex,
  Row,
  Text,
  Button,
  ClickEvent,
  List,
  ListItem,
  Scroller,
  ForEach,
  Scroll,
  Color,
  Builder,
  Margin,
  Axis,
  BarState,
  StickyStyle,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ListEnableEditMode {
  @State arr: string[] = ['0', '1', '2', '3', '4', '5'];

  build() {
    Column({ space: 2 } as ColumnOptions) {
      // 测试1: enableEditMode 设置为 true
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .id('list_enableEditMode_true')
      .enableEditMode(true)
      .backgroundColor(0xFAEEE0)
      .width('90%')
      .height('15%')

      // 测试2: enableEditMode 设置为 false
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .id('list_enableEditMode_false')
      .backgroundColor(0xFAEEE0)
      .enableEditMode(false)
      .width('90%')
      .height('15%')

      // 测试3: enableEditMode 设置为 undefined
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text(item)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('50%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .id('list_enableEditMode_undefined')
      .enableEditMode(undefined)
      .backgroundColor(0xFAEEE0)
      .width('90%')
      .height('15%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}