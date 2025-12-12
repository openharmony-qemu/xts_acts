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

import {
  Entry, Component,
  Column, ColumnOptions, Color, $r,
  Text, Button, ClickEvent, Margin, Builder, Menu, MenuItem, MenuItemOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

@Entry
@Component
struct MenuApi1 {
  @State text:string = 'hhhhhhhhhh'

  @Builder
  MyMenu() {
      Menu() {
        MenuItem({
          content: "菜单选项",
        } as MenuItemOptions).height('8%')
        MenuItem({
          content: "菜单选项",
        } as MenuItemOptions).height('8%')
        MenuItem({
          startIcon: $r("app.media.app_icon"),
          content: "菜单选项",
        } as MenuItemOptions).height('8%')
        MenuItem({
          content: "菜单选项",
        } as MenuItemOptions).height('8%')

      }.height('80%')
      .menuItemDivider(undefined)
      .id('Menu')

      Text(this.text).id('MenuApi1_text1')
      Button('getInspectorByKey').onClick((e: ClickEvent) => {
        this.text = String(JSON.parseJsonElement(inspector.getInspectorByKey('Menu'))
          .getElement('$attrs')
          .tryGetElement('menuItemDivider'))
      }).id('MenuApi1_btn2')
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('bindMenu')
        .bindMenu(this.MyMenu)
        .width('100%')
        .id('MenuApi1_btn1')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}