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

import { ChipGroup, IconGroupSuffix, uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct ChipGroupSystemMaterial2 {
  @State selectedIndexes: Array<number> = [0];
  @LocalBuilder
  suffixUltraThin() {
    IconGroupSuffix({
      items: [{
        icon: {
          src: $r('app.media.icon'),
        },
        action: () => {
          this.getUIContext().getPromptAction().showToast({
            message: '后缀图标被点击'
          })
        }
      }],
      iconBackgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.ULTRA_THIN
      })
    })
  }

  @LocalBuilder
  suffixUltraThick() {
    IconGroupSuffix({
      items: [{
        icon: {
          src: $r('app.media.icon'),
        },
        action: () => {
          this.getUIContext().getPromptAction().showToast({
            message: '后缀图标被点击'
          })
        }
      }],
      iconBackgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.ULTRA_THICK
      })
    })
  }

  @LocalBuilder
  suffixUndefined() {
    IconGroupSuffix({
      items: [{
        icon: {
          src: $r('app.media.icon'),
        },
        action: () => {
          this.getUIContext().getPromptAction().showToast({
            message: '后缀图标被点击'
          })
        }
      }],
      iconBackgroundSystemMaterial: undefined
    })
  }

  build() {
    Column({ space: 20 }) {
      // 测试1: backgroundSystemMaterial with ULTRA_THIN style
      ChipGroup({
        items: [
          { label: { text: '选项1' } },
          { label: { text: '选项2' } },
          { label: { text: '选项3' } },
        ],
        selectedIndexes: this.selectedIndexes,
        itemStyle: {
          backgroundColor: Color.Transparent,
        },
        selectedBackgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.ULTRA_THIN
        }),
        onChange: (activatedChipsIndex: Array<number>) => {
          this.selectedIndexes = activatedChipsIndex;
        },
        suffix: () => {
          this.suffixUltraThick()
        }
      })

      // 测试3: 未设置 backgroundSystemMaterial（默认值）
      ChipGroup({
        items: [
          { label: { text: '选项1' } },
          { label: { text: '选项2' } },
        ],
        selectedIndexes: [0],
        onChange: (activatedChipsIndex: Array<number>) => {
          this.selectedIndexes = activatedChipsIndex;
        }
      })

      // 测试4: 设置 undefined 时的默认值行为
      ChipGroup({
        items: [
          { label: { text: '选项1' } },
          { label: { text: '选项2' } },
        ],
        selectedIndexes: [0],
        selectedBackgroundSystemMaterial: undefined,
        onChange: (activatedChipsIndex: Array<number>) => {
          this.selectedIndexes = activatedChipsIndex;
        },
        suffix: () => {
          this.suffixUndefined()
        }
      })
        .id('chipGroup_backgroundSystemMaterial_undefined')
    }
    .linearGradient({
      angle: 135,
      colors: [
        ['#FF9A9E', 0.0],
        ['#FECFEF', 0.5],
        ['#A18CD1', 1.0]
      ]
    })
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}