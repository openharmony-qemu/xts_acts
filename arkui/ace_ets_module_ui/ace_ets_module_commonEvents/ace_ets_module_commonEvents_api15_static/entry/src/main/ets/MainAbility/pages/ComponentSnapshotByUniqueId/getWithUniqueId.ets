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
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  $r,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  GestureEvent,
  HorizontalAlign,
  Image,
  LongPressGesture,
  Margin,
  NodeContainer,
  Padding,
  Row,
  SourceTool,
  Text
} from '@ohos.arkui.component'
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';

class MyNodeController extends NodeController {
  public node: FrameNode | null = null;
  public imageNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node?.commonAttribute.width('100%').height('100%')


    return this.node;
  }
}

@Entry
@Component
struct SnapshotExample {
  @State pixmap: image.PixelMap | undefined = undefined
  @State text: string = 'text'
  @State snapshotScale: number = 1
  @State snapshotWait: boolean = false
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text(this.text).id('resultText')
      Row() {
        Image(this.pixmap as image.PixelMap).width(200).height(200).border({ color: Color.Black, width: 2 }).margin(5)
        NodeContainer(this.myNodeController).width(200).height(200).margin(5)
      }

      Button('Scale: ' + this.snapshotScale)
        .id('snapshotScale')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.snapshotScale += 0.5
        })

      Button('snapshotWait: ' + this.snapshotWait)
        .id('snapshotWait')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.snapshotWait = !this.snapshotWait
        })

      Button('UniqueId get snapshot')
        .id('UniqueId_getSnapshot')
        .onClick((e: ClickEvent) => {
          try {
            this.getUIContext()
              .getComponentSnapshot()
              .getWithUniqueId(Long.toDouble(this.myNodeController.imageNode?.getUniqueId()!),
                {
                  scale: this.snapshotScale,
                  waitUntilRenderFinished: this.snapshotWait
                } as componentSnapshot.SnapshotOptions)!
              .then((pixmap: image.PixelMap) => {
                this.pixmap = pixmap
                this.text = 'UniqueId_getSnapshot_success'
              })
              .catch((err: Error) => {
                console.log('error: ' + err)
              })
          } catch (error) {
            console.error('UniqueId get snapshot Error: ' + JSON.stringify(error))
          }
        }).margin(10)

      Button('UniqueId getSync snapshot')
        .id('UniqueId_getSyncSnapshot')
        .onClick((e: ClickEvent) => {
          try {
            this.pixmap = this.getUIContext()
              .getComponentSnapshot()
              .getSyncWithUniqueId(Long.toDouble(this.myNodeController.imageNode?.getUniqueId()!),
                {
                  scale: this.snapshotScale,
                  waitUntilRenderFinished: this.snapshotWait
                } as componentSnapshot.SnapshotOptions)
            this.text = 'UniqueId_getSyncSnapshot_success'
          } catch (error) {
            console.error('UniqueId getSync snapshot Error: ' + JSON.stringify(error))
          }
        }).margin(10)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}