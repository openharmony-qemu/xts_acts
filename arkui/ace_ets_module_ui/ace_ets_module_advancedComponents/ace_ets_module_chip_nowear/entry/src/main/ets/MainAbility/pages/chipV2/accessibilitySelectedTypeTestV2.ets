/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  AccessibilitySelectedType,
  ChipV2,
  ChipSize,
  ChipV2PrefixImageIcon,
  ChipV2Options,
  ChipV2Label,
  LengthMetrics,
  ColorMetrics,
  ChipV2Size,
  ChipV2AccessibilitySelectedType
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct accessibilitySelectedTypeTestV2 {
  @Local accessibilitySelectedType: AccessibilitySelectedType = AccessibilitySelectedType.CLICKED

  build() {
    Column({ space: 10 }) {
      Text('' + this.accessibilitySelectedType).id('text')
      Button('change accessibilitySelectedType')
        .id('btn')
        .onClick(() => {
          this.accessibilitySelectedType = (this.accessibilitySelectedType + 1) % 3
        })
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
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
            labelMargin: { left: LengthMetrics.fp(20), right: LengthMetrics.fp(30) }
          }),
          size: ChipV2Size.NORMAL,
          allowClose: true,
          enabled: true,
          accessibilitySelectedType: ChipV2AccessibilitySelectedType.CLICKED,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          borderRadius: LengthMetrics.resource($r('sys.float.ohos_id_corner_radius_button')),
        })
      })


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
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
            labelMargin: { left: LengthMetrics.fp(20), right: LengthMetrics.fp(30) }
          }),
          size: ChipV2Size.NORMAL,
          allowClose: true,
          enabled: true,
          accessibilitySelectedType: ChipV2AccessibilitySelectedType.CLICKED,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          borderRadius: LengthMetrics.resource($r('sys.float.ohos_id_corner_radius_button')),
        })
      })
    }
    .height('100%')
    .width('100%')
  }
}
