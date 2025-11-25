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
  Flex, FlexDirection, ItemAlign, FlexAlign, ButtonStyleMode, WithTheme,
  Text, Button, FontWeight, ClickEvent, Margin, Color,
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
struct themePage {
  static readonly themeCount:int = 3;
  themeNames: Array<string> = new Array<string>('System', 'Custom (green)', 'Custom (red)');
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
            this.themeIndex = (this.themeIndex + 1) % themePage.themeCount;
          }).key('themeClick')

        
        Button('Button.style(NORMAL) with System Theme')
          .buttonStyle(ButtonStyleMode.NORMAL)
        Button('Button.style(EMP..ED) with System Theme')
          .buttonStyle(ButtonStyleMode.EMPHASIZED)
        Button('Button.style(TEXTUAL) with System Theme')
          .buttonStyle(ButtonStyleMode.TEXTUAL)
      }
      .margin({
        top: '50vp'
      } as Margin)

      
      
      
      
      
      
      
      
      
      
      
      
      
    }
  }
}