/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ChipV2LocalizedLabelMarginConfig } from '@ohos.arkui.advanced.ChipV2';
import {
  ChipV2,
  ChipV2Options,
  ChipV2Label,
  ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon,
  ChipV2Size,
  LengthMetrics,
  ColorMetrics
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2LocalizedLabelMargin {
  @Local message: string = 'Hello World';
  @Local mLocalizedLabelMargin: ChipV2LocalizedLabelMarginConfig = {
    start: LengthMetrics.vp(20), end: LengthMetrics.vp(30)
  }
  @Local mBtn: string = 'start_init'
  @Local mBtn2: string = 'end_init'

  build() {
    Column() {
      Button(this.mBtn)
        .id('LocalizedLabelMargin_start')
        .onClick(() => {
          this.mBtn = `start:{"unit":${this.mLocalizedLabelMargin.start!.unit},"value":${this.mLocalizedLabelMargin.start!.value}}`;
        })
      Button(this.mBtn2)
        .id('LocalizedLabelMargin_end')
        .onClick(() => {
          this.mBtn2 = `end:{"unit":${this.mLocalizedLabelMargin.end!.unit},"value":${this.mLocalizedLabelMargin.end!.value}}`;
        })
        .margin(20)
      ChipV2({
        chipV2Options: new ChipV2Options({
          direction: Direction.Auto,
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('app.media.icon'),
            size: { width: LengthMetrics.fp(16), height: LengthMetrics.fp(16) },
            fillColor: ColorMetrics.resourceColor(Color.Red),
          }),
          label: new ChipV2Label({
            text: '操作块',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
            fontFamily: 'HarmonySans',
            localizedLabelMargin: this.mLocalizedLabelMargin,
          }),
          suffixIcon: new ChipV2SuffixImageIcon({
            src: $r('app.media.icon'),
            size: { width: LengthMetrics.fp(16), height: LengthMetrics.fp(16) },
            fillColor: ColorMetrics.resourceColor(Color.Red),
          }),
          size: ChipV2Size.NORMAL,
          allowClose: false,
          enabled: true,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          borderRadius: LengthMetrics.resource($r('sys.float.ohos_id_corner_radius_button'))
        })
      })
    }.justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}