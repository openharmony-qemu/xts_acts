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
import {Margin,DialogAlignment,TypeError,TextInput,CustomDialogController,FocusPriority,Padding,ResourceColor,TouchEvent,PopupStateChangeParam,Placement,CustomPopupOptions,Divider,Visibility,RowOptions,Scroll,ClickEvent,Navigation,NavDestination,Button,ColumnOptions,Builder,NavPathStack,NavigationMode,Text,Entry,Column,Component,Row,Color,PreDragStatus,FontWeight,DragEvent} from '@ohos.arkui.component'

@Entry
@Component
struct requestFocus18 {
  @State text1:string = ''
  @State text2:string = 'TextInput'
  @State isShow:boolean = false

  @Builder myBuilder(){
    Column(){
      Button('Focus-textInput1').onClick((e: ClickEvent) => {
        try{
          this.getUIContext().getFocusController().requestFocus('requestFocus18_textInput1')
        }catch (error: Error){
          this.text1 = '' + error.code
        }
      }).id('requestFocus18_btn2')
    }
  }

build() {
    Column({ space:20 } as ColumnOptions){
      Text('' + this.text1).id('requestFocus18_text1')

      TextInput({text:this.text2})
        .id('requestFocus18_textInput1')
        .onFocus(() => {
          this.text2 = 'TextInput_1'
        })
        .onBlur(() => {
          this.text2 = 'TextInput'
        })

      Button('modalPageOne').onClick((e: ClickEvent) => {
        this.isShow = true
      }).id('requestFocus18_btn1')
        // .bindContentCover(this.isShow,this.myBuilder(),{
        //   modalTransition:ModalTransition.DEFAULT,
        //   backgroundColor:Color.Pink
        // })

    }.width('100%').margin({ top:20 } as Margin)
  }
}

