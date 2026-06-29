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
struct ChipV2AbnormalOptionsP11 {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }
  build() {
    Column() {
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('onClicked') }) })
          .id('abn_onClicked_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('onClicked'),
            onClicked: undefined,
          })
        }).id('abn_onClicked_u')
    }
    .width('100%')
    .padding(12)
  }
}
