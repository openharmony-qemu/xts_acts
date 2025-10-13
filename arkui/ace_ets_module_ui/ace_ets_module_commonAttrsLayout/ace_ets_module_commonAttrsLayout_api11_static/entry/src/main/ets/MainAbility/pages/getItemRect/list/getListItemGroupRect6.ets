/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Callback, Message, MessageManager } from '../../../common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import {
  Alignment,
  Axis,
  BarState,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  EdgeEffect,
  Entry,
  FlexAlign,
  ForEach,
  Grid,
  GridItem,
  Image,
  ImageSize,
  List,
  ListItem,
  ListItemGroup,
  ListScroller,
  Padding,
  Position,
  Row,
  SizeOptions,
  Text,
  TextAlign,
  Visibility
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct getListItemGroupRect6 {
  @State arr: string[] = ['0', '1', '2', '3']
  @State space1: number = 20
  @State space2: number = 0
  @State index: number = 0
  @State indexInGroup: number = 4
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0
  messageManager: MessageManager<number> = new MessageManager<number>()
  private listScroller: ListScroller = new ListScroller()

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '个')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  @Builder
  itemEnd() {
    Row() {
      Button('Delete').margin('4vp')
      Button('Set').margin('4vp')
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly).width(0).height(0)
  }

  onPageShow() {
    console.info('getListItemGroupRect6 onPageShow');


    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value;
      } else if (message.name == 'indexInGroup') {
        this.indexInGroup = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.listScroller.getItemRectInGroup(Double.toInt(this.index), Double.toInt(this.indexInGroup)).x
        this.y = this.listScroller.getItemRectInGroup(Double.toInt(this.index), Double.toInt(this.indexInGroup)).y
        this.width1 = this.listScroller.getItemRectInGroup(
          Double.toInt(this.index), Double.toInt(this.indexInGroup)).width
        this.height1 = this.listScroller.getItemRectInGroup(
          Double.toInt(this.index), Double.toInt(this.indexInGroup)).height
      }).id('getListItemGroupRect6_button')
      Text('' + this.x).key('getListItemGroupRect6_text1')
      Text('' + this.y).key('getListItemGroupRect6_text2')
      Text('' + this.width1).key('getListItemGroupRect6_text3')
      Text('' + this.height1).key('getListItemGroupRect6_text4')

      List({ space: this.space1, initialIndex: 0, scroller: this.listScroller }) {


      }
      .key('getListItemGroupRect6_list_1')
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .width(300)
      .height(500)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .margin(5)
  }
}
