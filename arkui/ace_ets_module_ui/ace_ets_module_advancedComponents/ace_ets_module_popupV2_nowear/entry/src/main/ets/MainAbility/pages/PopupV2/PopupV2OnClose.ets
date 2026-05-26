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
import { PopupV2, PopupV2InitInfo, PopupV2Button } from '@kit.ArkUI';
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
            .width('16')
            .height('16'),
          message: 'PopupV2',
          messageModifier: new TextModifier()
            .fontSize(6),
          showClose: true,
          onClose: () => {
            this.text = 'onClose'
            console.info('close button click');
          },
        })
      }.width(120).height(50).borderWidth(1).key('PopupV2OnClick')
      Text(this.text).key('PopupV2OnClickText')
    }
  }
}