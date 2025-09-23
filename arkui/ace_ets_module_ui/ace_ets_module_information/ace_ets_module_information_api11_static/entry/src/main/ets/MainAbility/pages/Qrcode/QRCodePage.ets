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
import {MessageManager,Callback, Message} from '../../common/MessageManager';
import { Entry, Component, Column, Flex, Text, QRCode, FlexDirection, ItemAlign, FlexAlign, FontWeight, ColumnOptions, Margin, ClickEvent, Color} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct QRCodePage {
  @State value: string = 'normal'
  @State color : Color = Color.Black
  @State backColor : Color = Color.White
  @State text : string = 'unclick'
  messageManager:MessageManager<object> = new MessageManager<object>()

  onPageShow() {
    console.info('QRCodePage onPageShow')
    
    AppStorage.setOrCreate<object>('messageManager', this.messageManager)
    let callback:Callback<object> = (message:Message<object>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'QRCodeValue') {
        this.value = message.value as string
      }
      if (message.name == 'QRCodeColor') {
        this.color = message.value as Color
      }
      if (message.name == 'backgroundColor') {
        this.backColor = message.value as Color
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.text).fontSize(20).key('text')
      Text('normal').fontSize(9).width('90%').fontColor(0xCCCCCC).fontSize(30)
      QRCode(this.value).width(200).height(200).key('qr')
        .onClick((event: ClickEvent) => {
          this.text = 'click succ'
          console.info('Click succ, event: ' + event.toString())
        })

      Text('color').fontSize(9).width('90%').fontColor(0xCCCCCC).fontSize(30)
      QRCode(this.value).color(this.color).width(200).height(200).key('qr1')

      Text('backgroundColor').fontSize(9).width('90%').fontColor(0xCCCCCC).fontSize(30)
      QRCode(this.value).width(200).height(200).backgroundColor(this.backColor).key('qr2')

      QRCode(this.value).width(200).height(200)
        .color(0xFF000000)
        .backgroundColor(0xFFFFFFFF)
        .key('qrDefault')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}