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

import { Entry, Component, Scroll, Column, Text,
  Color, ColumnOptions } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { SegmentButtonOptions, ItemRestriction,
  SegmentButton, CommonSegmentButtonOptions, SegmentButtonTextItem } from '@ohos.arkui.advanced.SegmentButton';
import uiMaterial from '@ohos.arkui.uiMaterial';

@Entry
@Component
struct BackgroundSystemMaterial {
  @State selectedIndex: int[] = [0]

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Text('CommonSegmentButtonOptions backgroundSystemMaterial Test')
          .fontSize(14)

        Text('SegmentButtonOptions.tab THIN')
          .fontSize(12)
        SegmentButton({
          options: SegmentButtonOptions.tab({
            buttons: [
              { text: 'Tab1' },
              { text: 'Tab2' }
            ] as ItemRestriction<SegmentButtonTextItem>,
            backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THIN,
              materialColor: Color.Blue,
              colorInvert: false,
              applyShadow: true,
              interactive: true
            } as uiMaterial.ImmersiveOptions)
          }),
          selectedIndexes: this.selectedIndex
        })

        Text('SegmentButtonOptions.tab THICK')
          .fontSize(12)
        SegmentButton({
          options: SegmentButtonOptions.tab({
            buttons: [
              { text: 'Page1' },
              { text: 'Page2' }
            ] as ItemRestriction<SegmentButtonTextItem>,
            backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THICK,
              materialColor: Color.Orange,
              colorInvert: false,
              applyShadow: true,
              interactive: true
            } as uiMaterial.ImmersiveOptions)
          }),
          selectedIndexes: this.selectedIndex
        })

        Text('tab + undefined')
          .fontSize(12)
        SegmentButton({
          options: SegmentButtonOptions.tab({
            buttons: [
              { text: 'U1' },
              { text: 'U2' }
            ] as ItemRestriction<SegmentButtonTextItem>,
            backgroundSystemMaterial: undefined
          }),
          selectedIndexes: this.selectedIndex
        })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}
