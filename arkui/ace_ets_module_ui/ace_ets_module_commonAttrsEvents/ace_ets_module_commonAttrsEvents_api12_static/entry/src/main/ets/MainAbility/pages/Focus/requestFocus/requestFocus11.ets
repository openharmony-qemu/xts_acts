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

import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {Margin,DialogAlignment,CustomDialogController,FocusPriority,Padding,ResourceColor,TouchEvent,PopupStateChangeParam,Placement,CustomPopupOptions,Divider,Visibility,RowOptions,Scroll,ClickEvent,Navigation,NavDestination,Button,ColumnOptions,Builder,NavPathStack,NavigationMode,Text,Entry,Column,Component,Row,Color,PreDragStatus,FontWeight,DragEvent} from '@ohos.arkui.component'

@Entry
@Component
struct requestFocus11 {
  @State text1:string = ''
  @State label:string = 'btn4'

build() {
    Column({ space:20 } as ColumnOptions){
      Text('' + this.text1).id('requestFocus11_text1')
      Button('btn1').onClick((event: ClickEvent) => {
      }).tabIndex(0)
      Button('btn2').onClick((event: ClickEvent) => {
      }).tabIndex(1)
      Button('btn3').onClick((event: ClickEvent) => {
      }).tabIndex(2)
      Button(this.label).onClick((event: ClickEvent) => {
      }).id('requestFocus11_btn4')
        .onFocus(() => {
          this.label = 'btn4-1'
        })
        .onBlur(() => {
          this.label = 'btn4'
        })

      Button('Focus-btn4').onClick((e: ClickEvent) => {
        try{
          this.getUIContext().getFocusController().requestFocus('requestFocus11_btn4')
        }catch (error: Error){
          this.text1 = '' + error.code
        }
      }).id('requestFocus11_btn5')

    }.width('100%').margin({ top:20 } as Margin)
  }
}

