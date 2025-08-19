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
import UDC from '@ohos.data.unifiedDataChannel';
import dragController from '@ohos.arkui.dragController'
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import curves from '@ohos.curves';
import { BusinessError } from '@ohos.base';
import {
  $rawfile,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  Curve,
  CustomBuilder,
  DragEvent,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ItemAlign,
  Margin,
  Padding,
  ResourceColor,
  Row,
  Text,
  TextAlign,
  TextArea,
  TouchEvent,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

class tmp {
  event: DragEvent | undefined = undefined
  extraParams: string = ''
}

@Entry
@Component
struct DragControllerPage {
  @State pixmap: image.PixelMap | null = null
  @State setColorText: ResourceColor = Color.Green

  build() {
    Column() {
      Button('拖拽至此处')
        .backgroundColor(this.setColorText)
        .id('setForegroundColor_id')
        .onDragEnter((event: DragEvent, extraParams?: string): void => {
          try {
            let previewObj: dragController.DragPreview = this.getUIContext().getDragController().getDragPreview();
            this.setColorText = Color.Pink


          } catch (error) {
            let msg = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`show error code is ${code}, message is ${msg}`);
          }
        })
        .onDrop((event: DragEvent): void => {
        })
      Button('拖起')
        .draggable(true)
        .id('TouchParent_id')
        .onTouch((event?: TouchEvent) => {
          if (event) {
            if (event.type == TouchType.Down) {


              let eve: tmp = new tmp()


            }
          }
        }).margin({ top: 100 } as Margin)
    }
    .width('100%')
    .height('100%')
  }
}