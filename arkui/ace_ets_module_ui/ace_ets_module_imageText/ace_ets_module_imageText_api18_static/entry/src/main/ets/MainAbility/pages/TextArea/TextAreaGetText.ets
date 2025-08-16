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
  Column,
  ColumnOptions,
  Text,
  TextArea,
  TextAreaController,
  ClickEvent,
  Row,
  Button,
  TextAreaController
} from '@ohos.arkui.component'
import {
  State,
  
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TextAreaGetText {
  controller: TextAreaController = new TextAreaController();

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Text('TextArea:getText、clearPreViewText')
        .width('90%').height('5%')

      TextArea({ text: 'abcdef', controller: this.controller })
        .id('TextArea_getText')
        .width('90%').height('5%')

      Row() {
        Button('clearPreViewText')
          .id('TextArea_clearPreViewText')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            this.controller.clearPreviewText()
            AppStorage.setOrCreate('clearPreViewText_TextArea', 'succ')
            console.log('clearPreViewText_TextArea succ')
          })

        Button('设置start和end')
          .id('TextArea_getText_1')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })
      }

      Row() {
        Button('只设置start')
          .id('TextArea_getText_2')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })

        Button('只设置end')
          .id('TextArea_getText_3')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })
      }

      Row() {
        Button('start设置undefined')
          .id('TextArea_getText_4')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })

        Button('end设置undefined')
          .id('TextArea_getText_5')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })
      }

      Row() {
        Button('start和end设置undefined')
          .id('TextArea_getText_6')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })

        Button('不设置TextRange')
          .id('TextArea_getText_7')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })
      }
    }
  }
}