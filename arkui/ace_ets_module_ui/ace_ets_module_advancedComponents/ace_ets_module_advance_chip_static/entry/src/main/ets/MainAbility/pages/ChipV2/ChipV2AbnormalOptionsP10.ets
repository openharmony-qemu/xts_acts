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
struct ChipV2AbnormalOptionsP10 {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }
  build() {
    Column() {
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('actBgSysMaterial') }) })
          .id('abn_actBgSysMaterial_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('actBgSysMaterial'),
            activatedBackgroundSystemMaterial: undefined,
          })
        }).id('abn_actBgSysMaterial_u')
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('onClose') }) })
          .id('abn_onClose_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('onClose'),
            onClose: undefined,
          })
        }).id('abn_onClose_u')
    }
    .width('100%')
    .padding(12)
  }
}
