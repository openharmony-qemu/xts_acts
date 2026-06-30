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
  Builder,
  $r,
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
struct ChipGroupV2AbnormalSuffix {
  @Builder
  SuffixD_sfxBgMat() {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        action: () => {},
      } as ChipGroupV2IconItemConfig],
    })
  }

  @Builder
  Suffix_sfxBgMat() {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        action: () => {},
      } as ChipGroupV2IconItemConfig],
      iconBackgroundSystemMaterial: undefined,
    })
  }

  @Builder
  SuffixD_sfxA11yTx() {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        action: () => {},
      } as ChipGroupV2IconItemConfig],
    })
  }

  @Builder
  Suffix_sfxA11yTx() {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        action: () => {},
        accessibilityText: undefined,
      } as ChipGroupV2IconItemConfig],
    })
  }

  @Builder
  SuffixD_sfxA11yDs() {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        action: () => {},
      } as ChipGroupV2IconItemConfig],
    })
  }

  @Builder
  Suffix_sfxA11yDs() {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        action: () => {},
        accessibilityDescription: undefined,
      } as ChipGroupV2IconItemConfig],
    })
  }

  @Builder
  SuffixD_sfxA11yLv() {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        action: () => {},
      } as ChipGroupV2IconItemConfig],
    })
  }

  @Builder
  Suffix_sfxA11yLv() {
    ChipGroupV2IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as ChipV2ImageIconConfig,
        action: () => {},
        accessibilityLevel: undefined,
      } as ChipGroupV2IconItemConfig],
    })
  }

  @Builder
  SuffixD_sfxSymA11yTx() {
    ChipGroupV2IconGroupSuffix({
      items: [{ symbol: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {} }],
    })
  }

  @Builder
  Suffix_sfxSymA11yTx() {
    ChipGroupV2IconGroupSuffix({
      items: [{ symbol: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {}, accessibilityText: undefined }],
    })
  }

  @Builder
  SuffixD_sfxSymA11yDs() {
    ChipGroupV2IconGroupSuffix({
      items: [{ symbol: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {} }],
    })
  }

  @Builder
  Suffix_sfxSymA11yDs() {
    ChipGroupV2IconGroupSuffix({
      items: [{ symbol: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {}, accessibilityDescription: undefined }],
    })
  }

  @Builder
  SuffixD_sfxSymA11yLv() {
    ChipGroupV2IconGroupSuffix({
      items: [{ symbol: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {} }],
    })
  }

  @Builder
  Suffix_sfxSymA11yLv() {
    ChipGroupV2IconGroupSuffix({
      items: [{ symbol: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {}, accessibilityLevel: undefined }],
    })
  }


  build() {
    Column() {
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.SuffixD_sfxBgMat,
          }).id('abn_sfxBgMat_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.Suffix_sfxBgMat,
          }).id('abn_sfxBgMat_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.SuffixD_sfxA11yTx,
          }).id('abn_sfxA11yTx_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.Suffix_sfxA11yTx,
          }).id('abn_sfxA11yTx_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.SuffixD_sfxA11yDs,
          }).id('abn_sfxA11yDs_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.Suffix_sfxA11yDs,
          }).id('abn_sfxA11yDs_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.SuffixD_sfxA11yLv,
          }).id('abn_sfxA11yLv_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.Suffix_sfxA11yLv,
          }).id('abn_sfxA11yLv_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.SuffixD_sfxSymA11yTx,
          }).id('abn_sfxSymA11yTx_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.Suffix_sfxSymA11yTx,
          }).id('abn_sfxSymA11yTx_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.SuffixD_sfxSymA11yDs,
          }).id('abn_sfxSymA11yDs_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.Suffix_sfxSymA11yDs,
          }).id('abn_sfxSymA11yDs_u')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.SuffixD_sfxSymA11yLv,
          }).id('abn_sfxSymA11yLv_d')
          ChipGroupV2({
            items: defaultChipGroupItems(),
            suffix: this.Suffix_sfxSymA11yLv,
          }).id('abn_sfxSymA11yLv_u')
      }
      .width('100%')
      .padding(12)
  }
}
