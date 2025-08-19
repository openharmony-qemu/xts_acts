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
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  Divider,
  DragEvent,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  Image,
  ItemAlign,
  Margin,
  Padding,
  ResponseType,
  Row,
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
struct DragPreviewDemo {
  build() {
    Row() {
      Column() {
        Image($rawfile('bm.jpg'))
          .key('imagepreview')
          .width("30%")
          .height("100")
          .draggable(true)

          .onDragStart((event: DragEvent, extraParams?: string): (() => void) => {
            console.log("Image onDragStart")
          })

      }
      .width("100%")
    }
    .height("100%")
  }
}