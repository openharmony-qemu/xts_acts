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
import { MessageManager, Callback,Message } from '../../../MainAbility/common/MessageManager';
import { CustomTheme, CustomColors, Theme, ThemeControl } from '@ohos.arkui.theme';
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {FunctionKey,$r,KeyEvent,HitTestMode,ModifierKey,FoldStatus,OnFoldStatusChangeInfo,FlexAlign,Alignment,TextAlign,SafeAreaEdge,FolderStack,TextInput,Menu,MenuItem,Margin,DialogAlignment,CustomDialogController,FocusPriority,Padding,ResourceColor,TouchEvent,PopupStateChangeParam,Placement,CustomPopupOptions,Divider,Visibility,RowOptions,Scroll,ClickEvent,Navigation,NavDestination,Button,ColumnOptions,Builder,NavPathStack,NavigationMode,Text,Entry,Column,Component,Row,Color,PreDragStatus,FontWeight,DragEvent} from '@ohos.arkui.component'

@Entry
@Component
struct ShortcutKey {
  @State message: string = 'Hello World'

build() {
    Row() {
      Column({ space: 5 } as ColumnOptions) {
        Text(this.message).key("keyTest2Tab").margin({top:15} as Margin)
        Button("Test short cut 1").onClick((event: ClickEvent) => {
          this.message = "I clicked Button 1";
          console.info("I clicked 1");
        }).keyboardShortcut(FunctionKey.TAB, [ModifierKey.SHIFT])
          .onKeyEvent((event: KeyEvent)=>{
            console.info("event.keyCode: " + JSON.stringify(event));
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}