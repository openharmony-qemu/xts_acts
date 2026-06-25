/*
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
  ChipV2,
  ChipV2Options,
  ChipV2Label,
  ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon,
  ChipV2PrefixSymbolIcon,
  ChipV2SuffixSymbolIcon,
  ChipV2CloseIcon,
  LengthMetrics,
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2AbnormalCloseIcon {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'closeIcon' }),
          }),
        }).id('abn_closeIcon_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: undefined, label: new ChipV2Label({ text: 'closeIcon' }),
          }),
        }).id('abn_closeIcon_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: new ChipV2CloseIcon({  }), label: new ChipV2Label({ text: 'closeFontSize' }),
          }),
        }).id('abn_closeFontSize_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: new ChipV2CloseIcon({ fontSize: undefined }), label: new ChipV2Label({ text: 'closeFontSize' }),
          }),
        }).id('abn_closeFontSize_u')
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
        ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: new ChipV2CloseIcon({  }), label: new ChipV2Label({ text: 'closeA11yTx' }),
          }),
        }).id('abn_closeA11yTx_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: new ChipV2CloseIcon({ accessibilityText: undefined }), label: new ChipV2Label({ text: 'closeA11yTx' }),
          }),
        }).id('abn_closeA11yTx_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: new ChipV2CloseIcon({  }), label: new ChipV2Label({ text: 'closeA11yDs' }),
          }),
        }).id('abn_closeA11yDs_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            closeIcon: new ChipV2CloseIcon({ accessibilityDescription: undefined }), label: new ChipV2Label({ text: 'closeA11yDs' }),
          }),
        }).id('abn_closeA11yDs_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
