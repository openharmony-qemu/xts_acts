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
import { LocalStorage, State } from '@ohos.arkui.stateManagement'
import { UIContext } from "@ohos.arkui.UIContext";
import { NodeController, FrameNode } from '@ohos.arkui.node';
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Image,
  ImageFit,
  Scroller,
  Scroll,
  FontWeight,
  TextArea,
  ScrollState,
  ScrollSource,
  ForEach,
  NodeContainer,
  Grid,
  GridItem,
  ScrollResult,
  OnScrollFrameBeginHandlerResult,
  OnScrollFrameBeginHandlerResult,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  HorizontalAlign,
  FlexAlign
} from '@ohos.arkui.component'
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



























































@Entry
@Component
struct setOnGridIndex01 {
  
  @State index: number = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';

  build() {
    Column() {
      Button('add CommonEvent to Text')
        .id('Grid_addCommonEvent_01')
        .height('5%')
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text)
        .id('Grid_setOnWill_01')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text1)
        .id('Grid_setOnReach_01')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text2)
        .id('Grid_setOnScroll_01')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Text(this.text3)
        .id('Grid_setOnScrollIndex_01')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          
        })
      Grid() {
        GridItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        GridItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        GridItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
      }
      .height('50%')
      .id('key_gridItem_set')
      .columnsTemplate('1r')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOff: number, scrollState: ScrollState, scrollSource: ScrollSource): ScrollResult => {
        console.log(`Grid:: onWillScroll 1 scrollOff=${scrollOff}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((scrollOff: number, scrollState: ScrollState): void => {
        console.log(`Grid:: onDidScroll 1  scrollOff=${scrollOff}, scrollState=${scrollState}`)
      })
      .onReachStart((): void => {
        console.log(`Grid:: onReachStart 1 `)
      })
      .onReachEnd((): void => {
        console.log(`Grid:: onReachEnd 1 `)
      })
      .onScrollStart((): void => {
        console.log(`Grid:: onScrollStart 1 `)
      })
      .onScrollStop((): void => {
        console.log(`Grid:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((offset: number, state: ScrollState): OnScrollFrameBeginHandlerResult => {
        console.log(`Grid:: onScrollFrameBegin 1 off=${offset}, state=${state}`)
        
      })
      .onScrollIndex((first: number, last: number): void => {
        console.log(`Grid:: onScrollIndex 1 start=${first}, end=${last}`)
      })

      
    }.width('100%')
  }
}
