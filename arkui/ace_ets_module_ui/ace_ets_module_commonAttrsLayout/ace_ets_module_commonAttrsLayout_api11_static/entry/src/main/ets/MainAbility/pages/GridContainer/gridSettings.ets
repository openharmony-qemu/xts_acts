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
} from '@ohos.arkui.component';
import { AppStorage, Link, Prop, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct GridSetting {
  @State smSpan: number = 2;
  @State smOffset: number = 1;
  @State gridSpanValue: number = 1;
  @State gridOffsetValue: number = 0;

  build() {
    GridCol() {
      Row() {
        Row() {
          Text('Left').fontSize(25)
        }

        .height("100%")
        .backgroundColor(0x66bbb2cb)
        .key('gridOffset')

        Row() {
          Text('Center').fontSize(25)
        }


        .height("100%")
        .backgroundColor(0x66b6c5d1)
        .key('gridRow')

        Row() {
          Text('Right').fontSize(25)
        }

        .height("100%")
        .backgroundColor(0x66bbb2cb)
        .key('gridSpan')
      }
      .height(200)
    }
    .backgroundColor(0xf1f3f5)
    .margin({ top: 10 } as Margin)
    .key('gridContainer')
  }
}