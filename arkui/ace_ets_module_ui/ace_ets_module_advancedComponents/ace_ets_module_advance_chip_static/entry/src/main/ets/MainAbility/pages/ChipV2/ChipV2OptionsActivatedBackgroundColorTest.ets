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
  Button
} from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import {
  ChipV2,
  ChipV2Options,
  ChipV2Size,
  ChipV2PrefixImageIcon,
  ChipV2Label,
  ChipV2PrefixImageIconConfig,
  ChipV2ImageIconConfig,
  ColorMetrics
} from '@kit.ArkUI';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@ComponentV2
struct ChipV2OptionsActivatedBackgroundColorExample {
  build() {
    Column({ space: 20 } as ColumnOptions) {
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip0' }),
          activated: undefined,
          activatedBackgroundColor: undefined,
          backgroundColor: undefined
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip1' }),
          activated: undefined,
          activatedBackgroundColor: undefined,
          backgroundColor: undefined
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip2' }),
          activated: true,
          activatedBackgroundColor: ColorMetrics.resourceColor(Color.Red),
          backgroundColor: ColorMetrics.resourceColor('#FF00FF')
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip3' }),
          activated: false,
          activatedBackgroundColor: ColorMetrics.resourceColor('#FF00FF'),
          backgroundColor: ColorMetrics.resourceColor(Color.Red)
        })
      })
    }
    .id('ChipV2OptionsActivatedBackgroundColorExample')
    .width('100%')
    .padding(16)
  }
}