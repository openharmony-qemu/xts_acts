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
  Margin,
  TabsController,
  Builder,
  Column,
  BarMode,
  Text,
  Tabs,
  TabContent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Tabs_barMode {
  @State fontColor: string = '#182431';
  @State selectedFontColor: string = '#007DFF';
  @State currentIndex: int = 0;
  @State changeBarMode: BarMode = BarMode.Fixed;
  private controller: TabsController = new TabsController();
  messageManager: MessageManager<number | BarMode> = new MessageManager<number | BarMode>();

  onPageShow() {
    console.info('Tabs_barMode onPageShow');
    AppStorage.setOrCreate<MessageManager<number | BarMode>>('messageManager', this.messageManager);
    let callback: Callback<number | BarMode> = (message: Message<number | BarMode>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'currentIndex') {
        this.currentIndex = (message.value as number).toInt();
      }
      if (message.name == 'changeBarMode') {
        this.changeBarMode = message.value as BarMode;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  
  
  
  
  
  
  
  
  
  

  build() {
    Column() {
      Tabs({ index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87').key("Tabs_barMode_001")
        } 

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF').key("Tabs_barMode_002")
        } 

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00').key("Tabs_barMode_003")
        } 
      }
      .key("Tabs_barMode_01")
      .vertical(false)
      .barWidth(330)
      .barHeight(56)
      .barMode(this.changeBarMode)
      .animationDuration(400)
      .onChange((index: int): void => {
        this.currentIndex = index
      })
      .width(330)
      .height(300)
      .backgroundColor('#F1F3F5')
    }.width('100%')
  }
}