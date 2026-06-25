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
  Scroll,
  Column,
  ColumnOptions,
  Text,
  Row,
  FontWeight,
  LocalizedPadding,
  ShadowStyle,
  BlurStyle,
  FlexAlign,
  ClickEvent,
  $r,
  Color,
  LengthMetrics
} from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import {
  ChipV2,
  ChipV2Options,
  ChipV2Size,
  ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon,
  ChipV2Label,
  ChipV2LabelConfig,
  ChipV2LabelMarginConfig,
  ChipV2LocalizedLabelMarginConfig,
  ChipV2PrefixImageIconConfig,
  ChipV2SuffixImageIconConfig,
  ChipV2ImageIconConfig,
  ColorMetrics,
  SizeT
} from '@kit.ArkUI'

@Entry
@ComponentV2
struct ChipV2OptionsSuffixIconExample {
  build() {
    Column({ space: 20 } as ColumnOptions) {
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: '' }),
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: 'Chip1',
            fontSize: undefined,
            fontColor: undefined,
            activatedFontColor: undefined,
            fontFamily: undefined,
            labelMargin: undefined,
            localizedLabelMargin: undefined
          }) as ChipV2Label,
          suffixIcon: new ChipV2SuffixImageIcon({
            src: $r('app.media.icon'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(Color.Red),
            action: () => {
            },
            accessibilityText: 'accessibilityText',
            accessibilityDescription: 'accessibilityDescription',
            accessibilityLevel: 'yes'
          }) as ChipV2SuffixImageIcon,
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: 'Chip1',
            fontSize: undefined,
            fontColor: undefined,
            activatedFontColor: undefined,
            fontFamily: undefined,
            labelMargin: undefined,
            localizedLabelMargin: undefined
          }) as ChipV2Label,
          suffixIcon: undefined,
        })
      })
    }
    .id('ChipV2OptionsSuffixIconExample')
    .width('100%')
    .padding(16)
  }
}