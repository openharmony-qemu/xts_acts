'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
  Builder, Column, ColumnOptions, Component, CopyOptions, Entry, Row, Text, TextMenuItem,
  TextResponseType, TextSpanType
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import {
  OnMenuItemClickWithTextCallback, SelectionContainer, SelectionContainerEditMenuOptions,
  SelectionContainerMenuOptions
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerNormalMenu {
  @State onAppearText: string = 'idle';
  @State onDisappearText: string = 'idle';
  @State onMenuShowText: string = 'idle';
  @State onMenuHideText: string = 'idle';
  @State onCreateMenuText: string = 'idle';
  @State onMenuItemClickText: string = 'idle';
  @State onPrepareMenuText: string = 'idle';

  private menuItemClickCb: OnMenuItemClickWithTextCallback = (_item: TextMenuItem, _value: string) => {
    this.onMenuItemClickText = 'clicked';
    return false;
  };

  private menuOptions: SelectionContainerMenuOptions = {
    onAppear: (_value: string) => {
      this.onAppearText = 'appear';
    },
    onDisappear: () => {
      this.onDisappearText = 'disappear';
    },
    onMenuShow: (_value: string) => {
      this.onMenuShowText = 'show';
    },
    onMenuHide: (_value: string) => {
      this.onMenuHideText = 'hide';
    }
  };

  private editMenuOptions: SelectionContainerEditMenuOptions = {
    onCreateMenu: (menuItems: Array<TextMenuItem>) => {
      this.onCreateMenuText = 'create';
      return menuItems;
    },
    onMenuItemClick: this.menuItemClickCb,
    onPrepareMenu: (menuItems: Array<TextMenuItem>) => {
      this.onPrepareMenuText = 'prepare';
      return menuItems;
    }
  };

  @Builder
  selectionMenuBuilder() {
    Column() {
      Text('CustomSelectionMenu')
        .padding(10)
        .id('sc_static_menu_custom_text')
    }
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Row() {
        Text(this.onAppearText).id('sc_static_menu_onAppear').width('25%')
        Text(this.onDisappearText).id('sc_static_menu_onDisappear').width('25%')
        Text(this.onMenuShowText).id('sc_static_menu_onMenuShow').width('25%')
        Text(this.onMenuHideText).id('sc_static_menu_onMenuHide').width('25%')
      }.width('100%')

      Row() {
        Text(this.onCreateMenuText).id('sc_static_menu_onCreateMenu').width('33%')
        Text(this.onMenuItemClickText).id('sc_static_menu_onMenuItemClick').width('33%')
        Text(this.onPrepareMenuText).id('sc_static_menu_onPrepareMenu').width('33%')
      }.width('100%')

      SelectionContainer() {
        Column({ space: 4 } as ColumnOptions) {
          Text('BindSelectionMenu A').fontSize(16).copyOption(CopyOptions.InApp)
          Text('BindSelectionMenu B').fontSize(16).copyOption(CopyOptions.InApp)
        }
      }
      .id('sc_static_menu_bind')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(TextSpanType.TEXT, this.selectionMenuBuilder, TextResponseType.LONG_PRESS,
        this.menuOptions)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(8)

      SelectionContainer() {
        Column({ space: 4 } as ColumnOptions) {
          Text('EditMenuOptions A').fontSize(16).copyOption(CopyOptions.InApp)
          Text('EditMenuOptions B').fontSize(16).copyOption(CopyOptions.InApp)
        }
      }
      .id('sc_static_menu_edit')
      .copyOption(CopyOptions.InApp)
      .editMenuOptions(this.editMenuOptions)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(8)
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}
