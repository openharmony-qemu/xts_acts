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

import { BusinessError } from '@kit.BasicServicesKit';

import {
  Entry, Component, Builder, ButtonType,
  Column, ColumnOptions, Row, RowOptions, Color, NavPathStack, NavDestination,
  Text, Button, FontWeight, ClickEvent, Margin,  PopInfo, NavDestinationContext,
  
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class TmpClass {
  public count: number = 10
}

class ParamWithOp {
  public operation: number = 1
  public count: number = 10
}

class resultClass {
  constructor(count: number) {
    this.count = count;
  }
  count: number = 10
}

@Builder
export function PageOneBuilder(name: string, param: Object) {
  PageOne()
}

@Component
export struct PageOne {
  pageInfo: NavPathStack = new NavPathStack();
  
  @State message: string = 'Hello World'

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .width('80%')
          .height(50)
          .margin(10)

        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            
            
            
            
            
            
            
          })

        Button('pushPath with NavigationOptions', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            
            
            
            
            
            
            
          })

        Button('pushPathByName', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            let tmp = new TmpClass()
            
            
            
            
            
            
            
          })

        Button('pushPathByNameWithoutOnPop', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            let tmp = new TmpClass()
            
            
            
            
            
            
          })

        Button('pushDestination', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            let tmp = new TmpClass()
            
            
            
            
            
            
            
          })

        Button('pushDestination with NavigationOptions', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            let tmp = new TmpClass()
            
            
            
            
            
            
            
          })

        Button('pushDestinationByName', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            let tmp = new TmpClass()
            
            
            
            
            
            
            
          })

        Button('pushDestinationByNameWithoutOnPop', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            let tmp = new TmpClass()
            
            
            
            
            
            
          })

        Button('replacePath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            
            
            
            
            
            
            
          })

        Button('replacePath with NavigationOptions', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            
            
            
            
            
            
            
          })

        Button('replacePathByName', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(35)
          .margin(10)
          .onClick((e:ClickEvent) => {
            let tmp = new TmpClass()
            
            
            
            
            
            
          })

      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      
      this.pageInfo.pop(new resultClass(1))
      return true
    }).onReady((context: NavDestinationContext) => {
      this.pageInfo = context.pathStack;
      
    })
  }
}