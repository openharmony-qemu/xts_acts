'use static';

/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { typeNode, NodeController, FrameNode, ComponentContent } from '@ohos.arkui.node';
import {
  Entry,
  Column,
  Component,
  Flex,
  ColumnOptions,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  Color,
  Builder,
  Row,
  NodeContainer,
  wrapBuilder
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
@Builder
function buildText() {
  Column() {
    Text('hello')
      .height(15)
      .backgroundColor(Color.Yellow)
  }
}

export class MyNodeController extends NodeController {

  public node: FrameNode | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext)
    this.node?.commonAttribute.width(220).height(200).backgroundColor(Color.Red)
    let col = typeNode.createFlexNode(uiContext)
    col.attribute.width(200)
      .height(180)
      .borderWidth(1)
      .borderColor(Color.Black)
      .backgroundColor(0xAFEEEE)
    this.node?.appendChild(col)
    let row4 = typeNode.createProgressNode(uiContext)
    row4.attribute.width(100)
      .height(100)
      .borderWidth(1)
      .borderColor(Color.Black)
      .backgroundColor(Color.Green)
    let component = new ComponentContent<ESObject>(uiContext, wrapBuilder(buildText))
    row4.addComponentContent(component)
    col.appendChild(row4)
    return this.node
  }
  getNodeType(): string
  {
    let inspectorInfo = this.node?.getFirstChild()?.getNodeType();
    console.info("inspectorInfo " + JSON.stringify(inspectorInfo));
    return JSON.stringify(inspectorInfo)
  }

}

@Entry
@Component
struct createNodeFlexTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State node: FrameNode | null = null;
  @State uiContext: UIContext = this.getUIContext()
  @State type: string = "getNodeType"

  build() {
    Column({space:3} as ColumnOptions) {
      Column(){
        Row() {
          NodeContainer(this.myNodeController);
        }.height(150)
        Text(this.type).id("createNodeFlexText").height(15)
        Button("getInspectorInfo").id("createNodeFlexType").onClick((e:ClickEvent) => {
          this.type = this.myNodeController?.getNodeType()!
        })
        .height(15)
      }
    }.width('100%').height('100%')
  }
}