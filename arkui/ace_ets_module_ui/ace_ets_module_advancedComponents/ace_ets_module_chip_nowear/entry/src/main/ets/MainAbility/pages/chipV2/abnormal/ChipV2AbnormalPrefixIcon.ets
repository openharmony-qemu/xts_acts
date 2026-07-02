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
struct ChipV2AbnormalPrefixIcon {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'preSize' }),
          }),
        }).id('abn_preSize_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon'), size: undefined }), label: new ChipV2Label({ text: 'preSize' }),
          }),
        }).id('abn_preSize_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'preFill' }),
          }),
        }).id('abn_preFill_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon'), fillColor: undefined }), label: new ChipV2Label({ text: 'preFill' }),
          }),
        }).id('abn_preFill_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'preActFill' }),
          }),
        }).id('abn_preActFill_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon'), activatedFillColor: undefined }), label: new ChipV2Label({ text: 'preActFill' }),
          }),
        }).id('abn_preActFill_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon') }), label: new ChipV2Label({ text: 'preModifier' }),
          }),
        }).id('abn_preModifier_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon'), modifier: undefined }), label: new ChipV2Label({ text: 'preModifier' }),
          }),
        }).id('abn_preModifier_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixSymbolIcon({ activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16) }), label: new ChipV2Label({ text: 'preSymNormal' }),
          }),
        }).id('abn_preSymNormal_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixSymbolIcon({ normal: undefined, activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16) }), label: new ChipV2Label({ text: 'preSymNormal' }),
          }),
        }).id('abn_preSymNormal_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16) }), label: new ChipV2Label({ text: 'preSymAct' }),
          }),
        }).id('abn_preSymAct_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixSymbolIcon({ normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16), activated: undefined }), label: new ChipV2Label({ text: 'preSymAct' }),
          }),
        }).id('abn_preSymAct_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
