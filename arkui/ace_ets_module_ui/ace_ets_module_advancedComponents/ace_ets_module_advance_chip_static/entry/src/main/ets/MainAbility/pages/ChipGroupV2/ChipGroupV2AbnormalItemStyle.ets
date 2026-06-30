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
struct ChipGroupV2AbnormalItemStyle {
  @Local selectedIndex: Array<Int> = [0]


  build() {
    Column() {
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({  }),
          }).id('abn_stySize_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({ size: undefined }),
          }).id('abn_stySize_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({  }),
          }).id('abn_styBg_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({ backgroundColor: undefined }),
          }).id('abn_styBg_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({  }),
          }).id('abn_styFont_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({ fontColor: undefined }),
          }).id('abn_styFont_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({  }),
          }).id('abn_stySelFont_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({ selectedFontColor: undefined }),
          }).id('abn_stySelFont_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({  }),
          }).id('abn_stySelBg_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({ selectedBackgroundColor: undefined }),
          }).id('abn_stySelBg_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({  }),
          }).id('abn_styBgMat_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({ backgroundSystemMaterial: undefined }),
          }).id('abn_styBgMat_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({  }),
          }).id('abn_stySelBgMat_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            selectedIndexes: this.selectedIndex,
            itemStyle: new ChipGroupV2ItemStyle({ selectedBackgroundSystemMaterial: undefined }),
          }).id('abn_stySelBgMat_u')
      }
      .width('100%')
      .padding(12)
  }
}
