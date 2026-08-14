'use static';
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
  Entry,
  Column,
  ComponentV2,
  Color,
  $r,
  ColumnOptions,
  Local,
  ChipV2Size,
  ChipGroupV2,
  ChipGroupV2Items,
  ChipGroupV2IconGroupSuffix,
  SymbolGlyphModifier,
  ChipGroupV2ItemStyle,
  ChipGroupV2Space,
  ChipGroupV2Padding,
  ColorMetrics,
  ChipV2PrefixImageIconConfig,
  ChipV2PrefixSymbolIconConfig,
  ChipV2SuffixSymbolIconConfig,
  ChipGroupV2ItemConfig,
  ChipGroupV2IconItemConfig,
  ChipV2ImageIconConfig,
  LengthMetrics,
  SizeT,
  Callback
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipGroupV2IconItemOptionsPage {
  @Local selectedIndex: Array<Int> = [0, 1, 2, 3, 4, 5, 6];
  @Local selectedState: boolean = true;
  @Local prefixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'));
  @Local prefixModifierActivated: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Red]);
  @Local suffixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @Local suffixModifierActivated: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Red]);

  aaa: Callback<ChipGroupV2Items> = () =>{
    console.info('ChipGroupV2 on $items')
  }
  bbb: Callback<Array<int>>= () =>{
    console.info('ChipGroupV2 on $selectedIndexes')
  }

  @Builder
  ChipGroupSuffix(): void {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        accessibilityText: 'IconGroupSuffix_accessibilityText',
        accessibilityDescription: 'IconGroupSuffix_accessibilityDescription',
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
      } as ChipGroupV2IconItemConfig
      ]
    })
  }

  build() {
    Column() {
      ChipGroupV2({
        $items: this.aaa,
        items: new ChipGroupV2Items([
          {
            prefixSymbolIcon: {
              normal: this.prefixModifierNormal,
              activated: this.prefixModifierActivated
            } as ChipV2PrefixSymbolIconConfig,
            label: { text: '操作块1' },
            suffixSymbolIcon: {
              normal: this.suffixModifierNormal,
              activated: this.suffixModifierActivated
            } as ChipV2SuffixSymbolIconConfig,
            accessibilityDescription: 'ChipGroupV2Item_accessibilityDescription',
            accessibilityLevel: 'yes',
            allowClose: false,
          } as ChipGroupV2ItemConfig,
          {
            prefixIcon: {
              src: $r('sys.media.ohos_ic_public_clock'),
              size: { width: LengthMetrics.vp(36), height: LengthMetrics.vp(36) } as SizeT<LengthMetrics>
            } as ChipV2PrefixImageIconConfig,
            label: { text: '操作块2' },
            accessibilityLevel: 'no',
            allowClose: true,
          } as ChipGroupV2ItemConfig,
        ]),
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        $selectedIndexes: this.bbb,
        selectedIndexes: this.selectedIndex,
        multiple: true,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: 10, bottom: 10 }),
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        },
        suffix: this.ChipGroupSuffix
      })
    }
  }
}
