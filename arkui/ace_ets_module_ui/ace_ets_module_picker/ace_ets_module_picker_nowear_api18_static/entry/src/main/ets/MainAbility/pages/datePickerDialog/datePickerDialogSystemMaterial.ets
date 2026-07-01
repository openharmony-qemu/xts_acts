'use static';
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
import { Entry, Component, Button, ClickEvent, Flex, FlexWrap } from '@ohos.arkui.component'
import uiMaterial from '@ohos.arkui.uiMaterial'

@Entry
@Component
struct DatePickerDialogSystemMaterial {
  private selectedDate: Date = new Date('2010-01-01');

  showDialog(materialValue: uiMaterial.Material | undefined) {
    this.getUIContext().showDatePickerDialog({
      start: new Date('2000-01-01'),
      end: new Date('2100-12-31'),
      selected: this.selectedDate,
      systemMaterial: materialValue,
      onDateAccept: (value: Date) => {
        this.selectedDate = value;
      },
      onCancel: () => {
        console.info('DatePickerDialog:onCancel()');
      }
    });
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Button('ULTRA_THICK')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            interactive: true,
          }))
        })
        .id('ULTRA_THICK_ID')

      Button('THICK')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THICK,
            interactive: true,
          }))
        })
        .id('THICK_ID')

      Button('THIN')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THIN,
            interactive: true,
          }))
        })
        .id('THIN_ID')

      Button('REGULAR')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.REGULAR,
            interactive: true,
          }))
        })
        .id('REGULAR_ID')

      Button('ULTRA_THIN')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
            interactive: true,
          }))
        })
        .id('ULTRA_THIN_ID')

      Button('interactive_false')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            interactive: false,
          }))
        })
        .id('interactive_false_ID')

      Button('undefined')
        .onClick(() => {
          this.showDialog(undefined)
        })
        .id('undefinedID')

      Button('default')
        .onClick(() => {
          this.getUIContext().showDatePickerDialog({
            start: new Date('2000-01-01'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            onDateAccept: (value: Date) => {
              this.selectedDate = value;
            },
            onCancel: () => {
              console.info('DatePickerDialog:onCancel()');
            }
          });
        })
        .id('defaultID')
    }.width('100%')
  }
}
