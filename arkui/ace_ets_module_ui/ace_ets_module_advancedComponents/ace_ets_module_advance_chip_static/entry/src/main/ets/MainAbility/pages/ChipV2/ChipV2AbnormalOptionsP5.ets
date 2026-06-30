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
struct ChipV2AbnormalOptionsP5 {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }
  build() {
    Column() {
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('borderRadius') }) })
          .id('abn_borderRadius_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('borderRadius'),
            borderRadius: undefined,
          })
        }).id('abn_borderRadius_u')
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('size') }) })
          .id('abn_size_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('size'),
            size: undefined,
          })
        }).id('abn_size_u')
    }
    .width('100%')
    .padding(12)
  }
}
