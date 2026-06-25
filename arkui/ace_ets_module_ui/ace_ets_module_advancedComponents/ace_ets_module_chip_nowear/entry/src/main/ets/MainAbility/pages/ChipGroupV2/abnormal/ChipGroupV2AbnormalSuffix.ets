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
  ChipGroupV2,
  ChipGroupV2Item,
  ChipGroupV2ItemStyle,
  ChipGroupV2Space,
  ChipGroupV2Padding,
  ChipGroupV2IconGroupSuffix,
  LengthMetrics,
} from '@kit.ArkUI';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct ChipGroupV2AbnormalSuffix {
  @Builder
  SuffixD_sfxBgMat() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') },
        action: () => {} }],
    })
  }

  @Builder
  Suffix_sfxBgMat() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') },
        action: () => {} }],
      iconBackgroundSystemMaterial: undefined,
    })
  }

  @Builder
  SuffixD_sfxA11yTx() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') }, action: () => {} }],
    })
  }

  @Builder
  Suffix_sfxA11yTx() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') }, action: () => {}, accessibilityText: undefined }],
    })
  }

  @Builder
  SuffixD_sfxA11yDs() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') }, action: () => {} }],
    })
  }

  @Builder
  Suffix_sfxA11yDs() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') }, action: () => {}, accessibilityDescription: undefined }],
    })
  }

  @Builder
  SuffixD_sfxA11yLv() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') }, action: () => {} }],
    })
  }

  @Builder
  Suffix_sfxA11yLv() {
    ChipGroupV2IconGroupSuffix({
      items: [{ icon: { src: $r('sys.media.ohos_ic_public_search_filled') }, action: () => {}, accessibilityLevel: undefined }],
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

  private defaultItems(): ChipGroupV2Item[] {
    return [new ChipGroupV2Item({ label: { text: '项1' } })];
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.SuffixD_sfxBgMat.bind(this),
        }).id('abn_sfxBgMat_d')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.Suffix_sfxBgMat.bind(this),
        }).id('abn_sfxBgMat_u')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.SuffixD_sfxA11yTx.bind(this),
        }).id('abn_sfxA11yTx_d')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.Suffix_sfxA11yTx.bind(this),
        }).id('abn_sfxA11yTx_u')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.SuffixD_sfxA11yDs.bind(this),
        }).id('abn_sfxA11yDs_d')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.Suffix_sfxA11yDs.bind(this),
        }).id('abn_sfxA11yDs_u')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.SuffixD_sfxA11yLv.bind(this),
        }).id('abn_sfxA11yLv_d')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.Suffix_sfxA11yLv.bind(this),
        }).id('abn_sfxA11yLv_u')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.SuffixD_sfxSymA11yTx.bind(this),
        }).id('abn_sfxSymA11yTx_d')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.Suffix_sfxSymA11yTx.bind(this),
        }).id('abn_sfxSymA11yTx_u')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.SuffixD_sfxSymA11yDs.bind(this),
        }).id('abn_sfxSymA11yDs_d')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.Suffix_sfxSymA11yDs.bind(this),
        }).id('abn_sfxSymA11yDs_u')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.SuffixD_sfxSymA11yLv.bind(this),
        }).id('abn_sfxSymA11yLv_d')
        ChipGroupV2({
          items: this.defaultItems(),
          suffix: this.Suffix_sfxSymA11yLv.bind(this),
        }).id('abn_sfxSymA11yLv_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
