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
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2AbnormalCloseIconP1 {
  build() {
    Column() {
      ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'closeIcon' }),
          }),
        }).id('abn_closeIcon_d')
      ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: undefined, label: new ChipV2Label({ text: 'closeIcon' }),
          }),
        }).id('abn_closeIcon_u')
    }
    .width('100%')
    .padding(12)
  }
}
