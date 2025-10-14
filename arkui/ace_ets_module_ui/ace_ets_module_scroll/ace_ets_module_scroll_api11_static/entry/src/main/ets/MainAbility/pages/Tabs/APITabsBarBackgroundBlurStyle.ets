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
  BarPosition,
  Tabs,
  TabContent,
  BarMode,
  BlurStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct APITabsBarBackgroundBlurStyle {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: int = 0
  private controller: TabsController = new TabsController()
  @State text: string = ''

  
  
  
  
  
  
  
  
  
  
  
  
  
  

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        } 

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        } 

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        } 

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        } 
      }
      .barBackgroundBlurStyle(BlurStyle.NONE)
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth(360)
      .barHeight(56)
      .animationDuration(400)
      .onChange((index: int): void => {
        this.currentIndex = index
      })
      .width(360)
      .height(296)
      .margin({ top: 52 } as Margin)
      .backgroundColor('#F1F3F5')
      .key('APITabsBarBackgroundBlurStyle01')

      
      
      
      
      
      
      


    }.width('100%')
  }
}