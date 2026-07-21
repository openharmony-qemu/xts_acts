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

import { Entry, ComponentV2, Scroll, Column, ColumnOptions, Text, 
  Color, FlexAlign, $r, LengthMetrics } from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import { SegmentButtonV2Items, CapsuleSegmentButtonV2, TabSegmentButtonV2,
  SegmentButtonV2ItemOptions } from '@ohos.arkui.advanced.SegmentButtonV2';
import uiMaterial from '@ohos.arkui.uiMaterial';

@Entry
@ComponentV2
struct BackgroundSystemMaterialV2 {
  @Local textSelectedIndex: Int = 0;
  @Local textItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'Tab1' },
    { text: 'Tab2' },
    { text: 'Tab3' }
  ]);

  @Local capsuleSelectedIndex: Int = 0;
  @Local capsuleItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'Item1' },
    { text: 'Item2' }
  ]);

  @Local hybridSelectedIndex: Int = 0;
  @Local hybridItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'Phone', symbol: $r('sys.symbol.phone') } as SegmentButtonV2ItemOptions,
    { text: 'Pad', symbol: $r('sys.symbol.pad') } as SegmentButtonV2ItemOptions,
  ]);

  @Local itemSelectedFontSize: LengthMetrics = LengthMetrics.fp(16)

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Text('TabSegmentButtonV2 & CapsuleSegmentButtonV2 Test')
          .fontSize(14)
          .fontWeight(600)
          .width('100%')
          .margin({ top: 10, bottom: 6 })

        Text('TabSegmentButtonV2 THIN')
          .fontSize(12)
          .width('100%')
          .margin({ top: 4, bottom: 4 })
        TabSegmentButtonV2({
          items: this.textItems,
          selectedIndex: this.textSelectedIndex!!,
          itemSelectedFontSize: this.itemSelectedFontSize,
          backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THIN,
            materialColor: Color.Blue,
            colorInvert: false,
            applyShadow: true,
            interactive: true
          } as uiMaterial.ImmersiveOptions)
        })

        Text('TabSegmentButtonV2 REGULAR')
          .fontSize(12)
          .width('100%')
          .margin({ top: 6, bottom: 4 })
        TabSegmentButtonV2({
          items: this.hybridItems,
          selectedIndex: this.hybridSelectedIndex!!,
          backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.REGULAR,
            materialColor: Color.Green,
            colorInvert: true,
            applyShadow: false,
            interactive: false
          } as uiMaterial.ImmersiveOptions)
        })

        Text('CapsuleSegmentButtonV2 THICK')
          .fontSize(12)
          .width('100%')
          .margin({ top: 6, bottom: 4 })
        CapsuleSegmentButtonV2({
          items: this.capsuleItems,
          selectedIndex: this.capsuleSelectedIndex!!,
          itemSelectedFontSize: this.itemSelectedFontSize,
          backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THICK,
            materialColor: Color.Orange,
            colorInvert: false,
            applyShadow: true,
            interactive: true
          } as uiMaterial.ImmersiveOptions)
        })

        Text('CapsuleSegmentButtonV2 ULTRA_THICK')
          .fontSize(12)
          .width('100%')
          .margin({ top: 6, bottom: 4 })
        CapsuleSegmentButtonV2({
          items: this.textItems,
          selectedIndex: this.textSelectedIndex!!,
          backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            materialColor: Color.Pink,
            colorInvert: true,
            applyShadow: false,
            interactive: false
          } as uiMaterial.ImmersiveOptions)
        })

        Text('TabSegmentButtonV2 Undefined')
          .fontSize(12)
          .width('100%')
          .margin({ top: 6, bottom: 4 })
        TabSegmentButtonV2({
          items: this.capsuleItems,
          selectedIndex: this.capsuleSelectedIndex!!,
          backgroundSystemMaterial: undefined
        })

        Text('CapsuleSegmentButtonV2 Undefined')
          .fontSize(12)
          .width('100%')
          .margin({ top: 6, bottom: 4 })
        CapsuleSegmentButtonV2({
          items: this.hybridItems,
          selectedIndex: this.hybridSelectedIndex!!,
          backgroundSystemMaterial: undefined
        })
      }
      .constraintSize({ minHeight: '100%' })
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10, right: 10, top: 10, bottom: 20 })
    }
    .backgroundColor('#F1F3F5')
    .width('100%')
    .height('100%')
  }
}