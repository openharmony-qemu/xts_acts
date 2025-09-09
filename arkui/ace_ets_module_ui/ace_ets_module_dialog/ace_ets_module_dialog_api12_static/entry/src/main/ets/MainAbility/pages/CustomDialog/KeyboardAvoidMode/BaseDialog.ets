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
import {  PromptAction } from '@ohos.arkui.UIContext'
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,TextInput,KeyboardAvoidMode,wrapBuilder,
  PickerTextStyle, CalendarAlign, Date, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,ComponentContent
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
let customDialogId: number = 0
let promptAction = new PromptAction()
class Params {
  text: string = ""

  constructor(text: string) {
    this.text = text
  }
}
@Builder
function BaseDialog_CustomDialogExample(params: Params) {
  Column() {
    Text('可展示在主窗口外的弹窗')
      .fontSize(30)
      .height(100)
    TextInput()
      .id('TextInput')
    Button('点我关闭弹窗')
      .onClick(():void => {
        promptAction.closeCustomDialog(customDialogId)
      })
      .id('close')
      .backgroundColor(Color.Red)
      .margin(20)
    TextInput()
    TextInput()
    Text('可展示在主窗口外的弹窗')
      .fontSize(30)
      .height(100)
    TextInput()

    Button('点我关闭弹窗')
      .onClick(():void => {
        promptAction.closeCustomDialog(customDialogId)
      })
      .margin(20)
    TextInput()
    Text('可展示在主窗口外的弹窗')
      .fontSize(30)
      .height(100)
    TextInput()
    Button('点我关闭弹窗')
      .onClick(():void => {
        promptAction.closeCustomDialog(customDialogId)
      })
      .margin(20)
    TextInput()
    Text('可展示在主窗口外的弹窗')
      .fontSize(30)
      .height(100)
    TextInput()
  }.size({ width: 350, height: 600 }).backgroundColor(Color.Gray)
}

@Entry
@Component
struct BaseDialog_CustomDialogUser {
  @State message: string = 'hello'
  @State mText1: string = ''
  @State mText2: string = ''
  @State keyboardAvoidMode1: number | undefined = 0
  @State keyboardAvoidMode2: number | undefined = 1

  build() {
    Row() {
      Column() {
        Text(this.mText1)
          .id('text1')
        Button('DEFAULT')
          .id('btn1')
          .onClick(():void => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            // let contentNode = new ComponentContent(uiContext, wrapBuilder(BaseDialog_CustomDialogExample), new Params(this.message));
            // promptAction.openCustomDialog(contentNode, {
            //   keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
            // })
            this.mText1 = this.keyboardAvoidMode1 + ''
            setTimeout(():void => {
              // promptAction.closeCustomDialog(contentNode)
            }, 1000)
          }).backgroundColor(0x317aff)

        Text(this.mText2)
          .id('text2')
        Button('NONE')
          .id('btn2')
          .onClick(():void => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            // let contentNode = new ComponentContent(uiContext, wrapBuilder(BaseDialog_CustomDialogExample), new Params(this.message));
            // promptAction.openCustomDialog(contentNode, {
            //   keyboardAvoidMode: KeyboardAvoidMode.NONE,
            // })
            this.mText2 = this.keyboardAvoidMode2 + ''
            setTimeout(():void => {
              // promptAction.closeCustomDialog(contentNode)
            }, 1000)
          }).backgroundColor(0x317aff)
      }.width('100%')
    }.height('100%')
  }
}