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
struct ChipV2AbnormalComboP5 {
  build() {
    Column() {
      ChipV2({
          chipV2Options: new ChipV2Options({ label: new ChipV2Label({ text: 'cmbC5' }) }),
        }).id('abn_cmbC5_d')
      ChipV2({
          chipV2Options: new ChipV2Options({ backgroundSystemMaterial: undefined, activatedBackgroundSystemMaterial: undefined, label: new ChipV2Label({ text: 'cmbC5' }) }),
        }).id('abn_cmbC5_u')
    }
    .width('100%')
    .padding(12)
  }
}
