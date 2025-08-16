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
import { typeNode, FrameNode, NodeController } from '@ohos.arkui.node';
import { UIContext } from "@ohos.arkui.UIContext";
import {
  Entry,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  Column,
  Row,
  Text,
  Button,
  NodeContainer,
  ClickEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute
      .width('100%')
      .height('100%')
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    

    for (let i = 0; i < 20; i++) {
      
      
      
      
      
      
      
      
    }
    
    return node;
  }

  getNodeType() {
    let inspectorInfo = this.rootNode?.getFirstChild()?.getNodeType();
    console.info('inspectorInfo ' + JSON.stringify(inspectorInfo));
    return JSON.stringify(inspectorInfo)
  }
}

@Entry
@Component
struct nodeGridTypeIndex {
  private myNodeController: MyNodeController = new MyNodeController();
  @State node: FrameNode | null = null;
  @State uiContext: UIContext = this.getUIContext()
  @State type: string = 'getNodeType'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Column() {
        Row() {
          NodeContainer(this.myNodeController);
        }

        Text(this.type).margin(30)
        Button('getInspectorInfo')
          .onClick((e: ClickEvent) => {
            this.type = this.myNodeController?.getNodeType()!
          })
      }
    }
  }
}