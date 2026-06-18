'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  ChipV2Label,
  ChipV2LabelConfig,
  ChipV2LabelMarginConfig,
  ChipV2LocalizedLabelMarginConfig,
  ChipV2PrefixImageIconConfig,
  ChipV2ImageIconConfig,
  ColorMetrics
} from '@kit.ArkUI'

@Entry
@ComponentV2
struct ChipV2OptionsLabelExample {
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
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: 'Chip2',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Red),
            activatedFontColor: ColorMetrics.resourceColor(Color.Green),
            fontFamily: '',
            labelMargin: { left: LengthMetrics.fp(6), right: LengthMetrics.fp(6) } as ChipV2LabelMarginConfig,
            localizedLabelMargin: { start: LengthMetrics.px(15), end: LengthMetrics.px(15) } as
              ChipV2LocalizedLabelMarginConfig
          }) as ChipV2Label,
        })
      })
    }
    .id('ChipV2OptionsLabelExample')
    .width('100%')
    .padding(16)
  }
}