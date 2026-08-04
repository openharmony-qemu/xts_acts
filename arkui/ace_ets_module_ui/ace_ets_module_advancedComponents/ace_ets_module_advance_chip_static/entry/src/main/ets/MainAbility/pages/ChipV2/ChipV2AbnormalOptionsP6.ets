'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
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
