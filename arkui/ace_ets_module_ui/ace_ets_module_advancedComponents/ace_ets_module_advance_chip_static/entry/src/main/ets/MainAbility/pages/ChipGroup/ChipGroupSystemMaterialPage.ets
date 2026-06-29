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
import {
  ChipGroup,
  IconGroupSuffix,
  ChipGroupItemOptions,
} from '@ohos.arkui.advanced.ChipGroup';
import uiMaterial from '@ohos.arkui.uiMaterial';
import { Entry, Component, Column, $r, Builder, Margin } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ChipGroupSystemMaterialPage {
  @State selectedIndexes: Array<Int> = [0];

  @Builder
  suffixWithMaterial(): void {
    IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') },
        action: () => {},
      }],
      iconBackgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
      }),
    });
  }

  build() {
    Column() {
      ChipGroup({
        items: [
          { label: { text: '选项A' } } as ChipGroupItemOptions,
          { label: { text: '选项B' } } as ChipGroupItemOptions,
        ],
        selectedIndexes: this.selectedIndexes,
        backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
        }),
        onChange: (indexes: Array<Int>) => {
          this.selectedIndexes = indexes;
        },
      }).id('cg_bgSysMat_normal')

      ChipGroup({
        items: [
          { label: { text: '选项A' } } as ChipGroupItemOptions,
          { label: { text: '选项B' } } as ChipGroupItemOptions,
        ],
        selectedIndexes: this.selectedIndexes,
        selectedBackgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
        }),
        onChange: (indexes: Array<Int>) => {
          this.selectedIndexes = indexes;
        },
      }).id('cg_selBgMat_normal')

      ChipGroup({
        items: [
          { label: { text: '后缀' } } as ChipGroupItemOptions,
        ],
        selectedIndexes: [0],
        suffix: this.suffixWithMaterial,
        onChange: () => {},
      }).id('cg_sfxBgMat_normal')
    }
    .width('100%')
    .margin({ top: 20 } as Margin)
  }
}
