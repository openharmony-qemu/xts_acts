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
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2AbnormalOptionsP2 {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }
  build() {
    Column() {
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('allowClose') }) })
          .id('abn_allowClose_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('allowClose'),
            allowClose: undefined,
          })
        }).id('abn_allowClose_u')
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('closeIcon') }) })
          .id('abn_closeIcon_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('closeIcon'),
            closeIcon: undefined,
          })
        }).id('abn_closeIcon_u')
    }
    .width('100%')
    .padding(12)
  }
}
