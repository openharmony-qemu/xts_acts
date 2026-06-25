/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct ChipV2Page {
  @Local clickedChipActivated: boolean = false;
  @Local checkedChipActivated: boolean = false;
  @Local selectedChipActivated: boolean = false;

  build() {
    Column({ space: 20 }) {
      Text('ChipV2组件无障碍属性示例').fontSize(20).fontWeight(FontWeight.Bold)

      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({
            text: '点击型Chip'
          }),
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Blue)
          }),
          size: ChipV2Size.NORMAL,
          accessibilitySelectedType: ChipV2AccessibilitySelectedType.CLICKED,
          accessibilityDescription: '这是一个点击型Chip',
          accessibilityLevel: 'yes',
          activated: this.clickedChipActivated,
          onClicked: () => {
            this.clickedChipActivated = !this.clickedChipActivated;
            this.getUIContext().getPromptAction().showToast({ message: '点击型Chip被点击' });
          },
          onClose: () => {
            this.getUIContext().getPromptAction().showToast({ message: '点击型Chip的关闭按钮被点击' });
          }
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({
            text: '复选型Chip'
          }),
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Green)
          }),
          size: ChipV2Size.NORMAL,
          accessibilitySelectedType: ChipV2AccessibilitySelectedType.CHECKED,
          accessibilityDescription: '这是一个复选型Chip',
          activated: this.checkedChipActivated,
          onClicked: () => {
            this.checkedChipActivated = !this.checkedChipActivated;
            this.getUIContext().getPromptAction().showToast({
              message: this.checkedChipActivated ? '复选型Chip被选中' : '复选型Chip被取消选中'
            });
          }
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({
            text: '单选型Chip'
          }),
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            fillColor: ColorMetrics.resourceColor(Color.Red)
          }),
          size: ChipV2Size.NORMAL,
          accessibilitySelectedType: ChipV2AccessibilitySelectedType.SELECTED,
          accessibilityDescription: '这是一个单选型Chip',
          activated: this.selectedChipActivated,
          onClicked: () => {
            this.selectedChipActivated = !this.selectedChipActivated;
            this.getUIContext().getPromptAction().showToast({
              message: this.selectedChipActivated ? '单选型Chip被选中' : '单选型Chip被取消选中'
            });
          }
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({
            text: '无障碍级别为no'
          }),
          size: ChipV2Size.NORMAL,
          accessibilityLevel: 'no',
          backgroundColor: ColorMetrics.resourceColor('#CCCCCC'),
          onClicked: () => {
            this.getUIContext().getPromptAction().showToast({ message: '此Chip无法被无障碍服务识别' });
          }
        })
      })
    }
    .width('100%')
    .padding(16)
  }
}