/*
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

import {
  Builder,
  Button,
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
} from '@ohos.arkui.component'
import { AppStorage, LocalStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';


let storage: LocalStorage = new LocalStorage();
storage.setOrCreate('DividerType', 'Init');

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width(400)
      .height(100)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 } as Margin);
    let col = typeNode.createColumnNode(uiContext, 'Column');
    col.initialize({ space: 5 } as ColumnOptions).width('100%').height('100%').margin({ top: 5 } as Margin);
    node.appendChild(col);

    let divider = typeNode.createDividerNode(uiContext, 'Divider');
    divider.initialize().strokeWidth(5).margin({ top: 5 } as Margin);
    col.appendChild(divider);
    storage.set('DividerType', '' + divider.getNodeType());

    return node;
  }
}

@Entry
@Component
struct TypeNodeDivider {
  @State nodeType: string = "Init"
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      Button(this.nodeType).id("TypeNode_Divider")
        .onClick((e: ClickEvent) => {
          this.nodeType = storage.get<string>('DividerType') as string
        })
      NodeContainer(this.myNodeController);

    }
  }
}