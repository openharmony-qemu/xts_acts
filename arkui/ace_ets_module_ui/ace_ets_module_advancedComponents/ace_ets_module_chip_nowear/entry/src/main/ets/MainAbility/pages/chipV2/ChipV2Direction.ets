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
  ChipV2,
  ChipV2Options,
  ChipV2Label,
  ChipV2SuffixImageIcon,
  ChipV2Size,
  LengthMetrics,
  ColorMetrics
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2Direction {
  @Local currentDirection: Direction = Direction.Auto

  build() {
    Column() {
      Row() {
        Button('Auto').id('Auto').onClick(() => {
          this.currentDirection = Direction.Auto
        }).backgroundColor(this.currentDirection == Direction.Auto ? Color.Red : Color.Blue)
        Button('Rtl').id('Rtl').onClick(() => {
          this.currentDirection = Direction.Rtl
        }).backgroundColor(this.currentDirection == Direction.Rtl ? Color.Red : Color.Blue)
        Button('Ltr').id('Ltr').onClick(() => {
          this.currentDirection = Direction.Ltr
        }).backgroundColor(this.currentDirection == Direction.Ltr ? Color.Red : Color.Blue)
      }

      ChipV2({
        chipV2Options: new ChipV2Options({
          direction: this.currentDirection,
          label: new ChipV2Label({
            text: '操作块',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
            localizedLabelMargin: {
              start: LengthMetrics.vp(5),
              end: LengthMetrics.vp(10)
            }
          }),
          suffixIcon: new ChipV2SuffixImageIcon({
            src: $r('sys.media.ohos_ic_public_close'),
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

    }
    .width('100%')
    .height('100%')
  }
}