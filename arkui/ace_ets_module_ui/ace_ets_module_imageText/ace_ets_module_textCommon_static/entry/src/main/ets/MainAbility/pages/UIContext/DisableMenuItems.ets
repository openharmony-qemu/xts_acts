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

import { TextMenuController } from '@kit.ArkUI';
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
  ColumnOptions,
  TextInput,
  Button,
  FontWeight,
  FlexAlign,
  Row,
  Divider,
  Color,
  RowOptions
} from '@ohos.arkui.component';

@Entry
@Component
struct DisableMenuItems {
  aboutToDisappear(): void {
    TextMenuController.disableMenuItems([])
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('disableMenuItems Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Divider()

      TextInput({ text: 'Long press to select text' })
        .id('text_input_select')
        .height('5%')
        .width('90%')
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
            let items: TextMenuItem[] = [];
            menuItems.forEach((value: TextMenuItem): void => {
              if (value.id.equals(TextMenuItemId.SEARCH)) {
                value.content = 'search_menu_test'
                items.push(value)
              }
              if (value.id.equals(TextMenuItemId.TRANSLATE)) {
                value.content = 'translate_menu_test'
                items.push(value)
              }
            })
            return items
          },
          onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange): boolean => {
            return false
          }
        } as EditMenuOptions)

      Divider()

      Column() {
        Text('External Touch Area')
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .id('external_touch_area')
      .width('90%')
      .height('5%')
      .backgroundColor('#E0E0E0')
      .justifyContent(FlexAlign.Center)
      .borderRadius(10)

      Divider()

      Row({ space: 10 } as RowOptions) {
        Button('Disable Search')
          .id('btn_disable_search')
          .width('25%')
          .onClick(() => {
            TextMenuController.disableMenuItems([TextMenuItemId.SEARCH])
          })

        Button('Disable Both')
          .id('btn_disable_both')
          .width('25%')
          .onClick(() => {
            TextMenuController.disableMenuItems([TextMenuItemId.SEARCH, TextMenuItemId.TRANSLATE])
          })

        Button('Restore')
          .id('btn_restore')
          .width('25%')
          .onClick(() => {
            TextMenuController.disableMenuItems([])
          })
      }
      .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
