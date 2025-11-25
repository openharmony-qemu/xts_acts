'use static';
/*
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
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, Toggle, ToggleType,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct CheckboxExample {

  @State mIsOn1: String = ''
  @State mIsOn2: String = ''
  @State mIsOn3: String = ''
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


  build() {
    Column() {
      Toggle({ type: ToggleType.Switch, isOn: true })
        .selectedColor('#007DFF')
        .switchPointColor('#FFFFFF')
        
        
      Toggle({ type: ToggleType.Checkbox, isOn: true })
        .size({ width: 20, height: 20 })
        .selectedColor('#007DFF')
        
        
      Toggle({ type: ToggleType.Button, isOn: true }) {
        Text('status button').fontColor('#182431').fontSize(12)
      }.width(106)
      .selectedColor('rgba(0,125,255,0.20)')
      
      
      Text(this.mIsOn1.toString()).key('mToggleOneKey')
      Text(this.mIsOn2.toString()).key('mToggleTwoKey')
      Text(this.mIsOn2.toString()).key('mToggleThreeKey')
    }.width('100%')
  }
}
