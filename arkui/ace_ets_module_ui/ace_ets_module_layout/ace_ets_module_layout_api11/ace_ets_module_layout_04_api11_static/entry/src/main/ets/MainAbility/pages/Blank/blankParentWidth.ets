/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { GlobalContext } from './../../common/GlobalContext';
import { ValueT } from './../../common/Value';
import { MessageManager, Callback, Message } from './../../common/MessageManager';
import { Entry, Component, Column, Row, Text, Blank, Toggle, ToggleType, Color, Margin } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

type MessageData = string

@Entry
@Component
struct BlankParentWidth {
  @State colorString : string = "#fc7fae53"
  @State minWith: string = '120'
  messageManager:MessageManager<MessageData> = new MessageManager<MessageData>()

  onPageShow() {
    console.info('blankParentWidth onPageShow')
    let value: ValueT<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value, Type.from<ValueT<MessageData>>());
    let callback: Callback<MessageData> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'blankColor') {
          this.colorString = message.value
      }
      if (message.name == 'minWith') {
          this.minWith = message.value
      }
      
    }
    this.messageManager.registerCallback(callback)

  }
  
  build() {
    Column() {
      Row() {
        Text('Bluetooth').fontSize(18).key('text')
        Blank().key('blankUIJsunit_blank')
        Toggle({ type: ToggleType.Switch }).key('toggle')
      }.width('100%').backgroundColor(0xFFFFFF).borderRadius(15).padding({ left: 12 } as Margin).id('row')

      Row() {
        Text('Bluetooth01').fontSize(18).key('text1')
        Blank().color(Color.Yellow).key('bl1')
        Toggle({ type: ToggleType.Switch }).key('toggle1')
      }.backgroundColor(0xFFFFFF).borderRadius(15).padding({ left: 12 } as Margin).margin({top:60} as Margin)

      Row() {
        Text('Bluetooth02').fontSize(18)
        // 设置最小宽度为160
        Blank(this.minWith).color(this.colorString).key('bl2')
        Toggle({ type: ToggleType.Switch })
      }.backgroundColor(0xFFFFFF).borderRadius(15).padding({ left: 12 } as Margin).margin({top:60} as Margin)

    }.backgroundColor(0xEFEFEF).padding(20)
    
  }
}