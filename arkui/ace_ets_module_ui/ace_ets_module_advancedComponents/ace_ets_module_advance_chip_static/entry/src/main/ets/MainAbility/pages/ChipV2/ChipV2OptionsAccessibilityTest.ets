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
  LengthMetrics,
  Button,
  SizeOptions,
  Direction
} from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import {
  ChipV2,
  ChipV2Options,
  ChipV2Size,
  ChipV2PrefixImageIcon,
  ChipV2CloseIcon,
  ChipV2Label,
  ChipV2AccessibilitySelectedType,
  ChipV2PrefixImageIconConfig,
  ChipV2ImageIconConfig,
  ChipV2LabelConfig,
  ColorMetrics
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2OptionsAccessibilityExample {
  build() {
    Column({ space: 20 } as ColumnOptions) {
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip0' }),
          backgroundColor: ColorMetrics.resourceColor(Color.Red),
          accessibilityDescription: undefined,
          accessibilityLevel: undefined,
          accessibilitySelectedType: undefined
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip1' }),
          backgroundColor: ColorMetrics.resourceColor(Color.Green),
          accessibilityDescription: '',
          accessibilityLevel: 'auto',
          accessibilitySelectedType: ChipV2AccessibilitySelectedType.CLICKED
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip2' }),
          backgroundColor: ColorMetrics.resourceColor(Color.Gray),
          accessibilityDescription: 'accessibilityDescription1',
          accessibilityLevel: 'yes',
          accessibilitySelectedType: ChipV2AccessibilitySelectedType.CHECKED
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip3' }),
          backgroundColor: ColorMetrics.resourceColor(Color.Blue),
          accessibilityDescription: 'accessibilityDescription2',
          accessibilityLevel: 'no',
          accessibilitySelectedType: ChipV2AccessibilitySelectedType.SELECTED
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip4' }),
          backgroundColor: ColorMetrics.resourceColor(Color.Yellow),
          accessibilityDescription: 'accessibilityDescription3',
          accessibilityLevel: 'no-hide-descendants'
        })
      })
    }
    .id('ChipV2OptionsAccessibilityExample')
    .width('100%')
    .padding(16)
  }
}