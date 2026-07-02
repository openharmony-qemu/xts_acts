'use static';
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

import {
  Entry,
  ComponentV2,
  Column,
  $r,
  Local,
  SymbolGlyphModifier,
  LengthMetrics,
  ChipGroupV2,
  ChipGroupV2Item,
  ChipGroupV2Items,
  ChipGroupV2ItemStyle,
  ChipGroupV2Space,
  ChipGroupV2Padding,
  ChipGroupV2IconGroupSuffix,
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
struct ChipGroupV2AbnormalSpacePadding {
  @Local selectedIndex: Array<Int> = [0]


  build() {
    Column() {
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            chipGroupSpace: new ChipGroupV2Space({ startSpace: 10, endSpace: 10 }),
          }).id('abn_spcItem_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            chipGroupSpace: new ChipGroupV2Space({ itemSpace: undefined, startSpace: 10, endSpace: 10 }),
          }).id('abn_spcItem_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, endSpace: 10 }),
          }).id('abn_spcStart_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, startSpace: undefined, endSpace: 10 }),
          }).id('abn_spcStart_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, startSpace: 10 }),
          }).id('abn_spcEnd_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, startSpace: 10, endSpace: undefined }),
          }).id('abn_spcEnd_u')
      }
      .width('100%')
      .padding(12)
  }
}
