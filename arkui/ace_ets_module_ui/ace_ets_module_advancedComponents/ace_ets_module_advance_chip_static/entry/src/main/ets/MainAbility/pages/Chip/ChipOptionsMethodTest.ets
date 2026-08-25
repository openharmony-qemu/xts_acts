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

import { Entry, Component, Scroll, Column, ColumnOptions, Text, Row, FontWeight, LocalizedPadding, ShadowStyle, BlurStyle, FlexAlign,
  ClickEvent,
  $r,
  Color,
  LengthMetrics,
  Button,
  SizeOptions
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Chip,
  ChipOptions,
  ChipSize,
  PrefixIconOptions,
  CloseOptions,
  AccessibilitySelectedType,
  LabelOptions
} from '@ohos.arkui.advanced.Chip';

@Entry
@Component
struct ChipOptionsMethodExample {
  @State closeText:string = ''
  @State clickedText:string = ''

  aboutToAppear(): void {
    const action = AppStorage.get<string>('chipOptionsMethodAction');
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
      Text(this.closeText).id('ChipOptionsCloseText')
      Text(this.clickedText).id('ChipOptionsClickedText')
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip0' } as LabelOptions,
        onClose: () => this.handleClose(),
        onClicked: () => this.handleClicked()
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip1' } as LabelOptions,
        onClose:undefined,
        onClicked:undefined
      } as ChipOptions)
    }
    .id('ChipOptionsMethodExample')
    .width('100%')
    .padding(16)
  }
}
