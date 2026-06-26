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
import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct TextPickerDialogSystemMaterial {
  private select: number | number[] = 0;
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5'];

  showDialog(systemMaterialValue: uiMaterial.Material | undefined) {
    this.getUIContext().showTextPickerDialog({
      range: this.fruits,
      selected: this.select,
      defaultPickerItemHeight: 40,
      systemMaterial: systemMaterialValue,
      onAccept: (value: TextPickerResult) => {
        this.select = value.index;
      },
      onCancel: () => {
        console.info('TextPickerDialog:onCancel()');
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

      Button('THIN')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THIN,
            interactive: true,
          }))
        })
        .id('THIN_ID')

      Button('THICK')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THICK,
            interactive: true,
          }))
        })
        .id('THICK_ID')

      Button('REGULAR')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.REGULAR,
            interactive: true,
          }))
        })
        .id('REGULAR_ID')

      Button('UNDEFINED')
        .onClick(() => {
          this.showDialog(undefined)
        })
        .id('undefinedID')

      Button('default')
        .onClick(() => {
          this.getUIContext().showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            defaultPickerItemHeight: 40,
            onAccept: (value: TextPickerResult) => {
              this.select = value.index;
            },
            onCancel: () => {
              console.info('TextPickerDialog:onCancel()');
            }
          });
        })
        .id('defaultID')
    }.width('100%')
  }
}
