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
import {MenuItemOptions,Menu,MenuItem,MenuItemGroup,TouchEvent,PopupStateChangeParam,Placement,CustomPopupOptions,Divider,Visibility,RowOptions,Scroll,ClickEvent,Navigation,NavDestination,Button,ColumnOptions,Builder,NavPathStack,NavigationMode,Text,Entry,Column,Component,Row,Color,PreDragStatus,FontWeight,DragEvent} from '@ohos.arkui.component'

@Entry
@Component
struct FocusScopeId013 {
  @State select: boolean = true

  @Builder
  MyMenu(){
    Menu() {

      MenuItem({
        content: "菜单一 第一项",
      } as MenuItemOptions)
        .id('FocusScopeId013_Item')

      MenuItemGroup({ header: '焦点组' }) {
        MenuItem({
          content: '菜单选项1',
        } as MenuItemOptions)
          .id('FocusScopeId013_Item1_1')
        MenuItem({
          content: '菜单选项2',
        } as MenuItemOptions)
          .id('FocusScopeId013_Item2_1')
      }.focusScopeId('FocusScopeId013_focusGroup1', true)

    }
  }

build() {
    Column({space:10} as ColumnOptions) {
      Button('bindMenu 非子窗口')
        .bindMenu(this.MyMenu, {showInSubWindow: false})
        .id('FocusScopeId013_open')

    }
    .width('100%')
  }
}