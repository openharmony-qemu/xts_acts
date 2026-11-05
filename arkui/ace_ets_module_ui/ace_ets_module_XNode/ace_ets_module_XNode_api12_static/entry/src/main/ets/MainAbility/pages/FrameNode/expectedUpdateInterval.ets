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

import { NodeController, FrameNode } from '@ohos.arkui.node';
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
  NodeContainer
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

export class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode?.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink)
    return this.rootNode
  }

  addCommonEvent(frameNode: FrameNode, ratios: Array<number>, expectedUpdateInterval?: int): void {
    frameNode.commonEvent.setOnVisibleAreaApproximateChange({
      ratios, expectedUpdateInterval: expectedUpdateInterval as int
    }, (isVisible: boolean, currentRatio: number):void => {
      console.info('Test FrameNode isVisible:' + isVisible + ', currentRatio:' + currentRatio)
      if(isVisible && currentRatio >= 1.0) {
        console.info('Test FrameNode is fully visible')
      }
      if(!isVisible && currentRatio >= 0.0) {
        console.info('Test FrameNode is completely invisible')
      }
    })
  }

  resetCommonEvent(buttonNode: FrameNode): void {
    buttonNode.commonEvent.setOnVisibleAreaApproximateChange({ ratios: [] }, undefined);
  }
}

@Entry
@Component
struct FrameNodeTypeTest {
  @State index: number = 0
  @State ratios: Array<number> = new Array<number>()
  @State expectedUpdateInterval: number | undefined = undefined
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({space:2} as ColumnOptions) {
      Text(`expectedUpdateInterval : ${this.expectedUpdateInterval ? this.expectedUpdateInterval : "undefined"}`)
        .id("expectedUpdateIntervalValue")
        .height(15)
      Column() {
          Text("This is A TextNode")
            .borderWidth(1)
            .height(15)
            .backgroundColor(0x70FF0000)
            .onVisibleAreaChange([0, 0.5, 1], (isVisible: boolean, currentRatio: number): void=> {
              if(isVisible && currentRatio >= 1.0) {
                console.info('Test Text is fully visible.')
              }
              if(!isVisible && currentRatio <= 0.0) {
                console.info('Test Text is completely invisible.')
              }
            })
          NodeContainer(this.myNodeController)
            .borderWidth(1)
            .width(200)
            .height(100)

          Button("ADD commonEvent to FrameNode change expectedUpdateInterval")
            .id("expectedUpdateInterval")
            .height(15)
            .onClick((e:ClickEvent) => {
              this.ratios = [0, 0.6, 0.8, 1.0];
              this.expectedUpdateInterval = 2000;
              this.myNodeController.addCommonEvent(this.myNodeController.rootNode!, [0, 0.6, 0.8, 1.0], 2000);
            })
          Button("Reset commonEvent to FrameNode")
            .onClick((e:ClickEvent) => {
              this.myNodeController.resetCommonEvent(this.myNodeController.rootNode!)
            })
            .height(15)
        }
    }.width("100%").height('100%')
  }
}