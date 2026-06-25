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
import { ChipGroupV2, ChipGroupV2Item } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipGroupV2AbnormalItem {
  build() {
    Scroll() {
      Column({ space: 12 }) {
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itPreIcon' } })] }).id('abn_itPreIcon_d')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itPreIcon' }, prefixIcon: undefined })] }).id('abn_itPreIcon_u')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itPreSym' } })] }).id('abn_itPreSym_d')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itPreSym' }, prefixSymbolIcon: undefined })] }).id('abn_itPreSym_u')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itSufIcon' } })] }).id('abn_itSufIcon_d')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itSufIcon' }, suffixIcon: undefined })] }).id('abn_itSufIcon_u')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itSufSym' } })] }).id('abn_itSufSym_d')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itSufSym' }, suffixSymbolIcon: undefined })] }).id('abn_itSufSym_u')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itAllowClose' } })] }).id('abn_itAllowClose_d')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itAllowClose' }, allowClose: undefined })] }).id('abn_itAllowClose_u')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itCloseIcon' } })] }).id('abn_itCloseIcon_d')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itCloseIcon' }, closeIcon: undefined })] }).id('abn_itCloseIcon_u')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itA11yDesc' } })] }).id('abn_itA11yDesc_d')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itA11yDesc' }, accessibilityDescription: undefined })] }).id('abn_itA11yDesc_u')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itA11yLv' } })] }).id('abn_itA11yLv_d')
        ChipGroupV2({ items: [new ChipGroupV2Item({ label: { text: 'itA11yLv' }, accessibilityLevel: undefined })] }).id('abn_itA11yLv_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
