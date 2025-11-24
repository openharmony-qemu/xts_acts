/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { Entry, Text, Column, Component, Select, Font, Color } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { AppStorage } from '@ohos.arkui.stateManagement'


@Entry
@Component
struct SelectPage {
  @State optionValue: string = 'aaa'
  @State icon: string = "/resources/base/media/star_1.png"
  @State selected: int = 0
  @State selectValue: string = 'SelectButton'
  @State selectFont: Font = { size: 16, weight: 500 } as Font
  @State fontColor: Color = Color.Black
  @State selectedOptionBgColor: Color = Color.Grey
  @State selectedOptionFont: Font = { size: 16, weight: 400 } as Font
  @State selectedOptionFontColor: Color = Color.Red
  @State optionBgColor: Color = Color.White
  @State optionFont: Font = { size: 16, weight: 400 } as Font
  @State optionFontColor: Color = Color.Green
  @State indexValue: number = 0
  messageManager:MessageManager<string|int|Font|Color> = new MessageManager<string|int|Font|Color>()

  onPageShow() {
    console.info('SelectPage onPageShow')
    AppStorage.setOrCreate<MessageManager<string|int|Font|Color>>("messageManager", this.messageManager);
    let callback: (message: Message<string|int|Font|Color>)=>void = (message: Message<string|int|Font|Color>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'optionValue') {
        this.optionValue = (message as Message<string>).value
      }
      if (message.name == 'icon') {
        this.icon = (message as Message<string>).value
      }
      if (message.name == 'selected') {
        this.selected = (message as Message<int>).value
      }
      if (message.name == 'selectValue') {
        this.selectValue = (message as Message<string>).value
      }
      if (message.name == 'selectFont') {
        this.selectFont = (message as Message<Font>).value
      }
      if (message.name == 'fontColor') {
        this.fontColor = (message as Message<Color>).value
      }
      if (message.name == 'selectedOptionBgColor') {
        this.selectedOptionBgColor = (message as Message<Color>).value
      }
      if (message.name == 'selectedOptionFont') {
        this.selectedOptionFont = (message as Message<Font>).value
      }
      if (message.name == 'selectedOptionFontColor') {
        this.selectedOptionFontColor = (message as Message<Color>).value
      }
      if (message.name == 'optionBgColor') {
        this.optionBgColor = (message as Message<Color>).value
      }
      if (message.name == 'optionFont') {
        this.optionFont = (message as Message<Font>).value
      }
      if (message.name == 'optionFontColor') {
        this.optionFontColor = (message as Message<Color>).value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Text('indexValue:' + this.indexValue).fontSize(18).margin(15).key('indexValue')
      Select([{ value: this.optionValue, icon: this.icon },
              { value: 'bbb', icon: "/resources/base/media/star_1.png" },
              { value: 'ccc', icon: "/resources/base/media/star_1.png" }])
        .selected(this.selected)
        .value(this.selectValue)
        .font(this.selectFont)
        .key('select')
        .fontColor(this.fontColor)
        .selectedOptionBgColor(this.selectedOptionBgColor)
        .selectedOptionFont(this.selectedOptionFont)
        .selectedOptionFontColor(this.selectedOptionFontColor)
        .optionBgColor(this.optionBgColor)
        .optionFont(this.optionFont)
        .optionFontColor(this.optionFontColor)
        .onSelect((index: int) :void => {
          this.indexValue = index
          console.info('Select:' + index)
        })
    }.width('100%')
  }
}