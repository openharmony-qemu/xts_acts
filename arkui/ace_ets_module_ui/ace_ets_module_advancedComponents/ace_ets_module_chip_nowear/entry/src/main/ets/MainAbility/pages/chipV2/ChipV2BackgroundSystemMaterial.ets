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
  ChipV2SuffixImageIcon,
  ChipV2PrefixSymbolIcon,
  uiMaterial
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2BackgroundSystemMaterial {
  @Local isActivated: boolean = true;

  build() {
    Column({ space: 20 }) {
      // 测试1: 设置 backgroundSystemMaterial (普通状态)
      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({ text: '普通状态材质' }),
          activated: false,
          backgroundColor: ColorMetrics.resourceColor(Color.Transparent),
          backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.REGULAR
          })
        })

      })

      // 测试2: 设置 activatedBackgroundSystemMaterial (激活状态)
      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({ text: '激活状态材质' }),
          activated: this.isActivated,
          backgroundColor: ColorMetrics.resourceColor(Color.Transparent),
          backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.REGULAR
          }),
          activatedBackgroundColor: ColorMetrics.resourceColor(Color.Transparent),
          activatedBackgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THICK
          })
        })

      })

      // 测试3: 未设置系统材质（默认值）
      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({ text: '默认材质' }),
          activated: false,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal'))
        })

      })

      // 测试4: 设置 null/undefined 时的默认值行为
      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({ text: 'undefined材质' }),
          activated: false,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          backgroundSystemMaterial: undefined
        })
      })
    }
    .linearGradient({
      angle: 135, // 渐变角度，135度是从左上到右下
      colors: [
        ['#FF9A9E', 0.0], // 起始颜色及位置 (0.0表示起点)
        ['#FECFEF', 0.5], // 中间颜色及位置
        ['#A18CD1', 1.0]  // 结束颜色及位置 (1.0表示终点)
      ]
    })
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
