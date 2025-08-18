/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Entry, Column, Component, ForEach, Scroll, Scroller, Flex, FlexDirection, TextAlign,
  ItemAlign, FlexAlign, Text, Button, ClickEvent} from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';










@Entry
@Component
struct ScrollOnScrollBegin {
  scroller: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  
  
  
  
  
  
  
  
  
  

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button("change value").onClick((e:ClickEvent) => {
        
      }).key("changeButton")

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: Number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              
          })
        }.width('100%')
      }
        .key("ScrollKey1")
        
        .width("100%")
        .height("100%")

    }.width("100%").height("100%")
  }
}

