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
  $r,
  Builder,
  Button,
  Color,
  Column,
  Component,
  CopyOptions,
  DragEvent,
  DragResult,
  Entry,
  Margin,
  ResourceColor,
  Text,
  TextArea,
  TouchEvent,
  TouchType,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import UDC from '@ohos.data.unifiedDataChannel';
import dragController from '@ohos.arkui.dragController'
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import curves from '@ohos.curves';
import { BusinessError } from '@ohos.base';

class tmp {
  event: DragEvent | undefined = undefined
  extraParams: string = ''
}

@Entry
@Component
struct DragControllerPage {
  @State pixmap: image.PixelMap | null = null
  @State setColorText: ResourceColor = Color.Green

  @Builder
  DraggingBuilder() {
    Column() {
      Text("DraggingBuilder")
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }

  @Builder
  PixmapBuilder() {
    Column() {
      Text("PixmapBuilder")
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }

  build() {
    Column() {
      Button('拖拽至此处')
        .backgroundColor(this.setColorText)
        .id('setForegroundColor_id')


      Button('拖起')
        .draggable(true)
        .id('TouchParent_id')
        .onTouch((event?: TouchEvent) => {
          if (event) {
            if (event.type == TouchType.Down) {
              let text = new UDC.UnifiedRecord()
              let unifiedData = new UDC.UnifiedData(text)
              console.log("one drag Down");
              let dragInfo: dragController.DragInfo = {
                pointerId: 0,
                data: unifiedData,
                extraParams: ''
              }
              let eve: tmp = new tmp()
              this.getUIContext().getDragController().executeDrag((): void => {
                this.DraggingBuilder()
              }, dragInfo, (err: BusinessError<void> | null, eve: dragController.DragEventParam | undefined): void => {
                console.log(`zxr ${JSON.stringify(err)}`)
                if (eve && eve.event) {
                  if (eve.event.getResult() == DragResult.DRAG_SUCCESSFUL) {
                    console.log('success');
                  } else if (eve.event.getResult() == DragResult.DRAG_FAILED) {
                    console.log('failed');
                  }
                }
              })

            }
          }
        }).margin({ top: 100 } as Margin)
    }
    .width('100%')
    .height('100%')
  }
}