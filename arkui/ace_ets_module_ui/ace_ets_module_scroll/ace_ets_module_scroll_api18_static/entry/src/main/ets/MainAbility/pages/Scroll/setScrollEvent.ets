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

import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ClickEvent,
  Scroller,
  Color,
  Alignment,
  Stack,
  WaterFlow,
  OnScrollFrameBeginHandlerResult,
  LazyForEach,
  FlowItem,
  Image,
  TextAlign,
  ImageFit,
  ScrollState,
  ScrollSource,
  Scroll,
  NodeContainer,
  OffsetResult,
  EdgeEffect,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  BorderStyle,
  Search
} from '@ohos.arkui.component'
import { LocalStorage, State } from '@ohos.arkui.stateManagement'
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext'

let para: Record<string, string> = { 'Scroll_setOnWillScroll': 'start', 'Scroll_setOnDidScroll': 'start' };

let para1: Record<string, string> = { 'Scroll_setOnReachStart': 'start', 'Scroll_setOnReachEnd': 'start' };

let para2: Record<string, string> = { 'Scroll_setOnScrollStart': 'start', 'Scroll_setOnScrollStop': 'start' };

let para3: Record<string, string> = { 'Scroll_setOnScrollFrameBegin': 'start' };



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
}

@Entry
@Component
struct setOnScrollIndex03 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: number = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';

  build() {
    Column() {
      Button('add CommonEvent to Text')
        .id('Scroll_addCommonEvent_03')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling()!)
        })
      Text(this.text)
        .id('Scroll_setOnWill_03')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text1)
        .id('Scroll_setOnReach_03')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text2)
        .id('Scroll_setOnScroll_03')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text3)
        .id('Scroll_setOnFrameBegin_03')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Scroll() {
        Column() {
          Column()
            .borderWidth(2)
            .width('100%')
            .height('50%')
          Column()
            .borderWidth(2)
            .width('100%')
            .height('50%')
          Column()
            .borderWidth(2)
            .width('100%')
            .height('50%')
        }
      }
      .height('50%')
      .id('key_ScrollItem_set')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOffx: number, scrollOffy: number, scrollState: ScrollState,
        scrollSource: ScrollSource): undefined | OffsetResult => {
        console.log(`Scroll:: onWillScroll 1 scrollOffx=${scrollOffx}, scrollOffy=${scrollOffy}scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((xOffset: number, yOffset: number, scrollState: ScrollState): void => {
        console.log(`Scroll:: onDidScroll 1  xOffset=${xOffset},yOffset=${yOffset}, scrollState=${scrollState}`)
      })
      .onReachStart(() => {
        console.log(`Scroll:: onReachStart 1 `)
      })
      .onReachEnd(() => {
        console.log(`Scroll:: onReachEnd 1 `)
      })
      .onScrollStart(() => {
        console.log(`Scroll:: onScrollStart 1 `)
      })
      .onScrollStop(() => {
        console.log(`Scroll:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((offset: number, state: ScrollState): OnScrollFrameBeginHandlerResult => {
        console.log(`Scroll:: onScrollFrameBegin 1 offset=${offset}, state=${state}`)
        return { offsetRemain: offset };
      })

      NodeContainer(this.myNodeController)
    }.width('100%')
  }
}