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
import { PopupV2, PopupV2InitInfo, PopupV2Button } from '@ohos.arkui.advanced.PopupV2';
import { ImageModifier, TextModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct PopupV2Direction {
  @Local text: string = ''

  build() {
    Column() {
      Column() {
        PopupV2({
          icon:  $r('app.media.icon'),
          iconModifier: new ImageModifier()
            .width('100lpx')
            .height('100lpx')
            .fillColor(Color.Orange)
            .borderRadius('50'),
          title: 'PopupV2参数全设置',
          titleModifier: new TextModifier()
            .fontSize(20)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bolder),
          message: 'PopupV2Message',
          messageModifier: new TextModifier()
            .fontSize(20)
            .fontColor(Color.Blue)
            .fontWeight('400'),
          maxWidth: '80%',
          showClose: false,
          onClose: () => {
            console.info('close button click');
          },
          buttons: [{
            text: '确认',
            action: () => {
              this.text = '确认'
              console.info('confirm button click');
            },
            buttonTextModifier: new TextModifier().fontSize(20).fontColor(Color.Orange),
          },
            {
              text: '取消',
              action: () => {
                console.info('cancel button click');
              },
              buttonTextModifier: new TextModifier().fontSize(20).fontColor(Color.Orange),
            },] as [PopupV2Button| undefined, PopupV2Button|undefined]
        })
      }.borderWidth(2)
      Text(this.text).key('PopupV2ButtonText')
    }
  }
}