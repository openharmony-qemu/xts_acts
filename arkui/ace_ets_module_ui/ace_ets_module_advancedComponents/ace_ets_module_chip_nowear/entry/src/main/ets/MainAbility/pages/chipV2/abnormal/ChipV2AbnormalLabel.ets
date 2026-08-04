/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  ChipV2,
  ChipV2Options,
  ChipV2Label,
  ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon,
  ChipV2PrefixSymbolIcon,
  ChipV2SuffixSymbolIcon,
  ChipV2CloseIcon,
  LengthMetrics,
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2AbnormalLabel {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblFontSize' }),
          }),
        }).id('abn_lblFontSize_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblFontSize', fontSize: undefined }),
          }),
        }).id('abn_lblFontSize_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblFontColor' }),
          }),
        }).id('abn_lblFontColor_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblFontColor', fontColor: undefined }),
          }),
        }).id('abn_lblFontColor_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblActFontColor' }),
          }),
        }).id('abn_lblActFontColor_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblActFontColor', activatedFontColor: undefined }),
          }),
        }).id('abn_lblActFontColor_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblFontFamily' }),
          }),
        }).id('abn_lblFontFamily_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblFontFamily', fontFamily: undefined }),
          }),
        }).id('abn_lblFontFamily_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblMargin' }),
          }),
        }).id('abn_lblMargin_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblMargin', labelMargin: undefined }),
          }),
        }).id('abn_lblMargin_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblMarginLeft', labelMargin: { right: LengthMetrics.vp(4) } }),
          }),
        }).id('abn_lblMarginLeft_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblMarginLeft', labelMargin: { left: undefined, right: LengthMetrics.vp(4) } }),
          }),
        }).id('abn_lblMarginLeft_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblMarginRight', labelMargin: { left: LengthMetrics.vp(4) } }),
          }),
        }).id('abn_lblMarginRight_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblMarginRight', labelMargin: { left: LengthMetrics.vp(4), right: undefined } }),
          }),
        }).id('abn_lblMarginRight_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblLocMargin' }),
          }),
        }).id('abn_lblLocMargin_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblLocMargin', localizedLabelMargin: undefined }),
          }),
        }).id('abn_lblLocMargin_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblLocStart', localizedLabelMargin: { end: LengthMetrics.vp(4) } }),
          }),
        }).id('abn_lblLocStart_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblLocStart', localizedLabelMargin: { start: undefined, end: LengthMetrics.vp(4) } }),
          }),
        }).id('abn_lblLocStart_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblLocEnd', localizedLabelMargin: { start: LengthMetrics.vp(4) } }),
          }),
        }).id('abn_lblLocEnd_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblLocEnd', localizedLabelMargin: { start: LengthMetrics.vp(4), end: undefined } }),
          }),
        }).id('abn_lblLocEnd_u')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblModifier' }),
          }),
        }).id('abn_lblModifier_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label({ text: 'lblModifier', modifier: undefined }),
          }),
        }).id('abn_lblModifier_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
