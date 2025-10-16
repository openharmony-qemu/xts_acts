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
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, SliderChangeMode, Slider, SliderStyle,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct CheckboxExample {

  @State mOutSetValueOne: double = 40
  @State mOutSetValueTwo: double = 40
  
  
  
  
  
  
  
  


  build() {
    Column() {
      Button('Button1').onClick((event: ClickEvent) => {
        this.mOutSetValueOne = 66
      })
        .id('sliderButtonOne')
      Button('Button2').onClick((event: ClickEvent) => {
        this.mOutSetValueTwo = 80
      })
        .id('sliderButtonTwo')
      Column(){
        Column(){
          Slider({
            value: this.mOutSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            
          Text(this.mOutSetValueOne.toString()).key('mOutSetValueOneKey')
        }
        Column(){
          Slider({
            value: this.mOutSetValueTwo,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showSteps(true)
            
          Text(this.mOutSetValueTwo.toString()).key('mOutSetValueTwoKey')
        }
      }
    }.width('100%')
  }
}
