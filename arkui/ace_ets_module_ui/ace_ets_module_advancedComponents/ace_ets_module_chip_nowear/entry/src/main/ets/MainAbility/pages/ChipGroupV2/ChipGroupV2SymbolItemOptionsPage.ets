/**
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
  ChipGroupV2,
  ChipGroupV2IconGroupSuffix,
  ChipGroupV2Item,
  ChipGroupV2ItemStyle,
  ChipGroupV2Space,
  ChipGroupV2Padding,
  ChipV2Size,
  ColorMetrics,
  LengthMetrics,
  SymbolGlyphModifier
} from '@kit.ArkUI'

@Entry
@Preview
@ComponentV2
struct ChipGroupV2SymbolItemOptionsPage {
  @Local selectedIndex: Array<number> = [0, 1, 2, 3, 4, 5, 6];
  @Local selectedState: boolean = true;
  @Local prefixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'));
  @Local prefixModifierActivated: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Red]);
  @Local suffixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @Local suffixModifierActivated: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Red]);

  @Builder
  ChipGroupSuffixV2(): void {
    ChipGroupV2IconGroupSuffix({
      items: [
        {
          symbol: this.suffixModifierNormal,
          accessibilityText: 'ChipGroupV2IconGroupSuffix_accessibilityText',
          accessibilityDescription: 'ChipGroupV2IconGroupSuffix_accessibilityDescription',
          accessibilityLevel: 'yes',
          action: () => {
            if (this.selectedState == false) {
              this.selectedIndex = [0, 1, 2, 3, 4, 5, 6]
              this.selectedState = true
            } else {
              this.selectedIndex = []
              this.selectedState = false
            }
          }
        },
        {
          symbol: this.suffixModifierNormal,
          accessibilityText: 'ChipGroupV2IconGroupSuffix_accessibilityText_2',
          accessibilityDescription: 'ChipGroupV2IconGroupSuffix_accessibilityDescription_2',
          accessibilityLevel: 'no',
          action: () => {
            if (this.selectedState == false) {
              this.selectedIndex = [0, 1, 2, 3, 4, 5, 6]
              this.selectedState = true
            } else {
              this.selectedIndex = []
              this.selectedState = false
            }
          }
        },
        {
          symbol: this.suffixModifierNormal,
          accessibilityText: 'ChipGroupV2IconGroupSuffix_accessibilityText_3',
          accessibilityDescription: 'ChipGroupV2IconGroupSuffix_accessibilityDescription_3',
          accessibilityLevel: 'auto',
          action: () => {
            if (this.selectedState == false) {
              this.selectedIndex = [0, 1, 2, 3, 4, 5, 6]
              this.selectedState = true
            } else {
              this.selectedIndex = []
              this.selectedState = false
            }
          }
        },
        {
          symbol: this.suffixModifierNormal,
          accessibilityText: 'ChipGroupV2IconGroupSuffix_accessibilityText_4',
          accessibilityDescription: 'ChipGroupV2IconGroupSuffix_accessibilityDescription_4',
          accessibilityLevel: 'no-hide-descendants',
          action: () => {
            if (this.selectedState == false) {
              this.selectedIndex = [0, 1, 2, 3, 4, 5, 6]
              this.selectedState = true
            } else {
              this.selectedIndex = []
              this.selectedState = false
            }
          }
        }]
    })
  }

  build() {
    Column() {
      ChipGroupV2({
        items: [
          new ChipGroupV2Item({
            prefixSymbolIcon: { normal: this.prefixModifierNormal, activated: this.prefixModifierActivated },
            label: { text: '操作块1' },
            suffixSymbolIcon: { normal: this.suffixModifierNormal, activated: this.suffixModifierActivated },
            accessibilityDescription: 'ChipGroupV2Item_accessibilityDescription',
            accessibilityLevel: 'auto',
            allowClose: false,
          }),
          new ChipGroupV2Item({
            prefixIcon: {
              src: $r('sys.media.ohos_ic_public_clock'),
              size: { width: LengthMetrics.vp(36), height: LengthMetrics.vp(36) }
            },
            label: { text: '操作块2' },
            accessibilityLevel: 'no-hide-descendants',
            allowClose: true,
          }),
        ],
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: true,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: 10, bottom: 10 }),
        onChange: (activatedChipsIndex: Array<number>) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        },
        suffix: this.ChipGroupSuffixV2.bind(this)
      })
    }
  }
}