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

import { Entry, ComponentV2, Scroll, Column, ColumnOptions, Text, Row, FontWeight, LocalizedPadding, ShadowStyle, BlurStyle, FlexAlign, ClickEvent, $r, Color, LengthMetrics } from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import { ChipV2, ChipV2Options, ChipV2Size, ChipV2PrefixImageIcon, ChipV2SuffixSymbolIcon, ChipV2Label, ChipV2PrefixImageIconConfig, ChipV2SuffixSymbolIconConfig, ChipV2ImageIconConfig, ColorMetrics } from '@kit.ArkUI';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
@Entry
@ComponentV2
struct ChipV2OptionsSuffixSymbolExample {
  build() {
    Column({ space: 20 } as ColumnOptions) {
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: '' }),
          suffixIcon: undefined,
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip1' }),
          suffixIcon: new ChipV2SuffixSymbolIcon({
            normal: new SymbolGlyphModifier($r('sys.symbol.trash')).fontColor([Color.Red]).fontSize(16),
            activated: new SymbolGlyphModifier($r('sys.symbol.media_sound')),
            normalAccessibility: {
              accessibilityText: 'accessibilityText',
              accessibilityDescription: 'accessibilityDescription',
              accessibilityLevel: 'auto'
            },
            activatedAccessibility: {
              accessibilityText: undefined,
              accessibilityDescription: undefined,
              accessibilityLevel: undefined
            },
            action: undefined
          }) as ChipV2SuffixSymbolIcon,
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip3' }),
          suffixIcon: new ChipV2SuffixSymbolIcon({
            normal: undefined,
            activated: undefined,
            normalAccessibility: {
              accessibilityText: 'accessibilityText',
              accessibilityDescription: 'accessibilityDescription',
              accessibilityLevel: 'yes'
            },
            activatedAccessibility: {
              accessibilityText: '',
              accessibilityDescription: '',
              accessibilityLevel: 'no'
            },
            action: () => {
              console.info('[ChipV2SuffixSymbolIcon] action ');
            }
          }) as ChipV2SuffixSymbolIcon,
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip4' }),
          suffixIcon: new ChipV2SuffixSymbolIcon({
            normal: undefined,
            activated: undefined,
            normalAccessibility: {
              accessibilityText: 'accessibilityText',
              accessibilityDescription: 'accessibilityDescription',
              accessibilityLevel: 'no-hide-descendants'
            },
            activatedAccessibility: {
              accessibilityText: '',
              accessibilityDescription: '',
              accessibilityLevel: ''
            },
            action: () => {
              console.info('[ChipV2SuffixSymbolIcon] action ');
            }
          }) as ChipV2SuffixSymbolIcon,
        })
      })
    }
    .id('ChipV2OptionsSuffixSymbolExample')
    .width('100%')
    .padding(16)
  }
}