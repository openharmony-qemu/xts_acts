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
  SizeOptions
} from '@ohos.arkui.component';
import { AppStorage, Local } from '@ohos.arkui.stateManagement';
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

@Entry
@ComponentV2
struct ChipV2OptionsMethodExample {
  @Local closeText: string = ''
  @Local clickedText: string = ''

  aboutToAppear(): void {
    const action = AppStorage.get<string>('chipV2OptionsMethodAction');
    if (action === 'close') {
      this.handleClose();
    } else if (action === 'clicked') {
      this.handleClicked();
    }
  }

  private handleClose(): void {
    this.closeText = 'closeChip0';
  }

  private handleClicked(): void {
    this.clickedText = 'clickedChip0';
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text(this.closeText).id('ChipV2OptionsCloseText')
      Text(this.clickedText).id('ChipV2OptionsClickedText')
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip0' }),
          onClose: () => this.handleClose(),
          onClicked: () => this.handleClicked()
        })
      })
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({ text: 'Chip1' }),
          onClose: undefined,
          onClicked: undefined
        })
      })
    }
    .id('ChipV2OptionsMethodExample')
    .width('100%')
    .padding(16)
  }
}
