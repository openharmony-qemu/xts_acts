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
struct ChipV2AbnormalComboP3 {
  build() {
    Column() {
      ChipV2({
          chipV2Options: new ChipV2Options({ prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon') }), suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), action: () => {} }), label: new ChipV2Label({ text: 'cmbC3' }) }),
        }).id('abn_cmbC3_d')
      ChipV2({
          chipV2Options: new ChipV2Options({ prefixIcon: new ChipV2PrefixImageIcon({ src: $r('app.media.icon'), fillColor: undefined, activatedFillColor: undefined }), suffixIcon: new ChipV2SuffixImageIcon({ src: $r('app.media.icon'), fillColor: undefined, activatedFillColor: undefined, action: () => {} }), label: new ChipV2Label({ text: 'cmbC3' }) }),
        }).id('abn_cmbC3_u')
    }
    .width('100%')
    .padding(12)
  }
}
