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

import { BuilderNode, FrameNode, NodeController } from '@ohos.arkui.node'
import {
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Margin,
  NodeContainer,
  Row,
  Text,
  wrapBuilder,
  WrappedBuilder
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Component
struct TestComponentDispose {
  build() {
    Column() {
      Text('This is a BuilderNode.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }

  aboutToAppear() {
    console.error('aboutToAppear');
  }

  aboutToDisappear() {
    console.error('aboutToDisappear');
  }
}

@Builder
function buildComponent() {
  TestComponentDispose()
}

class MyNodeControllerDispose extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: BuilderNode<[]> | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode<[]>(uiContext, { selfIdealSize: { width: 200, height: 100 } });


    const rootRenderNode = this.rootNode?.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode!.size = { width: 200, height: 200 };
      rootRenderNode!.backgroundColor = 0xff00ff00;
      rootRenderNode!.appendChild(this.builderNode!.getFrameNode()!.getRenderNode()!);
    }

    return this.rootNode;
  }

  disposeFrameNode() {
    if (this.rootNode !== null && this.builderNode !== null) {
      this.rootNode?.removeChild(this.builderNode?.getFrameNode()!);
      this.builderNode?.dispose();
      this.rootNode?.dispose();
    }
  }

  getFrameNode() {
    if (this.rootNode !== null && this.builderNode !== null) {
      return this.builderNode?.getFrameNode()
    } else {
      return null
    }
  }

  removeBuilderNode() {
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null && this.builderNode !== null && this.builderNode?.getFrameNode() !== null) {
      rootRenderNode!.removeChild(this.builderNode!.getFrameNode()!.getRenderNode()!);
    }
  }
}

@Entry
@Component
struct Dispose1 {
  @State flag: FrameNode | null = null
  @State result: string = "Init"
  private myNodeController: MyNodeControllerDispose = new MyNodeControllerDispose();

  build() {
    Column({ space: 4 } as ColumnOptions) {
      NodeContainer(this.myNodeController).height('30%')
      Button('FrameNode dispose').id("dispose_click").height('10%')
        .onClick((e: ClickEvent) => {
          this.myNodeController.disposeFrameNode();
        }).width('100%')
      Text(this.result).id("dispose_result").height('10%')
        .onClick((e: ClickEvent) => {
          this.flag = this.myNodeController.getFrameNode()!;
          if (this.flag) {
            this.result = "dispose fail"
          } else {
            this.result = "Init"
          }
        }).width('100%')
    }
    .height('100%')
  }
}