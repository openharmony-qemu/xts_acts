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
  ChipV2,
  ChipV2Options,
  ChipV2Label,
  ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon,
  ChipV2PrefixSymbolIcon,
  ChipV2SuffixSymbolIcon,
  ChipV2CloseIcon,
  LengthMetrics,
} from '@kit.ArkUI';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct ChipV2AbnormalSuffixIcon {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'sufSize' }),
          }),
        }).id('abn_sufSize_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), size: undefined }), label: new ChipV2Label({ text: 'sufSize' }),
          }),
        }).id('abn_sufSize_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'sufFill' }),
          }),
        }).id('abn_sufFill_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), fillColor: undefined }), label: new ChipV2Label({ text: 'sufFill' }),
          }),
        }).id('abn_sufFill_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'sufActFill' }),
          }),
        }).id('abn_sufActFill_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), activatedFillColor: undefined }), label: new ChipV2Label({ text: 'sufActFill' }),
          }),
        }).id('abn_sufActFill_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'sufModifier' }),
          }),
        }).id('abn_sufModifier_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), modifier: undefined }), label: new ChipV2Label({ text: 'sufModifier' }),
          }),
        }).id('abn_sufModifier_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), action: () => {} }), label: new ChipV2Label({ text: 'sufA11yLv' }),
          }),
        }).id('abn_sufA11yLv_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), accessibilityLevel: undefined, action: () => {} }), label: new ChipV2Label({ text: 'sufA11yLv' }),
          }),
        }).id('abn_sufA11yLv_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), action: () => {} }), label: new ChipV2Label({ text: 'sufA11yTx' }),
          }),
        }).id('abn_sufA11yTx_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), accessibilityText: undefined, action: () => {} }), label: new ChipV2Label({ text: 'sufA11yTx' }),
          }),
        }).id('abn_sufA11yTx_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), action: () => {} }), label: new ChipV2Label({ text: 'sufA11yDs' }),
          }),
        }).id('abn_sufA11yDs_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), accessibilityDescription: undefined, action: () => {} }), label: new ChipV2Label({ text: 'sufA11yDs' }),
          }),
        }).id('abn_sufA11yDs_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'sufAction' }),
          }),
        }).id('abn_sufAction_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), action: undefined }), label: new ChipV2Label({ text: 'sufAction' }),
          }),
        }).id('abn_sufAction_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {} }), label: new ChipV2Label({ text: 'sufSymNormal' }),
          }),
        }).id('abn_sufSymNormal_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: undefined, activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {} }), label: new ChipV2Label({ text: 'sufSymNormal' }),
          }),
        }).id('abn_sufSymNormal_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {} }), label: new ChipV2Label({ text: 'sufSymAct' }),
          }),
        }).id('abn_sufSymAct_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), activated: undefined, action: () => {} }), label: new ChipV2Label({ text: 'sufSymAct' }),
          }),
        }).id('abn_sufSymAct_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {} }), label: new ChipV2Label({ text: 'sufSymNormA11y' }),
          }),
        }).id('abn_sufSymNormA11y_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), normalAccessibility: undefined, action: () => {} }), label: new ChipV2Label({ text: 'sufSymNormA11y' }),
          }),
        }).id('abn_sufSymNormA11y_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: () => {} }), label: new ChipV2Label({ text: 'sufSymActA11y' }),
          }),
        }).id('abn_sufSymActA11y_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), activatedAccessibility: undefined, action: () => {} }), label: new ChipV2Label({ text: 'sufSymActA11y' }),
          }),
        }).id('abn_sufSymActA11y_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16) }), label: new ChipV2Label({ text: 'sufSymAction' }),
          }),
        }).id('abn_sufSymAction_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            suffixIcon: new ChipV2SuffixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), action: undefined }), label: new ChipV2Label({ text: 'sufSymAction' }),
          }),
        }).id('abn_sufSymAction_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
