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
struct ChipV2AbnormalComboP7 {
  build() {
    Column() {
      ChipV2({
          chipV2Options: new ChipV2Options({ prefixIcon: new ChipV2PrefixSymbolIcon({  }), suffixIcon: new ChipV2SuffixSymbolIcon({ action: () => {} }), label: new ChipV2Label({ text: 'cmbC7' }) }),
        }).id('abn_cmbC7_d')
      ChipV2({
          chipV2Options: new ChipV2Options({ prefixIcon: new ChipV2PrefixSymbolIcon({ normal: undefined, activated: undefined }), suffixIcon: new ChipV2SuffixSymbolIcon({ normal: undefined, activated: undefined, action: () => {} }), label: new ChipV2Label({ text: 'cmbC7' }) }),
        }).id('abn_cmbC7_u')
    }
    .width('100%')
    .padding(12)
  }
}
