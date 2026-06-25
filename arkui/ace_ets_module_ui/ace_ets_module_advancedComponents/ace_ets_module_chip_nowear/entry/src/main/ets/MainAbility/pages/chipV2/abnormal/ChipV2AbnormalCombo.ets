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
  ChipV2, ChipV2Options, ChipV2Label, ChipV2PrefixImageIcon, ChipV2SuffixImageIcon,
  ChipV2PrefixSymbolIcon, ChipV2SuffixSymbolIcon, LengthMetrics,
} from '@kit.ArkUI';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct ChipV2AbnormalCombo {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({ label: new ChipV2Label({ text: 'cmbC1' }) }),
        }).id('abn_cmbC1_d')
        ChipV2({
          chipV2Options: new ChipV2Options({ backgroundColor: undefined, activatedBackgroundColor: undefined, label: new ChipV2Label({ text: 'cmbC1', fontColor: undefined, activatedFontColor: undefined }) }),
        }).id('abn_cmbC1_u')
        ChipV2({
          chipV2Options: new ChipV2Options({ label: new ChipV2Label({ text: 'cmbC2' }) }),
        }).id('abn_cmbC2_d')
        ChipV2({
          chipV2Options: new ChipV2Options({ accessibilityDescription: undefined, accessibilityLevel: undefined, accessibilitySelectedType: undefined, label: new ChipV2Label({ text: 'cmbC2' }) }),
        }).id('abn_cmbC2_u')
        ChipV2({
          chipV2Options: new ChipV2Options({ prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon') }), suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), action: () => {} }), label: new ChipV2Label({ text: 'cmbC3' }) }),
        }).id('abn_cmbC3_d')
        ChipV2({
          chipV2Options: new ChipV2Options({ prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon'), fillColor: undefined, activatedFillColor: undefined }), suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), fillColor: undefined, activatedFillColor: undefined, action: () => {} }), label: new ChipV2Label({ text: 'cmbC3' }) }),
        }).id('abn_cmbC3_u')
        ChipV2({
          chipV2Options: new ChipV2Options({ label: new ChipV2Label({ text: 'cmbC4' }) }),
        }).id('abn_cmbC4_d')
        ChipV2({
          chipV2Options: new ChipV2Options({ size: undefined, fontSize: undefined, maxFontScale: undefined, minFontScale: undefined, label: new ChipV2Label({ text: 'cmbC4' }) }),
        }).id('abn_cmbC4_u')
        ChipV2({
          chipV2Options: new ChipV2Options({ label: new ChipV2Label({ text: 'cmbC5' }) }),
        }).id('abn_cmbC5_d')
        ChipV2({
          chipV2Options: new ChipV2Options({ backgroundSystemMaterial: undefined, activatedBackgroundSystemMaterial: undefined, label: new ChipV2Label({ text: 'cmbC5' }) }),
        }).id('abn_cmbC5_u')
        ChipV2({
          chipV2Options: new ChipV2Options({ label: new ChipV2Label({ text: 'cmbC6' }) }),
        }).id('abn_cmbC6_d')
        ChipV2({
          chipV2Options: new ChipV2Options({ padding: undefined, label: new ChipV2Label({ text: 'cmbC6', labelMargin: undefined, localizedLabelMargin: undefined }) }),
        }).id('abn_cmbC6_u')
        ChipV2({
          chipV2Options: new ChipV2Options({ prefixIcon: new ChipV2PrefixSymbolIcon({  }), suffixIcon: new ChipV2SuffixSymbolIcon({ action: () => {} }), label: new ChipV2Label({ text: 'cmbC7' }) }),
        }).id('abn_cmbC7_d')
        ChipV2({
          chipV2Options: new ChipV2Options({ prefixIcon: new ChipV2PrefixSymbolIcon({ normal: undefined, activated: undefined }), suffixIcon: new ChipV2SuffixSymbolIcon({ normal: undefined, activated: undefined, action: () => {} }), label: new ChipV2Label({ text: 'cmbC7' }) }),
        }).id('abn_cmbC7_u')
        ChipV2({
          chipV2Options: new ChipV2Options({ label: new ChipV2Label({ text: 'cmbC8' }) }),
        }).id('abn_cmbC8_d')
        ChipV2({
          chipV2Options: new ChipV2Options({ onClose: undefined, onClicked: undefined, label: new ChipV2Label({ text: 'cmbC8' }) }),
        }).id('abn_cmbC8_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
