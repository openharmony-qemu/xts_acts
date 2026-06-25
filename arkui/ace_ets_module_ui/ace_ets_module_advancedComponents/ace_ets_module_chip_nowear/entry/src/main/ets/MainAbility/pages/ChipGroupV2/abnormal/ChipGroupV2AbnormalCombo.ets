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
import {
  ChipGroupV2, ChipGroupV2Item, ChipGroupV2ItemStyle, ChipGroupV2Space,
  ChipGroupV2Padding, ChipGroupV2IconGroupSuffix, LengthMetrics,
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipGroupV2AbnormalCombo {
  @Local selectedIndex: Array<number> = [0]

  @Builder
  SfxG4D() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') }, action: () => {} }],
    })
  }

  @Builder
  SfxG4() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') }, action: () => {} }],
      iconBackgroundSystemMaterial: undefined,
    })
  }

  private defaultItems(): ChipGroupV2Item[] {
    return [new ChipGroupV2Item({ label: { text: '默认' } })];
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        ChipGroupV2({
          items: this.defaultItems(),
          selectedIndexes: this.selectedIndex,
          itemStyle: new ChipGroupV2ItemStyle({  }),
        }).id('abn_cmbG1_d')
        ChipGroupV2({
          items: this.defaultItems(),
          selectedIndexes: this.selectedIndex,
          itemStyle: new ChipGroupV2ItemStyle({
            backgroundColor: undefined,
            fontColor: undefined,
            selectedFontColor: undefined,
            selectedBackgroundColor: undefined,
          }),
        }).id('abn_cmbG1_u')
        ChipGroupV2({
          items: this.defaultItems(),
          selectedIndexes: this.selectedIndex,
          chipGroupSpace: new ChipGroupV2Space({  }),
        }).id('abn_cmbG2_d')
        ChipGroupV2({
          items: this.defaultItems(),
          selectedIndexes: this.selectedIndex,
          chipGroupSpace: new ChipGroupV2Space({ itemSpace: undefined, startSpace: undefined, endSpace: undefined }),
        }).id('abn_cmbG2_u')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'cmbG3' } })] }).id('abn_cmbG3_d')
        ChipGroupV2({
          items: [new ChipGroupV2Item({
            label: { text: 'cmbG3' },
            prefixIcon: undefined,
            suffixIcon: undefined,
            prefixSymbolIcon: undefined,
            suffixSymbolIcon: undefined,
          })],
        }).id('abn_cmbG3_u')
        ChipGroupV2({ items: this.defaultItems(), suffix: this.SfxG4D.bind(this) }).id('abn_cmbG4_d')
        ChipGroupV2({ items: this.defaultItems(), suffix: this.SfxG4.bind(this) }).id('abn_cmbG4_u')
        ChipGroupV2({
          items: this.defaultItems(),
          selectedIndexes: undefined,
        }).id('abn_cmbG5_d')
        ChipGroupV2({
          items: this.defaultItems(),
          selectedIndexes: undefined, multiple: undefined, onChange: undefined,
        }).id('abn_cmbG5_u')
        ChipGroupV2({
          items: this.defaultItems(),
          selectedIndexes: this.selectedIndex,
          itemStyle: new ChipGroupV2ItemStyle({  }),
        }).id('abn_cmbG6_d')
        ChipGroupV2({
          items: this.defaultItems(),
          selectedIndexes: this.selectedIndex,
          itemStyle: new ChipGroupV2ItemStyle({
            backgroundSystemMaterial: undefined,
            selectedBackgroundSystemMaterial: undefined,
          }),
        }).id('abn_cmbG6_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
