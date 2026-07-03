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
struct ChipV2AbnormalOptionsP6 {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }
  build() {
    Column() {
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('direction') }) })
          .id('abn_direction_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('direction'),
            direction: undefined,
          })
        }).id('abn_direction_u')
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('a11yDesc') }) })
          .id('abn_a11yDesc_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('a11yDesc'),
            accessibilityDescription: undefined,
          })
        }).id('abn_a11yDesc_u')
    }
    .width('100%')
    .padding(12)
  }
}
