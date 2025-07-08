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
import { GlobalContext } from '../../../common/GlobalContext';
import { Value1 } from '../../../common/Value';
import { MessageManager, Callback,Message } from '../../../common/MessageManager';
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView,Image,ImageFit, Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,ColumnOptions } from '@ohos.arkui.component';
import {State,
  MutableState,
  stateOf,
  observableProxy,
  AppStorage} from '@ohos.arkui.stateManagement';

type MessageData = number

@Entry
@Component
struct Column_Padding_ChangeParent {
  @State testPadding: number = 0
  messageManager: MessageManager<MessageData> = new MessageManager<MessageData>()
  private content: string = "Column_Padding_ChangeParent Page"
  onPageShow() {
    console.info('Column_Padding_ChangeParent page show called');
    let value: Value1<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = (message: Message<MessageData>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'padding') {
        this.testPadding = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('Column_Padding_ChangeParent page build done called');
  }

  build() {
    Column({space:30} as ColumnOptions) {
      Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('Padding_Test1')
      Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('Padding_Test2')
      Column(){Text('3')}.width(300).height(150).backgroundColor(0xffa500).key('Padding_Test3')
    }.key('ColumnPaddingChange1').width(350).height(400).backgroundColor(0xAFEEEE).padding(this.testPadding)
  }
}