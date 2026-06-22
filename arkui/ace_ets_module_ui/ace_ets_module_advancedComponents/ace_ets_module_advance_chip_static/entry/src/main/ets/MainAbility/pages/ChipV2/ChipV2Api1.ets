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
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import inspector from '@ohos.arkui.inspector';
import { Entry, Column, ComponentV2, Color, $r, ColumnOptions, ChipV2, ChipV2Options, ChipV2Label, ChipV2PrefixImageIcon, ChipV2LabelConfig, Button, Text, ChipV2Size, ChipV2SuffixImageIcon, LengthMetrics, ColorMetrics, Local, ChipV2SuffixSymbolIcon, ChipV2PrefixSymbolIcon, ChipV2PrefixSymbolIconConfig, ChipV2SuffixSymbolIconConfig } from '@kit.ArkUI';
@Entry
@ComponentV2
struct ChipV2Api1 {
  @Local text1: string = ''

  build() {
    Column({ space: 10 } as ColumnOptions) {
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_ic_public_cut'),
            size: { width: LengthMetrics.fp(16), height: LengthMetrics.fp(16) },
            fillColor: ColorMetrics.resourceColor(Color.Blue),
            activatedFillColor: ColorMetrics.resourceColor(Color.Blue)
          }) as ChipV2PrefixImageIcon,
          suffixIcon: new ChipV2SuffixSymbolIcon({
            normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
            activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
            activatedAccessibility: {
              accessibilityText: 'helloActivate',
              accessibilityLevel: 'yes',
              accessibilityDescription: 'helloActivate'
            },
            normalAccessibility: {
              accessibilityText: 'helloNormal',
              accessibilityLevel: 'yes',
              accessibilityDescription: 'helloNormal'
            }
          }),
          label: new ChipV2Label({
            text: '操作块',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
            activatedFontColor: ColorMetrics.resourceColor(Color.White),
            fontFamily: 'HarmonySans',
            labelMargin: { left: LengthMetrics.fp(20), right: LengthMetrics.fp(30) },
          }),
          size: ChipV2Size.NORMAL,
          allowClose: true,
          enabled: true,
          activated: true,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          activatedBackgroundColor: ColorMetrics.resourceColor('#FFFF0000'),
          borderRadius: LengthMetrics.resource($r('sys.float.ohos_id_corner_radius_button')),
          onClose: () => {
            console.log('chip on close')
          },
          onClicked: () => {
            console.log('chip on clicked')
          },
        })
      })


      Button('getInspectorTree').onClick(() => {
        let text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getElement('$attrs')
          .getString('backgroundColor')
        this.text1 = text
      }).id('ChipV2Api1_btn1')

      Text(this.text1).id('ChipV2Api1_text')
    }
  }
}