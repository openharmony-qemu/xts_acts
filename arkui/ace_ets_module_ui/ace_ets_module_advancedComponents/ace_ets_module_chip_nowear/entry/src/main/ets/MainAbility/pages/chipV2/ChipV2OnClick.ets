/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  ChipV2,
  ChipV2Options,
  ChipV2Label,
  ChipV2PrefixImageIcon,
  ChipV2Size,
  ChipV2AccessibilitySelectedType,
  LengthMetrics,
  ColorMetrics
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2OnClick {
  @Local text: string = ''
  build() {
    Column() {
      Column(){
        ChipV2({
          chipV2Options: new ChipV2Options({
            prefixIcon: new ChipV2PrefixImageIcon({
              src: $r('app.media.icon'),
              size: { width: LengthMetrics.fp(16), height: LengthMetrics.fp(16)  },
              fillColor: ColorMetrics.resourceColor(Color.Red),
            }),
            label: new ChipV2Label({
              text: '操作块',
              fontSize: LengthMetrics.fp(16),
              fontColor: ColorMetrics.resourceColor(Color.Blue),
              labelMargin: { left: LengthMetrics.fp(4), right: LengthMetrics.fp(4)}
            }),
            size: ChipV2Size.NORMAL,
            allowClose: true,
            enabled: true,
            backgroundColor: ColorMetrics.resourceColor(0x808080),
            activated: true,
            onClicked: () => {
              this.text = 'onClicked'
              console.log('test onClick')
            }
          })
        })
      }.width(120).borderWidth(1).id('ChipV2OnClickCol')
      Text(this.text).id('tvChipV2OnClickText')
    }
  }
}