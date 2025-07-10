/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Column, Component, ItemAlign, Text, Button, Row, ClickEvent, ContentSlot } from '@ohos.arkui.component'
import { NodeContent, typeNode } from '@ohos.arkui.node';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { State, Watch, Link, LocalStorage, IStorageProperties } from '@ohos.arkui.stateManagement'

let para: Record<string, number> = { 'NodeContentFlagAPI': 0 };
let storage: LocalStorage = new LocalStorage();
// FrameNode
//
// class NodeContentCtrl {
//   content: NodeContent
//   // textNode: Array<typeNode.Text> = new Array();
//   uiContext: UIContext
//   width: number
//
//   constructor(uiContext: UIContext) {
//     this.content = new NodeContent()
//     this.uiContext = uiContext
//     this.width = Infinity
//   }
//
//   AddNode() {
//     // let node = typeNode.createNode(this.uiContext, "Text")
//     // node.initialize("ContentText:" + this.textNode.length).fontSize(20)
//     // this.textNode.push(node)
//     // storage.set('NodeContentFlagAPI', this.textNode.length);
//     // this.content.addFrameNode(node)
//   }
//
//   RemoveNode() {
//     // let node = this.textNode.pop()
//     // storage.set('NodeContentFlagAPI', this.textNode.length);
//     // this.content.removeFrameNode(node)
//   }
//
//   GetContent(): NodeContent {
//     return this.content
//   }
// }

@Entry
@Component
struct APINodeContent {
  // @State message: string = 'Hello World';
  // controller = new NodeContentCtrl(this.getUIContext());
  // @State text1: number = 0;

  build() {
    Row() {
      Column() {
        // Text(`${this.text1}`).id('APINodeContent_Text')
        Button('get context').width('50%').id('APINodeContent_Button_get')
          .onClick((event: ClickEvent) => {
            // this.text1 = storage.get<number>('NodeContentFlagAPI') as number
          })
        // ContentSlot(this.controller.GetContent())

        Button("AddToSlot").id('APINodeContent_Button_AddToSlot')
          .onClick((event: ClickEvent) => {
            // this.controller.AddNode()
          })
        Button("RemoveBack").id('APINodeContent_Button_RemoveBack')
          .onClick((event: ClickEvent) => {
            // this.controller.RemoveNode()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}