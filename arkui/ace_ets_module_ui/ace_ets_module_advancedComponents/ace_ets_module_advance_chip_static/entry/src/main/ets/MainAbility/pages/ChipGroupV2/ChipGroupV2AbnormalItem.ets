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
  Builder,
  SymbolGlyphModifier,
  ChipGroupV2,
  ChipGroupV2Item,
  ChipGroupV2Items,
  ChipV2ImageIconConfig,
  ChipGroupV2IconItemConfig,
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipGroupV2AbnormalItem {
  @Builder
  abnChipGroupV2ItemPart1(): void {
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itPreIcon' } }]) }).id('abn_itPreIcon_d')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itPreIcon' }, prefixIcon: undefined }]) }).id('abn_itPreIcon_u')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itPreSym' } }]) }).id('abn_itPreSym_d')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itPreSym' }, prefixSymbolIcon: undefined }]) }).id('abn_itPreSym_u')
  }

  @Builder
  abnChipGroupV2ItemPart2(): void {
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itSufIcon' } }]) }).id('abn_itSufIcon_d')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itSufIcon' }, suffixIcon: undefined }]) }).id('abn_itSufIcon_u')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itSufSym' } }]) }).id('abn_itSufSym_d')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itSufSym' }, suffixSymbolIcon: undefined }]) }).id('abn_itSufSym_u')
  }

  @Builder
  abnChipGroupV2ItemPart3(): void {
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itAllowClose' } }]) }).id('abn_itAllowClose_d')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itAllowClose' }, allowClose: undefined }]) }).id('abn_itAllowClose_u')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itCloseIcon' } }]) }).id('abn_itCloseIcon_d')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itCloseIcon' }, closeIcon: undefined }]) }).id('abn_itCloseIcon_u')
  }

  @Builder
  abnChipGroupV2ItemPart4(): void {
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itA11yDesc' } }]) }).id('abn_itA11yDesc_d')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itA11yDesc' }, accessibilityDescription: undefined }]) }).id('abn_itA11yDesc_u')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itA11yLv' } }]) }).id('abn_itA11yLv_d')
          ChipGroupV2({ items: new ChipGroupV2Items([{ label: { text: 'itA11yLv' }, accessibilityLevel: undefined }]) }).id('abn_itA11yLv_u')
  }

  build() {
    Column() {
      this.abnChipGroupV2ItemPart1()
      this.abnChipGroupV2ItemPart2()
      this.abnChipGroupV2ItemPart3()
      this.abnChipGroupV2ItemPart4()
    }
      .width('100%')
      .padding(12)
  }
}