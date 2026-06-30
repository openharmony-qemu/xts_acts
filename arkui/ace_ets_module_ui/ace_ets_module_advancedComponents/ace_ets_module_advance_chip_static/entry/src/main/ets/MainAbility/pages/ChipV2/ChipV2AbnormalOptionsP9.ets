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
struct ChipV2AbnormalOptionsP9 {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }
  build() {
    Column() {
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('padding') }) })
          .id('abn_padding_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('padding'),
            padding: undefined,
          })
        }).id('abn_padding_u')
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('fontSize') }) })
          .id('abn_fontSize_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('fontSize'),
            fontSize: undefined,
          })
        }).id('abn_fontSize_u')
    }
    .width('100%')
    .padding(12)
  }
}
