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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { State } from '@ohos.arkui.stateManagement';
import {
  Entry,
  Component,
  Column,
  Button,
  ClickEvent,
  Text,
  LoadingProgress,
  $r,
  Row,
  List,
  ColumnOptions,
  ListItem,
  Margin,
  Color
} from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement'


export class LoadingProgress1 {
  name: string = ''
  message: MessageManager = new MessageManager()
}

@Entry
@Component
struct LoadingProgressExample {
  @State color: Color = Color.Blue
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('Gauge onPageShow')
    const loadingProgress1 = new LoadingProgress1()
    loadingProgress1.message = this.messageManager
    loadingProgress1.name = 'messageManager'
    AppStorage.setOrCreate<LoadingProgress1>('LoadingProgressExample', loadingProgress1, Type.from<LoadingProgress1>())
    let callback: Callback = (message: Message) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'color') {
        this.color = message.value as Color
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('Orbital LoadingProgress ').fontSize(9).fontColor(0xCCCCCC).width('90%')
      LoadingProgress()
        .color(this.color).key('loadingProgress')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}