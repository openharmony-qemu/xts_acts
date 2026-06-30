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
import { Entry, Component, Column, $r, Builder } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ChipGroupAbnormalSystemMaterial {
  @State selectedIndexes: Array<Int> = [0];

  private defaultItems(): ChipGroupItemOptions[] {
    return [
      { label: { text: '项1' } } as ChipGroupItemOptions,
      { label: { text: '项2' } } as ChipGroupItemOptions,
    ];
  }

  @Builder
  SuffixD_sfxBgMat(): void {
    IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') },
        action: () => {},
      }],
    });
  }

  @Builder
  Suffix_sfxBgMat(): void {
    IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') },
        action: () => {},
      }],
      iconBackgroundSystemMaterial: undefined,
    });
  }

  build() {
    Column() {
      ChipGroup({
        items: this.defaultItems(),
        selectedIndexes: this.selectedIndexes,
        onChange: (indexes: Array<Int>) => {
          this.selectedIndexes = indexes;
        },
      }).id('abn_bgSysMat_d')
      ChipGroup({
        items: this.defaultItems(),
        selectedIndexes: this.selectedIndexes,
        backgroundSystemMaterial: undefined,
        onChange: (indexes: Array<Int>) => {
          this.selectedIndexes = indexes;
        },
      }).id('abn_bgSysMat_u')

      ChipGroup({
        items: this.defaultItems(),
        selectedIndexes: this.selectedIndexes,
        onChange: (indexes: Array<Int>) => {
          this.selectedIndexes = indexes;
        },
      }).id('abn_selBgMat_d')
      ChipGroup({
        items: this.defaultItems(),
        selectedIndexes: this.selectedIndexes,
        selectedBackgroundSystemMaterial: undefined,
        onChange: (indexes: Array<Int>) => {
          this.selectedIndexes = indexes;
        },
      }).id('abn_selBgMat_u')
      ChipGroup({
        items: this.defaultItems(),
        selectedIndexes: [0],
        suffix: this.SuffixD_sfxBgMat,
        onChange: () => {},
      }).id('abn_sfxBgMat_d')
      ChipGroup({
        items: this.defaultItems(),
        selectedIndexes: [0],
        suffix: this.Suffix_sfxBgMat,
        onChange: () => {},
      }).id('abn_sfxBgMat_u')
    }
    .width('100%')
    .padding(12)
  }
}
