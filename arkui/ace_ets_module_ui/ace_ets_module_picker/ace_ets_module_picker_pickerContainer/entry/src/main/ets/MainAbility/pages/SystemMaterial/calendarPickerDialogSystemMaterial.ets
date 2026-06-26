/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct CalendarPickerDialogSystemMaterial {
  private selectedDate: Date = new Date('2024-04-23')

  showDialog(material: uiMaterial.Material | null | undefined) {
    CalendarPickerDialog.show({
      selected: this.selectedDate,
      systemMaterial: material,
    })
  }

  build() {
    Column({ space: 10 }) {
      Button('ULTRA_THICK_interactive_true')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            interactive: true,
          }))
        })
        .id('ULTRA_THICK_interactive_true_ID')

      Button('ULTRA_THIN_interactive_true')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
            interactive: true,
          }))
        })
        .id('ULTRA_THIN_interactive_true_ID')

      Button('ULTRA_THICK_interactive_false')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            interactive: false,
          }))
        })
        .id('ULTRA_THICK_interactive_false_ID')

      Button('ULTRA_THICK_lightEffect')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            interactive: true,
            lightEffect: { color: undefined },
          }))
        })
        .id('ULTRA_THICK_lightEffect_ID')

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

      Button('undefined')
        .onClick(() => {
          this.showDialog(undefined)
        })
        .id('undefinedID')
      
      Button('null')
        .onClick(() => {
          this.showDialog(null)
        })
        .id('nullID')
    }
    .width('100%')
    .height('100%')
  }
}
