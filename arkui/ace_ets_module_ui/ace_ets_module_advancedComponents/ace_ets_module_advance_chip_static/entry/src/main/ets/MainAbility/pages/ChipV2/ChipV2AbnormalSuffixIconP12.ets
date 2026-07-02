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
  ChipV2CloseIcon,
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
struct ChipV2AbnormalSuffixIconP12 {
  build() {
    Column() {
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
    }
    .width('100%')
    .padding(12)
  }
}
