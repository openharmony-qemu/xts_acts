/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';
import { Chip, ChipOptions, LabelOptions } from '@ohos.arkui.advanced.Chip';
import uiMaterial from '@ohos.arkui.uiMaterial';
import { Entry, Component, Column, ColumnOptions, Row, $r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ChipOptionsBackgroundSystemMaterialPage {
  @State isActivated: boolean = true;
  private bgMaterial: uiMaterial.ImmersiveMaterial = new uiMaterial.ImmersiveMaterial({
    style: uiMaterial.ImmersiveStyle.REGULAR,
  });
  private actBgMaterial: uiMaterial.ImmersiveMaterial = new uiMaterial.ImmersiveMaterial({
    style: uiMaterial.ImmersiveStyle.THICK,
  });

  build() {
    Column({ space: 12 } as ColumnOptions) {
      Row() {
        Chip({
          label: { text: 'bgMat' } as LabelOptions,
          activated: false,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          backgroundSystemMaterial: this.bgMaterial,
        } as ChipOptions)
      }.id('chip_bgSysMat_normal')

      Row() {
        Chip({
          label: { text: 'actBgMat' } as LabelOptions,
          activated: this.isActivated,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          activatedBackgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          activatedBackgroundSystemMaterial: this.actBgMaterial,
        } as ChipOptions)
      }.id('chip_actBgSysMat_normal')
    }
    .width('100%')
    .padding(12)
  }
}
