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
struct ChipV2AbnormalCloseIconP3 {
  build() {
    Column() {
      ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: new ChipV2CloseIcon({  }), label: new ChipV2Label({ text: 'closeA11yLv' }),
          }),
        }).id('abn_closeA11yLv_d')
      ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: new ChipV2CloseIcon({ accessibilityLevel: undefined }), label: new ChipV2Label({ text: 'closeA11yLv' }),
          }),
        }).id('abn_closeA11yLv_u')
    }
    .width('100%')
    .padding(12)
  }
}
