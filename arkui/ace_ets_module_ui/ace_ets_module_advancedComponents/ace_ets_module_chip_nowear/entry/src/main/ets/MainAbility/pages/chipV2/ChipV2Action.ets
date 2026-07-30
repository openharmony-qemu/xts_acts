/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  AccessibilitySelectedType,
  ChipV2,
  ChipV2PrefixImageIcon,
  ChipV2Options,
  ChipV2Label,
  LengthMetrics,
  ColorMetrics,
  ChipV2Size,
  ChipV2AccessibilitySelectedType,
  ChipV2SuffixImageIcon
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2Action {
  @Local text: string = ''

  build() {
    Column() {
      Column(){
        ChipV2({
          chipV2Options: new ChipV2Options({
            // 设置前缀图标属性。
            prefixIcon: new ChipV2PrefixImageIcon({
              src: $r('app.media.icon'),
              size: { width: LengthMetrics.fp(16), height: LengthMetrics.fp(16) },
              fillColor: ColorMetrics.resourceColor(Color.Red),
            }),
            // 设置文本属性。
            label: new ChipV2Label({
              text: '操作块',
              fontSize: LengthMetrics.fp(16),
              fontColor: ColorMetrics.resourceColor(Color.Blue),
              fontFamily: 'HarmonySans',
              labelMargin: { left: LengthMetrics.fp(4), right: LengthMetrics.fp(4) }
            }),
            suffixIcon: new ChipV2SuffixImageIcon({
              src: $r('app.media.icon'),
              size: { width: LengthMetrics.fp(16), height: LengthMetrics.fp(16) },
              fillColor: ColorMetrics.resourceColor(Color.Red),
              action:() => {
                this.text = 'action'
              }
            }),
            size: ChipV2Size.NORMAL,
            allowClose: true,
            enabled: true,
            accessibilitySelectedType: ChipV2AccessibilitySelectedType.CLICKED,
            backgroundColor: ColorMetrics.resourceColor(0x808080),
            onClicked: () => {
              this.text = 'action'
            }
          })
        })
      }.width(120).borderWidth(1).id('ChipV2ActionCol')
      Text(this.text).id('tvChipV2Action')
    }
  }
}