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
  Entry,Color,OnScrollFrameBeginHandlerResult,
  Component,
  Scroller,
  ScrollState,
  Column,
  ClickEvent,
  Button,
  FlexDirection,
  WaterFlow,
  LazyForEach,
  ColumnOptions,
  FlowItem,
  Padding,
  Text,
  BarState,
  TextAlign,
  Builder,
  FontWeight,
  UIContext,
  wrapBuilder,
  LocalStorage,ScrollResult,
  ScrollSource,
  EdgeEffect,
} from '@ohos.arkui.component';

import { State } from '@ohos.arkui.stateManagement';












class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode?.commonAttribute.width(100)
      .height(100)
      
    return this.rootNode;
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

@Entry
@Component
struct setOnWaterFlowIndex04 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: number = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';

  build() {
    Column() {
      Button('add CommonEvent to Text')
        .id('WaterFlow_addCommonEvent_04')
        .height('5%')
        
        
        
        
      Text(this.text)
        .id('WaterFlow_setOnWill_04')
        .height('5%')
        .fontWeight(700)
        
        .onClick((e: ClickEvent) => {
          
          
        })
      Text(this.text1)
        .id('WaterFlow_setOnReach_04')
        .height('5%')
        .fontWeight(700)
        
        .onClick((e: ClickEvent) => {
          
          
        })
      Text(this.text2)
        .id('WaterFlow_setOnScroll_04')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
          
        })
      Text(this.text3)
        .id('WaterFlow_setOnScrollIndex_04')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
          
        })
      WaterFlow() {
        FlowItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        FlowItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        FlowItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
      }
      .height('50%')
      .id('key_WaterFlow_set')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOff: number, scrollState: ScrollState, scrollSource: ScrollSource): ScrollResult  => {
        console.log(`WaterFlow:: onWillScroll 1 scrollOff=${scrollOff}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((scrollOff: number, scrollState: ScrollState): void => {
        console.log(`WaterFlow:: onDidScroll 1  scrollOff=${scrollOff}, scrollState=${scrollState}`)
      })
      .onReachStart((): void => {
        console.log(`WaterFlow:: onReachStart 1 `)
      })
      .onReachEnd((): void => {
        console.log(`WaterFlow:: onReachEnd 1 `)
      })
      .onScrollStart((): void => {
        console.log(`WaterFlow:: onScrollStart 1 `)
      })
      .onScrollStop(() => {
        console.log(`WaterFlow:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((off: number, state: ScrollState):OnScrollFrameBeginHandlerResult => {
        console.log(`WaterFlow:: onScrollFrameBegin 1 off=${off}, state=${state}`)
        
      })
      .onScrollIndex((first: int, last: int): void => {
        console.log(`WaterFlow:: onScrollIndex 1 start=${first}, end=${last}`)
      })
      
    }.width('100%')
  }
}