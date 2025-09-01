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
import { ComponentContent, FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import {
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
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
  wrapBuilder
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Builder
function buildText() {
  Column() {
    Text('hello')
      .width(50)
      .height(50)
      .backgroundColor(Color.Yellow)
  }
}

class MyNodeController extends NodeController {
  public node: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext)
    this.node?.commonAttribute.width(300).height(300).backgroundColor(Color.Red)
    let col = typeNode.createFlexNode(uiContext, "Flex")
    col.attribute.width(200)
      .height(200)
      .borderWidth(1)
      .borderColor(Color.Black)
      .backgroundColor(0xAFEEEE)
    this.node?.appendChild(col)


    let component = new ComponentContent<Object>(uiContext, wrapBuilder(buildText))


    return this.node
  }

  getNodeType() {
    let inspectorInfo = this.node?.getFirstChild()?.getNodeType();
    console.info("inspectorInfo " + JSON.stringify(inspectorInfo));
    return JSON.stringify(inspectorInfo)
  }
}

@Entry
@Component
struct createNodeFlexTest {
  @State node: FrameNode | null = null;
  @State uiContext: UIContext = this.getUIContext()
  @State type: string = "getNodeType"
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Column() {
        Row() {
          NodeContainer(this.myNodeController);
        }

        Text(this.type).margin(30).id("createNodeFlexText")
        Button("getInspectorInfo").id("createNodeFlexType").onClick((e: ClickEvent) => {
          this.type = this.myNodeController?.getNodeType()!
        })
      }
    }

  }
}