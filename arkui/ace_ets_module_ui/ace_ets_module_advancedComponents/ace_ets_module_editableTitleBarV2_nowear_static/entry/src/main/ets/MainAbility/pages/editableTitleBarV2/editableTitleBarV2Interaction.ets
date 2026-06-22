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

import { EditableTitleBarV2, EditableLeftIconV2, EditableTitleBarMenuItemV2, EditableSaveButtonV2, EditableTitleBarStyleV2 } from '@ohos.arkui.advanced.EditableTitleBarV2';
import { EditableLeftIconTypeV2 } from '@ohos.arkui.advanced.EditableTitleBarV2';
import { Entry, ComponentV2, $r, Column, Text, Scroll, FontWeight, Padding, Local, ColumnOptions } from '@kit.ArkUI';

@Entry
@ComponentV2
struct EditableTitleBarV2Interaction {
  @Local callbackResult: string = '';
  @Local menuCallbackResult: string = '';
  @Local saveCallbackResult: string = '';

  build(): void {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Text('Interaction Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 20, bottom: 20 })

        EditableTitleBarV2({
          title: 'Left Icon Click',
          options: new EditableTitleBarStyleV2(),
          leftIcon: new EditableLeftIconV2({
            iconType: EditableLeftIconTypeV2.Back,
            onAction: () => {
              this.callbackResult = 'Left icon clicked';
            }
          })
        })

        Text(this.callbackResult)
          .fontSize(16)
          .padding({ top: 10 })

        EditableTitleBarV2({
          title: 'Menu Item Click',
          options: new EditableTitleBarStyleV2(),
          menuItems: [
            new EditableTitleBarMenuItemV2({
              value: $r('sys.media.ohos_ic_public_more'),
              action: () => {
                this.menuCallbackResult = 'Menu item clicked';
              }
            })
          ]
        })

        Text(this.menuCallbackResult)
          .fontSize(16)
          .padding({ top: 10 })

        EditableTitleBarV2({
          title: 'Save Button Click',
          options: new EditableTitleBarStyleV2(),
          saveButton: new EditableSaveButtonV2({
            isRequired: true,
            onAction: () => {
              this.saveCallbackResult = 'Save button clicked';
            }
          })
        })

        Text(this.saveCallbackResult)
          .fontSize(16)
          .padding({ top: 10 })

        EditableTitleBarV2({
          title: 'Default Focus Left',
          options: new EditableTitleBarStyleV2(),
          leftIcon: new EditableLeftIconV2({
            iconType: EditableLeftIconTypeV2.Back,
            defaultFocus: true
          })
        })

        EditableTitleBarV2({
          title: 'Default Focus Menu',
          options: new EditableTitleBarStyleV2(),
          menuItems: [
            new EditableTitleBarMenuItemV2({
              value: $r('sys.media.ohos_ic_public_more'),
              defaultFocus: true
            })
          ]
        })

        EditableTitleBarV2({
          title: 'Default Focus Save',
          options: new EditableTitleBarStyleV2(),
          saveButton: new EditableSaveButtonV2({
            isRequired: true,
            defaultFocus: true
          })
        })
      }
      .width('100%')
      .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
  }
}