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


import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {FocusPriority,Padding,ResourceColor,TouchEvent,PopupStateChangeParam,Placement,CustomPopupOptions,Divider,Visibility,RowOptions,Scroll,ClickEvent,Navigation,NavDestination,Button,ColumnOptions,Builder,NavPathStack,NavigationMode,Text,Entry,Column,Component,Row,Color,PreDragStatus,FontWeight,DragEvent} from '@ohos.arkui.component'

@Entry
@Component
struct FocusScopePriority15 {
  @State isShow: boolean = false

  @Builder myBuilder() {
    Column({space:5} as ColumnOptions) {
      Text('焦点组')
      Column({space:5} as ColumnOptions){
        Button('btn1')
          .focusOnTouch(true)

        Button('FocusPriority.PREVIOUS')
          .focusOnTouch(true)
          .focusScopePriority('FocusScopePriority15_focusGroup1', FocusPriority.PREVIOUS)
          .id('FocusScopePriority15_btn2_1')

        Button('btn3')
          .focusOnTouch(true)

      }.focusScopeId('FocusScopePriority15_focusGroup1',true)
      .borderWidth(1)

      Button('btn4')
        .focusOnTouch(true)

      Text('非焦点组')
      Column({space:5} as ColumnOptions){
        Button('btn5')
          .focusOnTouch(true)
          .id('FocusScopePriority15_btn1_2')

        Button('FocusPriority.PRIOR')
          .focusOnTouch(true)
          .focusScopePriority('FocusScopePriority15_focusGroup2', FocusPriority.PRIOR)
          .id('FocusScopePriority15_btn2_2')

        Button('btn7')
          .focusOnTouch(true)
          .id('FocusScopePriority15_btn3_2')

      }.focusScopeId('FocusScopePriority15_focusGroup2',false)
      .borderWidth(1)

      Button('close')
        .id('FocusScopePriority15_close')
        .focusOnTouch(true)
        .onClick((e: ClickEvent) => {
          this.isShow = false
        })

    }.padding(20)
  }

build() {
    Column({space:5} as ColumnOptions){

      Button('bindSheet')
        .id('FocusScopePriority15_open')
        .onClick((e: ClickEvent) => {
          this.isShow = true
        })
        // .bindSheet($$this.isShow, this.myBuilder(), {
        //   backgroundColor: Color.Pink,
        //   showClose:false,
        //   dragBar:true
        // })

    }.width('100%')
  }
}