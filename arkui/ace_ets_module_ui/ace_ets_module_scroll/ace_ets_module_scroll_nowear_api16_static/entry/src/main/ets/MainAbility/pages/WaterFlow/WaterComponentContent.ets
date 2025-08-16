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


import { Entry, Component, Scroller, ScrollState, Column, ClickEvent, Button, FlexDirection, WaterFlow, LazyForEach, ColumnOptions, FlowItem, Padding, Text, BarState, TextAlign, Builder, FontWeight, UIContext, wrapBuilder } from '@ohos.arkui.component';
import events_emitter from '@ohos.events.emitter';
import { State } from '@ohos.arkui.stateManagement';

class Params {
  public text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .id('footerContent1')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height('25%')
  }
}

@Entry
@Component
struct WaterComponentContent {
  @State message1: string = 'footer'
  @State setUndefinedIndex:number = 0
  context: UIContext = this.getUIContext()
  
  
  
  
  
  
  

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('set ComponentContent').margin(1)
        .onClick((e: ClickEvent) => {
          this.message1 = 'SET_COMPONENTCONTENT'
          this.setUndefinedIndex = 0
        })
        .id('button1')
      Button('set Undefined').margin(1)
        .onClick((e: ClickEvent) => {
          this.message1 = 'SET_UNDEFINED'
          this.setUndefinedIndex = 1
        })
        .id('button2')
      Button('set null').margin(1)
        .onClick((e: ClickEvent) => {
          this.message1 = 'SET_NULL'
          this.setUndefinedIndex = 2
        })
        .id('button3')
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }
  }
}