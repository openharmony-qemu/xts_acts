/*
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

'use static';
import {
  Entry,
  ComponentV2,
  Column,
  $r,
  Local,
  SymbolGlyphModifier,
  ChipGroupV2,
  ChipGroupV2Item,
  ChipGroupV2Items,
  ChipV2ImageIconConfig,
  ChipGroupV2IconItemConfig,
} from '@kit.ArkUI';


function defaultChipGroupItems(): ChipGroupV2Items {
  return new ChipGroupV2Items([
    { label: { text: '项1' } },
    { label: { text: '项2' } },
  ]);
}

@Entry
@ComponentV2
struct ChipGroupV2AbnormalRoot {
  @Local selectedIndex: Array<Int> = [0]


  build() {
    Column() {
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
          }).id('abn_itemStyle_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: undefined,
          }).id('abn_itemStyle_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
          }).id('abn_selectedIndexes_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: undefined,
          }).id('abn_selectedIndexes_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
          }).id('abn_multiple_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            multiple: undefined,
          }).id('abn_multiple_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
          }).id('abn_chipGroupSpace_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            chipGroupSpace: undefined,
          }).id('abn_chipGroupSpace_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
          }).id('abn_chipGroupPadding_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            chipGroupPadding: undefined,
          }).id('abn_chipGroupPadding_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
          }).id('abn_onChange_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            onChange: undefined,
          }).id('abn_onChange_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
          }).id('abn_suffix_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            suffix: undefined,
          }).id('abn_suffix_u')
          ChipGroupV2({ items: defaultChipGroupItems() }).id('abn_itemsEmpty_d')
          ChipGroupV2({ items: new ChipGroupV2Items([]) }).id('abn_itemsEmpty_u')
      }
      .width('100%')
      .padding(12)
  }
}
