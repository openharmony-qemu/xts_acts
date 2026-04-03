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

import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;
  public testNodeId: string = 'testNode';
  public duplicateNodeId: string = 'duplicateNode';
  public nonExistentNodeId: string = 'nonExistentNode';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 5 });
    this.rootNode.appendChild(col);

    let text1 = typeNode.createNode(uiContext, 'Text');
    text1.initialize('Test Node').id(this.testNodeId).backgroundColor(Color.Yellow);
    col.appendChild(text1);

    let text2 = typeNode.createNode(uiContext, 'Text');
    text2.initialize('Duplicate Node 1').id(this.duplicateNodeId);
    col.appendChild(text2);

    let text3 = typeNode.createNode(uiContext, 'Text');
    text3.initialize('Duplicate Node 2').id(this.duplicateNodeId);
    col.appendChild(text3);

    return this.rootNode;
  }

  getFrameNodeById(id: string): FrameNode | null {
    if (this.rootNode) {
      return this.rootNode.getFrameNodeById(id);
    }
    return null;
  }

  setNodeBackgroundColor(id: string, color: string): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeById(id);
      if (node) {
        node.commonAttribute.backgroundColor(color);
      }
    }
  }

  testEmptyString(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeById('');
      AppStorage.setOrCreate('getFrameNodeByIdEmptyStringResult', node);
    }
  }

  testNull(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeById(null);
      AppStorage.setOrCreate('getFrameNodeByIdNullResult', node);
    }
  }

  testUndefined(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeById(undefined);
      AppStorage.setOrCreate('getFrameNodeByIdUndefinedResult', node);
    }
  }

  testNonExistentNode(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeById(this.nonExistentNodeId);
      AppStorage.setOrCreate('getFrameNodeByIdNonExistentResult', node);
    }
  }

  testDuplicateNodeId(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeById(this.duplicateNodeId);
      AppStorage.setOrCreate('getFrameNodeByIdDuplicateResult', node);
    }
  }
}

@Entry
@Component
struct FrameNodeGetFrameNodeById {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 10 }) {
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

      Button('Test Null')
        .id('testNullButton')
        .onClick(() => {
          this.myNodeController.testNull();
        })

      Button('Test Undefined')
        .id('testUndefinedButton')
        .onClick(() => {
          this.myNodeController.testUndefined();
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
