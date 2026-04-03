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
  public testUniqueId: number = 0;
  public nonExistentUniqueId: number = 999999;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 5 });
    this.rootNode.appendChild(col);

    let text1 = typeNode.createNode(uiContext, 'Text');
    text1.initialize('Test Node').id('testNode').backgroundColor(Color.Yellow);
    this.testUniqueId = text1.getUniqueId();
    col.appendChild(text1);

    return this.rootNode;
  }

  testValidUniqueId(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeByUniqueId(this.testUniqueId);
      if (node) {
        node.commonAttribute.backgroundColor('rgb(39,135,217)');
      }
      AppStorage.setOrCreate('getFrameNodeByUniqueIdValidResult', node);
    }
  }

  testNonExistentUniqueId(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeByUniqueId(this.nonExistentUniqueId);
      AppStorage.setOrCreate('getFrameNodeByUniqueIdNonExistentResult', node);
    }
  }

  testNull(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeByUniqueId(null);
      AppStorage.setOrCreate('getFrameNodeByUniqueIdNullResult', node);
    }
  }

  testUndefined(): void {
    if (this.rootNode) {
      let node = this.rootNode.getFrameNodeByUniqueId(undefined);
      AppStorage.setOrCreate('getFrameNodeByUniqueIdUndefinedResult', node);
    }
  }
}

@Entry
@Component
struct FrameNodeGetFrameNodeByUniqueId {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 10 }) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width(300)
        .height(300)

      Button('Test Valid UniqueId')
        .id('testValidButton')
        .onClick(() => {
          this.myNodeController.testValidUniqueId();
        })

      Button('Test Non Existent UniqueId')
        .id('testNonExistentButton')
        .onClick(() => {
          this.myNodeController.testNonExistentUniqueId();
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
    }.width('100%')
    .padding(20)
  }
}
