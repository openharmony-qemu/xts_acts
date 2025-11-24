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
import {
  Entry,
  Component,
  ClickEvent,
  InputType,
  Color,
  Font,
  EnterKeyType,
  CopyOptions,
  TextInputStyle,
  TextAlign,
  TextInputController,
  Column,
  EnterKeyType,
  TextInput,
  Text,
  Button
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { MessageManager, Callback,Message } from '../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TextInputPage {
  @State placeholder: string = 'input your word...'
  @State type: InputType = InputType.Email
  @State placeholderColor : Color = Color.Grey
  @State placeholderFont : Font = { size: 14, weight: 400 } as Font
  @State enterKeyType: EnterKeyType = EnterKeyType.Search
  @State caretColor: Color = Color.Blue
  @State maxLength: int = 10
  @State copyOption: CopyOptions = CopyOptions.InApp
  @State showPasswordIcon: boolean = false
  @State style: TextInputStyle = TextInputStyle.Default
  @State textAlign: TextAlign = TextAlign.Center
  @State text: string = 'onChange'
  @State onSubmit: string = ''
  @State onEditChange: string = ''
  @State onCopy: string = ''
  @State onCut: string = ''
  @State onPaste: string = ''
  controller: TextInputController = new TextInputController()
  messageManager:MessageManager<string|InputType|Color|Font|EnterKeyType|int|boolean|TextInputStyle|TextAlign|number> = new MessageManager<string|number|InputType|Color|Font|EnterKeyType|int|boolean|TextInputStyle|TextAlign>()

  onPageShow() {
    console.info('TextInput onPageShow')
    AppStorage.setOrCreate<MessageManager<string|InputType|Color|Font|EnterKeyType|int|boolean|TextInputStyle|TextAlign|number>>("messageManager", this.messageManager);

    let callback: (message: Message<string|InputType|Color|Font|EnterKeyType|int|boolean|TextInputStyle|TextAlign|number>) => void = (message: Message<string|number|InputType|Color|Font|EnterKeyType|int|boolean|TextInputStyle|TextAlign>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'placeholder') {
        this.placeholder = (message as Message<string>).value
      }
      if (message.name == 'text') {
        this.text = (message as Message<string>).value
      }
      if (message.name == 'type') {
        this.type = (message as Message<InputType>).value
      }
      if (message.name == 'placeholderColor') {
        this.placeholderColor = (message as Message<Color>).value
      }
      if (message.name == 'placeholderFont') {
        this.placeholderFont = (message as Message<Font>).value
      }
      if (message.name == 'enterKeyType') {
        this.enterKeyType = (message as Message<EnterKeyType>).value
      }
      if (message.name == 'caretColor') {
        this.caretColor = (message as Message<Color>).value
      }
      if (message.name == 'maxLength') {
        this.maxLength = (message as Message<int>).value
      }
      if (message.name == 'copyOption') {
        this.copyOption = (message as Message<CopyOptions>).value
      }
      if (message.name == 'showPasswordIcon') {
        this.showPasswordIcon = (message as Message<boolean>).value
      }
      if (message.name == 'style') {
        this.style = (message as Message<TextInputStyle>).value
      }
      if (message.name == 'textAlign') {
        this.textAlign = (message as Message<TextAlign>).value
      }
      if (message.name == 'onSubmit') {
        this.onSubmit = (message as Message<string>).value
      }
      if (message.name == 'onEditChange') {
        this.onEditChange = (message as Message<string>).value
      }
      if (message.name == 'onCopy') {
        this.onCopy = (message as Message<string>).value
      }
      if (message.name == 'onCut') {
        this.onCut = (message as Message<string>).value
      }
      if (message.name == 'onPaste') {
        this.onPaste = (message as Message<string>).value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      TextInput({ placeholder: this.placeholder, controller: this.controller })
        .type(this.type)
        .placeholderColor(this.placeholderColor)
        .placeholderFont(this.placeholderFont)
        .enterKeyType(this.enterKeyType)
        .caretColor(this.caretColor)
        .maxLength(this.maxLength)
        .copyOption(this.copyOption)
        .showPasswordIcon(this.showPasswordIcon)
        .style(this.style)
        .textAlign(this.textAlign)
        .key('textInput')
        .width(400)
        .height('5%')
        .fontSize(14)
        .fontColor(Color.Black)
        .onChange((value: string):void => {
          this.text = value
        })
        .onSubmit((enterKey: EnterKeyType) :void=> {
          this.onSubmit = enterKey.toString()
        })
        .onEditChange((isEditing: boolean) :void=> {
          this.onEditChange = String(isEditing)
        })
        .onCopy((value: string) :void=> {
          this.onCopy = value
        })
        .onCut((value: string)  :void=> {
          this.onCut = value
        })
        .onPaste((value: string) : void=> {
          this.onPaste = value
        })
      Text(this.text).fontSize(10).key('text').height('5%')
      Button('Set caretPosition 1')
        .key('button')
        .onClick((e:ClickEvent) => {
          // 将光标移动至第一个字符后
          this.controller.caretPosition(1)
        })
        .height('5%')
      // 密码输入框
      TextInput({ placeholder: 'input your password...' })
        .key('password')
        .width(400)
        .height('5%')
        .type(InputType.Password)
        .maxLength(9)
        .showPasswordIcon(true)
      // 内联风格输入框
      TextInput({ placeholder: 'inline style' })
        .key('input')
        .width(400)
        .height('5%')
        .borderRadius(0)
        .style(TextInputStyle.Inline)
      Text('onSubmit:' + this.onSubmit).fontSize(10).margin(1).key('submit').height('5%')
      Text('onEditChange:' + this.onEditChange).fontSize(10).margin(1).key('editChange').height('5%')
      Text('onCopy:' + this.onCopy).fontSize(10).margin(1).key('copy').height('5%')
      Text('onCut:' + this.onCut).fontSize(10).margin(1).key('cut').height('5%')
      Text('onPaste:' + this.onPaste).fontSize(10).margin(1).key('paste').height('5%')
    }.width('100%')
  }
}