'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Entry, Column, ColumnOptions, Component, Button, ClickEvent, NodeContainer, Color } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node'
import { UIContext } from '@ohos.arkui.UIContext';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;
  public testNodeId: string = 'testNode';
  public duplicateNodeId: string = 'duplicateNode';
  public nonExistentNodeId: string = 'nonExistentNode';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    let col = typeNode.createColumnNode(uiContext);
    col.initialize({ space: 5 } as ColumnOptions);
    this.rootNode!.appendChild(col);

    let text1 = typeNode.createTextNode(uiContext);
    text1.initialize('Test Node').id(this.testNodeId).backgroundColor(Color.Yellow);
    col.appendChild(text1);

    let text2 = typeNode.createTextNode(uiContext);
    text2.initialize('Duplicate Node 1').id(this.duplicateNodeId);
    col.appendChild(text2);

    let text3 = typeNode.createTextNode(uiContext);
    text3.initialize('Duplicate Node 2').id(this.duplicateNodeId);
    col.appendChild(text3);

    return this.rootNode;
  }

  setNodeBackgroundColor(id: string, color: string): void {
    if (this.rootNode) {
      let node = this.rootNode!.getFrameNodeById(id);
      if (node) {
        node.commonAttribute.backgroundColor(color);
      }
    }
  }

  testEmptyString(): void {
    if (this.rootNode) {
      let node = this.rootNode!.getFrameNodeById('');
      AppStorage.setOrCreate<FrameNode | null>('getFrameNodeByIdEmptyStringResult', node);
    }
  }

  testNonExistentNode(): void {
    if (this.rootNode) {
      let node = this.rootNode!.getFrameNodeById(this.nonExistentNodeId);
      AppStorage.setOrCreate<FrameNode | null>('getFrameNodeByIdNonExistentResult', node);
    }
  }

  testDuplicateNodeId(): void {
    if (this.rootNode) {
      let node = this.rootNode!.getFrameNodeById(this.duplicateNodeId);
      AppStorage.setOrCreate<FrameNode | null>('getFrameNodeByIdDuplicateResult', node);
    }
  }
}

@Entry
@Component
struct FrameNodeGetFrameNodeById {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 10 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width(300)
        .height(300)

      Button('Set Background Color')
        .id('setButton')
        .onClick(() => {
          this.myNodeController.setNodeBackgroundColor(this.myNodeController.testNodeId, 'rgb(39,135,217)');
        })

      Button('Test Empty String')
        .id('testEmptyStringButton')
        .onClick(() => {
          this.myNodeController.testEmptyString();
        })

      Button('Test Non Existent Node')
        .id('testNonExistentNodeButton')
        .onClick(() => {
          this.myNodeController.testNonExistentNode();
        })

      Button('Test Duplicate Node Id')
        .id('testDuplicateNodeButton')
        .onClick(() => {
          this.myNodeController.testDuplicateNodeId();
        })
    }.width('100%')
    .padding(20)
  }
}
