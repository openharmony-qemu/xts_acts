'use static';
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

import { CustomTheme, CustomColors } from '@ohos.arkui.theme';
import {
  Entry, Component,
  Column, ColumnOptions, 
  Flex, FlexDirection, ItemAlign, FlexAlign, Slider, Divider, WithTheme, SliderOptions,
  Text, Button, FontWeight, ClickEvent, Margin, Color, SliderStyle,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';





















class PageCustomTheme implements CustomTheme {
  colors?: CustomColors

  constructor(colors: CustomColors) {
    this.colors = colors
  }
}

@Entry
@Component
struct themeSliderPage {
  static readonly themeCount:int = 3;
  themeNames: string[] = ['System', 'Custom (green)', 'Custom (red)'];
  themeArray: Array<CustomTheme | undefined> = new Array<CustomTheme|undefined>(
    undefined, 
    
    
  )
  @State themeIndex: Int = 0;

  build() {
    Column() {
      Column({ space: '8vp' } as ColumnOptions) {
        Text(`未使用WithTheme`)
        
        Button(`切换theme配色：${this.themeNames[this.themeIndex]}`)
          .onClick((e:ClickEvent) => {
            this.themeIndex = (this.themeIndex + 1) % themeSliderPage.themeCount;
          }).key('themeSliderClick')

        
        Text('block').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
        Slider({ style: SliderStyle.OutSet, value: 40 }  as SliderOptions)
          .blockSize({ width: 40, height: 40 })
          .blockBorderColor(Color.Red)
          .blockBorderWidth(5)
        Divider()
        Text('step').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
        Slider({ style: SliderStyle.InSet, value: 40, step: 10 } as SliderOptions)
          .showSteps(true)
          .stepSize(8)
          .stepColor(Color.Yellow)
        Divider()
        Text('track').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
        Slider({ style: SliderStyle.InSet, value: 40 } as SliderOptions)
          .trackBorderRadius(2)
        Divider()
      }
      .margin({
        top: '50vp'
      } as Margin)

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }
  }
}