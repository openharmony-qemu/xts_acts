'use static';
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

import { Chip, ChipOptions, LabelOptions } from '@ohos.arkui.advanced.Chip';
import { Entry, Component, Column, ColumnOptions, Row, $r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ChipAbnormalBackgroundSystemMaterial {
  @State isActivated: boolean = true;

  build() {
    Column({ space: 12 } as ColumnOptions) {
      Row() {
        Chip({
          label: { text: 'bgMat' } as LabelOptions,
          activated: false,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        } as ChipOptions)
      }.id('abn_bgSysMat_d')

      Row() {
        Chip({
          label: { text: 'bgMat' } as LabelOptions,
          activated: false,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        } as ChipOptions)
      }.id('abn_bgSysMat_u')

      Row() {
        Chip({
          label: { text: 'actBgMat' } as LabelOptions,
          activated: this.isActivated,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          activatedBackgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        } as ChipOptions)
      }.id('abn_actBgSysMat_d')

      Row() {
        Chip({
          label: { text: 'actBgMat' } as LabelOptions,
          activated: this.isActivated,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          activatedBackgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        } as ChipOptions)
      }.id('abn_actBgSysMat_u')
    }
    .width('100%')
    .padding(12)
  }
}
