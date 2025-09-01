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
  Alignment,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  GridCol,
  Image,
  ImageSize,
  Margin,
  Padding,
  Position,
  Row,
  SizeOptions,
  Text,
  TextAlign,
} from '@ohos.arkui.component';
import { AppStorage, Link, Prop, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct GridContainerExample {
  build() {
    Column({ space: 5 } as ColumnOptions) {
      GridCol() {
        Row() {
          Text('1')
            .fontSize(20)


            .height(50)
            .backgroundColor(0x4582B4)
            .textAlign(TextAlign.Center)
          Text('2')
            .fontSize(20)


            .height(50)
            .backgroundColor(0x00BFFF)
            .textAlign(TextAlign.Center)
          Text('3')
            .fontSize(20)


            .height(50)
            .backgroundColor(0x4682B4)
            .textAlign(TextAlign.Center)
          Text('4')
            .fontSize(20)


            .height(50)
            .backgroundColor(0x00BFFF)
            .textAlign(TextAlign.Center)
        }
      }
      .width('90%')
      .key('gridContainer')
      .margin({ top: 300 } as Margin)
    }
  }
}