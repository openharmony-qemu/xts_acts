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
struct requestFocus5 {
  @State text1:string = ''
  @State fontSize:number = 16

build() {
    Column({ space:20 } as ColumnOptions){
      Text('' + this.text1).id('requestFocus5_text1')
      Text('aaaaaaaaa')
        .id('requestFocus5_text2')
        .fontSize(this.fontSize)
        .onFocus(() => {
          this.fontSize = 20
        })
        .onBlur(() => {
          this.fontSize = 16
        })
        .focusable(true)

      Button('Focus-text2').onClick((e: ClickEvent) => {
        try{
          this.getUIContext().getFocusController().requestFocus('requestFocus5_text2')
        }catch (error: Error){
          this.text1 = '' + error.code
        }
      }).id('requestFocus5_btn1')

    }.width('100%').margin({ top:20 } as Margin)
  }
}

