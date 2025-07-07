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
import { GlobalContext } from './../../../common/GlobalContext';
import { ValueT } from './../../../common/Value';
import { MessageManager, Callback, Message } from './../../../common/MessageManager';
import { Entry, Component, Column, FlexAlign, HorizontalAlign, ColumnOptions, Text } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

type MessageData = HorizontalAlign

@Entry
@Component
struct Column_AlignItems_ChangeParent {
  @State testAlignItems: HorizontalAlign = HorizontalAlign.Center
  messageManager: MessageManager<MessageData> = new MessageManager<MessageData>()
  private content: string = "Column_AlignItems_ChangeParent Page"
  onPageShow() {
    console.info('Column_AlignItems_ChangeParent page show called');
    let value: ValueT<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value, Type.from<ValueT<MessageData>>());
    let callback: Callback<MessageData> = (message: Message<MessageData>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'alignItems') {
        this.testAlignItems = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('Column_AlignItems_ChangeParent page build done called');
  }

  build() {
    Column({space:30} as ColumnOptions) {
      Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('AlignItems_Test1')
      Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('AlignItems_Test2')
      Column(){Text('3')}.width(300).height(150).backgroundColor(0xffa500).key('AlignItems_Test3')
    }.key('ColumnAlignItemsChange1').width(350).height(400).backgroundColor(0xAFEEEE).alignItems(this.testAlignItems)
  }
}