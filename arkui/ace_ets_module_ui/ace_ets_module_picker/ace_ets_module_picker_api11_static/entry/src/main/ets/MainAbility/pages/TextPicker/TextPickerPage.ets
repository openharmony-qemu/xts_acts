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
import {MessageManager,Callback, Message} from '../../../MainAbility/common/MessageManager';
import { Entry, Component, Column, Text, Rating, Margin, TextPicker } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextPickerPage {
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4'];
  private select: int = 0;
  @State parameterValue: string = 'orange2';
  @State defaultPickerItemHeight: double = 20.0;
  @State getValue: string|string[] = 'value';
  @State getIndex: int | int[] = 0;
  messageManager:MessageManager = new MessageManager();

  onPageShow() {
    console.info('TextPicker onPageShow')

    AppStorage.setOrCreate('messageManager', this.messageManager)

  }

  build() {
    Column() {
      TextPicker({ range: this.fruits, selected: this.select, value: this.parameterValue })
        .key('textPicker')
        .width("100%")
        .height("80%")
        .defaultPickerItemHeight(this.defaultPickerItemHeight)
        .onChange((value: string|string[], index: int | int[]):void => {
          console.info('Picker item changed, value: ' + value + ', index: ' + index)
          this.getValue = value
          this.getIndex = index
        })
      Text(this.getValue.toString() + ': ' + this.getIndex.toString()).fontSize(20).key('textContent1')
    }
  }
}