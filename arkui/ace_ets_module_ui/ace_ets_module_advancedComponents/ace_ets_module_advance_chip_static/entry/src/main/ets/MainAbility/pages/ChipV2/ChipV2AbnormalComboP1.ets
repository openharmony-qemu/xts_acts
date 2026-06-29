'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import {
  Entry,
  ComponentV2,
  Column,
  ChipV2,
  ChipV2Label,
  ChipV2Options,
  ChipV2PrefixImageIcon,
  ChipV2PrefixSymbolIcon,
  ChipV2SuffixImageIcon,
  ChipV2SuffixSymbolIcon,
  LengthMetrics,
  SymbolGlyphModifier,
  $r,
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2AbnormalComboP1 {
  build() {
    Column() {
      ChipV2({
          chipV2Options: new ChipV2Options({ label: new ChipV2Label({ text: 'cmbC1' }) }),
        }).id('abn_cmbC1_d')
      ChipV2({
          chipV2Options: new ChipV2Options({ backgroundColor: undefined, activatedBackgroundColor: undefined, label: new ChipV2Label({ text: 'cmbC1', fontColor: undefined, activatedFontColor: undefined }) }),
        }).id('abn_cmbC1_u')
    }
    .width('100%')
    .padding(12)
  }
}
