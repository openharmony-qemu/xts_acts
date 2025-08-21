/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ColorMetrics, ComponentContent } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { BuilderNode, FrameNode, NodeController, RenderNode, typeNode } from '@ohos.arkui.node'
import {
  $r,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FontWeight,
  HorizontalAlign,
  Margin,
  NodeContainer,
  Position,
  ResourceColor,
  Row,
  Scroll,
  ScrollDirection,
  Scroller,
  Stack,
  Text,
  Visibility,
  wrapBuilder,
  WrappedBuilder
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

const TEST_TAG: string = 'FrameNode '

class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList: FrameNode[] = [];
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private childrenCount: number = 0;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.uiContext = uiContext;

    this.frameNode = new FrameNode(uiContext);
    this.frameNode?.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode?.commonAttribute.size({ width: 100, height: 100 });

    this.rootNode?.appendChild(this.frameNode!);
    this.childrenCount = this.childrenCount + 1;
    for (let i = 0; i < 10; i++) {
      let childNode = new FrameNode(uiContext);
      this.childList.push(childNode);
      this.frameNode?.appendChild(childNode);
    }
    return this.rootNode;
  }

  setCrossLanguageOptions() {
    let errorCode: string = '';
    console.log(TEST_TAG + ' getCrossLanguageOptions ' + JSON.stringify(this.frameNode?.getCrossLanguageOptions()));
    try {
      this.frameNode?.setCrossLanguageOptions({ attributeSetting: true });
      console.log(TEST_TAG + ' setCrossLanguageOptions success.');
    } catch (err) {
      errorCode = (err as BusinessError).code + '';
      console.log(TEST_TAG + '' + (err as BusinessError).code + ' : ' + (err as BusinessError).message);
    }
    console.log(TEST_TAG + ' getCrossLanguageOptions ' + JSON.stringify(this.frameNode?.getCrossLanguageOptions()));
    return errorCode;
  }
}

@Entry
@Component
struct SetCrossLanguageOptionsText {
  @State errorCode: string = '99999';
  private myNodeController: MyNodeController = new MyNodeController();
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .height('30%')
        Text(`${this.errorCode}`).height('10%').id('error_code_id')
        Button('setCrossLanguageOptions')
          .id('setCrossLanguageOptions_id')
          .height('10%')
          .onClick((e: ClickEvent) => {
            this.errorCode = this.myNodeController.setCrossLanguageOptions();
          })
      }
      .width('100%')
      .height('100%')
    }
    .scrollable(ScrollDirection.Vertical)
  }
}