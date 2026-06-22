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

import { EditableTitleBarV2, EditableTitleBarMenuItemV2, EditableSaveButtonV2, EditableTitleBarStyleV2 } from '@ohos.arkui.advanced.EditableTitleBarV2';
import { Entry, ComponentV2, $r, Column, Text, Scroll, FontWeight, Padding, ColumnOptions } from '@kit.ArkUI';

@Entry
@ComponentV2
struct EditableTitleBarV2MenuButton {
  build(): void {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Text('Menu and Button Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 20, bottom: 20 })

        EditableTitleBarV2({
          title: 'Single Menu Item',
          options: new EditableTitleBarStyleV2(),
          menuItems: [
            new EditableTitleBarMenuItemV2({ value: $r('sys.media.ohos_ic_public_more') })
          ]
        })

        EditableTitleBarV2({
          title: 'Multiple Menu Items',
          options: new EditableTitleBarStyleV2(),
          menuItems: [
            new EditableTitleBarMenuItemV2({ value: $r('sys.media.ohos_ic_public_more') }),
            new EditableTitleBarMenuItemV2({ value: $r('sys.media.ohos_ic_public_camera') })
          ]
        })

        EditableTitleBarV2({
          title: 'Save Button',
          options: new EditableTitleBarStyleV2(),
          saveButton: new EditableSaveButtonV2({ isRequired: true })
        })

        EditableTitleBarV2({
          title: 'Disabled Menu Item',
          options: new EditableTitleBarStyleV2(),
          menuItems: [
            new EditableTitleBarMenuItemV2({ 
              value: $r('sys.media.ohos_ic_public_more'), 
              isEnabled: false 
            })
          ]
        })

        EditableTitleBarV2({
          title: 'Ac Menu',
          options: new EditableTitleBarStyleV2(),
          menuItems: [
            new EditableTitleBarMenuItemV2({ 
              value: $r('sys.media.ohos_ic_public_more'),
              accessibilityLevel: 'yes',
              accessibilityText: 'More options'
            })
          ]
        })
      }
      .width('100%')
      .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
  }
}