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
struct ChipV2AbnormalOptionsP4 {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }
  build() {
    Column() {
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('backgroundColor') }) })
          .id('abn_backgroundColor_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('backgroundColor'),
            backgroundColor: undefined,
          })
        }).id('abn_backgroundColor_u')
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('activatedBgColor') }) })
          .id('abn_activatedBgColor_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('activatedBgColor'),
            activatedBackgroundColor: undefined,
          })
        }).id('abn_activatedBgColor_u')
    }
    .width('100%')
    .padding(12)
  }
}
