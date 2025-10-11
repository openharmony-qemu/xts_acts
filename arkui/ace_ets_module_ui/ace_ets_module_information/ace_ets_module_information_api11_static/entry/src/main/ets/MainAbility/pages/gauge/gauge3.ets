
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
import {MessageManager,Callback, Message} from '../../common/MessageManager';
import { Entry, Component, Column, Gauge, Margin, Flex, FlexOptions, ResourceColor, ColumnOptions, FlexDirection, ItemAlign, FlexAlign, Alignment, TextAlign, TextOverflow, LinearGradient,
 Color, Resource, } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct Gauge3Example {
  @State startAngle:number = 0;
  @State endAngle:number = 0;
  @State colors: ResourceColor | LinearGradient | Array<[ResourceColor | LinearGradient , number]> = [[0x317AF7, 0.1], [0x5BA854, 0.2], [0xE08C3A, 0.3], [0x9C554B, 0.4]] as ResourceColor | LinearGradient | Array<[ResourceColor | LinearGradient , number]>
  @State strokeWidth:number = 0;
  @State value:number = 30;
  @State min:number = 0;
  @State max:number = 100;
  @State wth:number = 100;

  messageManager:MessageManager<Object> = new MessageManager<Object>()
  onPageShow() {
    console.info('Gauge onPageShow')
    
    AppStorage.setOrCreate<Object>('messageManager', this.messageManager)
    let callback:Callback<Object> = (message:Message<Object>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'startAngle') {
          this.startAngle = message.value as number
      }
      if (message.name == 'endAngle') {
          this.endAngle = message.value as number
      }
      if (message.name == 'colors') {
          this.colors = message.value as ResourceColor | LinearGradient | Array<[ResourceColor | LinearGradient, number]>
      }
      if (message.name == 'strokeWidth') {
          this.strokeWidth = message.value as number
      }
      if (message.name == 'value') {
          this.value = message.value as number
      }
      if (message.name == 'min') {
          this.min = message.value as number
      }
      if (message.name == 'max') {
          this.max = message.value as number
      }
      if (message.name == 'wth') {
          this.wth = message.value as number
      }
    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      
      Gauge({ value: 75 })
        .width(200).height(200)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])

      Gauge({ value: 75 })
        .value(25) 
        .width(200).height(200)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])

      Gauge({ value: this.value, min: this.min, max: this.max })
        .startAngle(this.startAngle)
        .endAngle(this.endAngle)
        .colors(this.colors)
        .strokeWidth(this.strokeWidth)
        .width(this.wth)
        .height(200).key('guage')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}