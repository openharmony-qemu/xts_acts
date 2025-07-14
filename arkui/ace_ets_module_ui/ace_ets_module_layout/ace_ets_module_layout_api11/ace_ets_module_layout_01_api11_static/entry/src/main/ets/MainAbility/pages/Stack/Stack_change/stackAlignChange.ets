/**
 * Copyright (c) 2025 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { MessageManager, Callback, Message } from '../../../common/MessageManager';
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView,Image,ImageFit, Scroller,
  Scroll,Flex,Stack,StackOptions,
  ForEach,
  Search,Grid,GridItem,
  SafeAreaType,Margin,
  ScrollDirection,FlexDirection,
  BarState,GridColColumnOption,TextAlign,TextOverflow,
  Color,GridColOptions,GridCol,BreakpointsReference,ItemAlign,FlexAlign,Alignment,
  EdgeEffect,ColumnOptions,HorizontalAlign,GridRowOptions,GridRow,GutterOption,BreakPoints,GridRowDirection } from '@ohos.arkui.component';
import {State,
  MutableState,
  stateOf,
  observableProxy,
  AppStorage} from '@ohos.arkui.stateManagement';

@Entry
@Component
struct StackAlignChange {
  @State testAlignContentValue: number = Alignment.TopStart
  @State testAlignValue: number = Alignment.TopStart
  messageManager: MessageManager<number> = new MessageManager<number>()
  private content: string = "StackAlignChange Page";

  onPageShow() {
    console.info('StackAlignChange onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager, Type.from<number>());
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'alignContent') {
        this.testAlignContentValue = message.value;
      }
      if (message.name == 'align') {
        this.testAlignValue = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('StackAlignChange page build done called');
  }

  build() {
    Column() {
      Stack({ alignContent: this.getAlignment(this.testAlignContentValue) } as StackOptions) {
        Text('1').width(200).height(200).backgroundColor(0xF5DEB3).key('stackTopStartKey01')
        Text('2').width(100).height(100).backgroundColor(0xD2B48C).key('stackTopStartKey02')
      }
      .width(300)
      .height(300)
      .backgroundColor(0xAFEEEE)
      .align(this.getAlignment(this.testAlignValue))
      .key('stackTopStartKey')
    }.alignItems(HorizontalAlign.Start)
  }

  private getAlignment(content:number):Alignment{
    if(content == 0){
      return Alignment.TopStart;
    }else if(content == 1){
      return Alignment.Top;
    }else if(content == 2){
      return Alignment.TopEnd;
    }else if(content == 3){
      return Alignment.Start;
    }else if(content == 4){
      return Alignment.Center;
    }else if(content == 5){
      return Alignment.End;
    }else if(content == 6){
      return Alignment.BottomStart;
    }else if(content == 7){
      return Alignment.Bottom;
    }else{
      return Alignment.BottomEnd;
    }
  }
}
