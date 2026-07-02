'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Entry, Text, Column, Component, Button, ColumnOptions,
  ClickEvent, Row, Stack, ForEach, Color } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { typeNode, FrameNode, NodeController, BuilderNode } from '@ohos.arkui.node'
import { UIContext, NodeContainer, wrapBuilder, NodeController, FrameNode, rememberVariable, MutableVariable } from '@kit.ArkUI';

export class ParamsInt {
  public text: int = 0;

  constructor(text: int) {
    this.text = text;
  }
}

@Builder
function buildGreenOnlyIfElse(param: ParamsInt) {
  console.log('buildGreenOnlyIfElse param: ' + param.text.toString())
  if (param.text <= 3) {
    Text(param.text + ' aaa').height(15).id('getTextString1')
  } else if (param.text <= 5) {
    Text(param.text + ' bbb').height(15).id('getTextString2')
  } else {
    Text(param.text + ' ccc').height(15).id('getTextString3')
  }
}

export class NodeControllerIfElse extends NodeController {
  public node: BuilderNode<ParamsInt> | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new BuilderNode<ParamsInt>(uiContext,{enableMinimized:true});
    this.node!.build(wrapBuilder(buildGreenOnlyIfElse), new ParamsInt(-1))
    console.log('hello' + this.node!.getFrameNode()!.isMinimized());
    return this.node!.getFrameNode();
  }
  makeNode1(uiContext: UIContext): FrameNode | null {
    this.node = new BuilderNode<ParamsInt>(uiContext,{enableMinimized:false});
    this.node!.build(wrapBuilder(buildGreenOnlyIfElse), new ParamsInt(-1))
    console.log('hello' + this.node!.getFrameNode()!.isMinimized());
    return this.node!.getFrameNode();
  }
  makeNode2(uiContext: UIContext): FrameNode | null {
    this.node = new BuilderNode<ParamsInt>(uiContext,{enableMinimized:undefined});
    this.node!.build(wrapBuilder(buildGreenOnlyIfElse), new ParamsInt(-1))
    console.log('hello' + this.node!.getFrameNode()!.isMinimized());
    return this.node!.getFrameNode();
  }
}

@Entry
@Component
struct BuilderNodeAddBuilderProxyNode {
  @State judgeInt: int = 0;
  @State flag: boolean = true;
  private ifElseController: NodeControllerIfElse = new NodeControllerIfElse();

  build() {
    Column({space:5} as ColumnOptions) {
      Text('if/else NodeContainer').height(20)
      NodeContainer(this.ifElseController).height(50).backgroundColor('#2787D9').id('NodeContainerId')
      Button('++')
        .onClick(() => {
          this.judgeInt++;
          this.flag = !this.flag;
          this.ifElseController.node?.update(new ParamsInt(this.judgeInt));
        })
        .id('BuilderNodeAdd')
        .width(60)
        .height(20)
      Button('--')
        .onClick(() => {
          this.judgeInt--;
          this.flag = !this.flag;
          this.ifElseController.node?.update(new ParamsInt(this.judgeInt));
        })
        .id('BuilderNodeReduce')
        .width(60)
        .height(20)
    }.width('100%').height('100%')
  }
}