'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Entry, Text, Column, ComponentV2, Button, ClickEvent, FlexAlign, $r, Color, FontWeight, Row, Direction } from '@ohos.arkui.component'
import { Local } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { PopupV2, PopupV2Button, PopupV2InitInfo } from '@ohos.arkui.advanced.PopupV2';
import {ImageModifier, TextModifier} from '@ohos.arkui.modifier';
@Entry
@ComponentV2
struct PopupV2ButtonTest {
  @Local text: string = ''

  build() {
    Column() {
      Column() {
        // popup 自定义高级组件
        PopupV2({
          // PopupIconOptions类型设置图标内容
          icon: $r('app.media.startIcon'),
          iconModifier: new ImageModifier()
            .width('100lpx')
            .height('100lpx')
            .fillColor(Color.Orange)
            .borderRadius('50'),
          // PopupTextOptions类型设置文字内容
          title: 'PopupV2参数全设置',
          titleModifier: new TextModifier()
            .fontSize(20)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bolder),
          // PopupTextOptions类型设置文字内容
          message: 'This is the message',
          messageModifier: new TextModifier()
            .fontSize(20)
            .fontColor(Color.Blue)
            .fontWeight('400'),
          maxWidth: '80%',
          showClose: true,
          onClose: () => {
            console.info('close Button click');
          },
          // PopupButtonOptions类型设置按钮内容
          buttons: [{
            text: '确认',
            action: () => {
              this.text = '确认'
              console.info('confirm button click');
            },
            buttonTextModifier: new TextModifier().fontSize(30).fontColor(Color.Orange),
          },
            {
              text: '取消',
              action: () => {
                console.info('cancel button click');
              },
              buttonTextModifier: new TextModifier().fontSize(30).fontColor(Color.Orange),
            },] as [PopupV2Button | undefined, PopupV2Button | undefined]
        })
      }
      .borderWidth(2)

      Text(this.text).key('PopupV2ButtonText')
    }
  }
}