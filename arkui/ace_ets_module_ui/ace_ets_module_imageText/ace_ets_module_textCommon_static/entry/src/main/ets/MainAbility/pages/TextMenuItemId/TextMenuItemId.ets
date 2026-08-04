'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Entry,
  Component,
  Column,
  Text,
  TextMenuItemId,
  TextMenuItem,
  TextRange,
  EditMenuOptions,
  CopyOptions,
  ColumnOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TextMenuItemIdExample {
  @State menuFlagUrl: string = 'false'
  @State menuFlagEmail: string = 'false'
  @State menuFlagPhoneNumber: string = 'false'
  @State menuFlagAddress: string = 'false'
  @State menuFlagDateTime: string = 'false'
  @State menuFlagAskAI: string = 'false'

  build() {
    Column({ space: 4 } as ColumnOptions) {
      Text('https://www.example.com')
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
            let items: TextMenuItem[] = [];
            menuItems.forEach((value: TextMenuItem): void => {
              if (value.id.equals(TextMenuItemId.url)) {
                value.content = 'url_menu_item'
                this.menuFlagUrl = 'true'
                items.push(value)
              }
            });
            return items
          },
          onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange): boolean => {
            return true
          }
        } as EditMenuOptions)
        .id('text_url')
        .height('5%')
        .width('90%')

      Text(`url: ${this.menuFlagUrl}`)
        .id('text_url_flag')
        .height('3%')
        .fontSize(16)

      Text('test@example.com')
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
            let items: TextMenuItem[] = [];
            menuItems.forEach((value: TextMenuItem): void => {
              if (value.id.equals(TextMenuItemId.email)) {
                value.content = 'email_menu_item'
                this.menuFlagEmail = 'true'
                items.push(value)
              }
            });
            return items
          },
          onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange): boolean => {
            return true
          }
        } as EditMenuOptions)
        .id('text_email')
        .height('5%')
        .width('90%')

      Text(`email: ${this.menuFlagEmail}`)
        .id('text_email_flag')
        .height('3%')
        .fontSize(16)

      Text('12345678901')
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
            let items: TextMenuItem[] = [];
            menuItems.forEach((value: TextMenuItem): void => {
              if (value.id.equals(TextMenuItemId.phoneNumber)) {
                value.content = 'phoneNumber_menu_item'
                this.menuFlagPhoneNumber = 'true'
                items.push(value)
              }
            });
            return items
          },
          onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange): boolean => {
            return true
          }
        } as EditMenuOptions)
        .id('text_phoneNumber')
        .height('5%')
        .width('90%')

      Text(`phoneNumber: ${this.menuFlagPhoneNumber}`)
        .id('text_phoneNumber_flag')
        .height('3%')
        .fontSize(16)

      Text('北京市朝阳区建国路88号')
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
            let items: TextMenuItem[] = [];
            menuItems.forEach((value: TextMenuItem): void => {
              if (value.id.equals(TextMenuItemId.address)) {
                value.content = 'address_menu_item'
                this.menuFlagAddress = 'true'
                items.push(value)
              }
            });
            return items
          },
          onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange): boolean => {
            return true
          }
        } as EditMenuOptions)
        .id('text_address')
        .height('5%')
        .width('90%')

      Text(`address: ${this.menuFlagAddress}`)
        .id('text_address_flag')
        .height('3%')
        .fontSize(16)

      Text('2024年1月15日 10:30')
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
            let items: TextMenuItem[] = [];
            menuItems.forEach((value: TextMenuItem): void => {
              if (value.id.equals(TextMenuItemId.dateTime)) {
                value.content = 'dateTime_menu_item'
                this.menuFlagDateTime = 'true'
                items.push(value)
              }
            });
            return items
          },
          onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange): boolean => {
            return true
          }
        } as EditMenuOptions)
        .id('text_dateTime')
        .height('5%')
        .width('90%')

      Text(`dateTime: ${this.menuFlagDateTime}`)
        .id('text_dateTime_flag')
        .height('3%')
        .fontSize(16)

      Text('askAI test content')
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
            let items: TextMenuItem[] = [];
            menuItems.forEach((value: TextMenuItem): void => {
              if (value.id.equals(TextMenuItemId.askAI)) {
                value.content = 'askAI_menu_item'
                this.menuFlagAskAI = 'true'
                items.push(value)
              }
            });
            return items
          },
          onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange): boolean => {
            return true
          }
        } as EditMenuOptions)
        .id('text_askAI')
        .height('5%')
        .width('90%')

      Text(`askAI: ${this.menuFlagAskAI}`)
        .id('text_askAI_flag')
        .height('3%')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
  }
}
