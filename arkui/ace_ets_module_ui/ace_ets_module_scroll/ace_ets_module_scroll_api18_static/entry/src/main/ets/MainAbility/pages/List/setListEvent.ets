/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import {
  Entry,
  Text,
  LazyForEach,
  Column,
  Component,
  LazyVGridLayout,
  ClickEvent,
  WaterFlow,
  TextAlign,
  Button,
  Axis,
  ScrollState,
  VisibleListContentInfo,
  BarState,
  EdgeEffect,
  List,
  NodeContainer,
  Color,
  ScrollResult,
  ScrollSource,
  ListItem,
  OnScrollFrameBeginHandlerResult
} from '@ohos.arkui.component'
import { State, LocalStorage } from '@ohos.arkui.stateManagement'
import { FrameNode, typeNode } from '@ohos.arkui.node'
import { UIContext } from '@ohos.arkui.UIContext';












class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode?.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  }

  resetEvent(frameNode: FrameNode) {
    
    
    
    
    
    
    
    
    
    
  }
}

@Entry
@Component
struct setOnListIndex02 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: number = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';
  @State text4: string = 'start';

  build() {
    Column() {
      Button('reset CommonEvent to List')
        .height('5%')
        .onClick((e: ClickEvent) => {
          
        })
      Button('add CommonEvent to List')
        .id('List_addCommonEvent_02')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling()!)
        })
      Text(this.text)
        .id('List_setOnWill_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text1)
        .id('List_setOnReach_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text2)
        .id('List_setOnScroll_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text3)
        .id('List_setOnScrollIndex_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text4)
        .id('Scroll_VisibleChange_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      List() {
        ListItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        ListItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        ListItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
      }
      .height('50%')
      .id('key_listItem_set')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOff: number, scrollState: ScrollState, scrollSource: ScrollSource): ScrollResult => {
        console.log(`List:: onWillScroll 1 scrollOff=${scrollOff}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((scrollOff: number, scrollState: ScrollState) => {
        console.log(`List:: onDidScroll 1  scrollOff=${scrollOff}, scrollState=${scrollState}`)
      })
      .onReachStart(() => {
        console.log(`List:: onReachStart 1 `)
      })
      .onReachEnd(() => {
        console.log(`List:: onReachEnd 1 `)
      })
      .onScrollStart(() => {
        console.log(`List:: onScrollStart 1 `)
      })
      .onScrollStop(() => {
        console.log(`List:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((off: number, state: ScrollState): OnScrollFrameBeginHandlerResult => {
        console.log(`List:: onScrollFrameBegin 1 off=${off}, state=${state}`)
        return { offsetRemain: 0 } as OnScrollFrameBeginHandlerResult;
      })
      .onScrollIndex((start: int, end: int, center: int) => {
        console.log(`List:: onScrollIndex 1 start=${start}, end=${end}, center=${center}`)
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        console.log(`List:: onScrollVisibleContentChange 1 start=${start}, end=${end}`)
      })

      NodeContainer(this.myNodeController)
    }.width('100%')
  }
}