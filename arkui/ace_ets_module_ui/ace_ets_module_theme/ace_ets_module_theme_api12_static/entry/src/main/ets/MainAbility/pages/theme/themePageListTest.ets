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
  Flex, FlexDirection, ItemAlign, FlexAlign, List, WithTheme,
  Text, Button, FontWeight, ClickEvent, Margin, Color, ForEach, BarState, ListItem, TextAlign,
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
struct themePageList {
  static readonly themeCount:int = 3;
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  themeNames: Array<string> = new Array<string>('System', 'Custom (green)', 'Custom (red)');
  themeArray: Array<CustomTheme | undefined> = new Array<CustomTheme|undefined>(
    undefined, 
    
    
  )
  @State themeIndex: Int = 0;

  build() {
    Column() {
      Column({ space: '8vp' } as ColumnOptions) {
        Text(`未使用WithTheme`).height('5%')
        
        Button(`切换theme配色：${this.themeNames[this.themeIndex]}`).height('5%')
          .onClick((e:ClickEvent) => {
            this.themeIndex = (this.themeIndex + 1) % themePageList.themeCount;
          }).key('themeClick')

        
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('10%')
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: number) => item.toString())
        }.width('90%').height('30%')
        .scrollBar(BarState.Off)
      }
      .margin({
        top: '50vp'
      } as Margin)

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }
  }
}