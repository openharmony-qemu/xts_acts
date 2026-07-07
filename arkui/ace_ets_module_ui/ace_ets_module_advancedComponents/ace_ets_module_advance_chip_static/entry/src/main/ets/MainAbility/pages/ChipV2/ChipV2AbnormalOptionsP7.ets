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
struct ChipV2AbnormalOptionsP7 {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }
  build() {
    Column() {
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('a11yLevel') }) })
          .id('abn_a11yLevel_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('a11yLevel'),
            accessibilityLevel: undefined,
          })
        }).id('abn_a11yLevel_u')
      ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('a11ySelType') }) })
          .id('abn_a11ySelType_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('a11ySelType'),
            accessibilitySelectedType: undefined,
          })
        }).id('abn_a11ySelType_u')
    }
    .width('100%')
    .padding(12)
  }
}
