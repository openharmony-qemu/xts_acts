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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Image, Search, Row, SearchController, ColumnOptions, SearchController} from '@ohos.arkui.component'
import { Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct SearchGetText {
  aboutToAppear(){
    let uiContext = this.getUIContext();
    let SearchRouter = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("SearchRouter",  SearchRouter);
  }

  controller: SearchController = new SearchController();

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Text('Search:getText、clearPreViewText')
        .width('90%').height('5%')

      Search({ value: 'abcdef', placeholder:'Search:getText、clearPreViewText', controller: this.controller })
        .id('Search_getText')
        .width('90%').height('5%')

      Row() {
        Button('clearPreViewText')
          .id('Search_clearPreViewText')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            this.controller.clearPreviewText()
            AppStorage.setOrCreate('clearPreViewText_Search', 'succ')
            console.log('clearPreViewText_Search succ')
          })

        Button('设置start和end')
          .id('Search_getText_1')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })
      }

      Row() {
        Button('只设置start')
          .id('Search_getText_2')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })

        Button('只设置end')
          .id('Search_getText_3')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })
      }

      Row() {
        Button('start设置undefined')
          .id('Search_getText_4')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })

        Button('end设置undefined')
          .id('Search_getText_5')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })
      }

      Row() {
        Button('start和end设置undefined')
          .id('Search_getText_6')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })

        Button('不设置TextRange')
          .id('Search_getText_7')
          .width('50%')
          .height('5%')
          .onClick((e:ClickEvent) => {
            
            
            
          })
      }
    }
  }
}