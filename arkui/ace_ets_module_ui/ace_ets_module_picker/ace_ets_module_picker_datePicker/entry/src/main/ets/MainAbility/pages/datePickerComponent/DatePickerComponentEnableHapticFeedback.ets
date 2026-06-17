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

import { DatePickerComponent, DatePickerComponentOptions, DisplayMode, DateMode, TimeFormat } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentEnableHapticFeedback {
  @State enableHaptic: boolean = true;

  build() {
    Column({ space: 20 }) {
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE_TIME,
          dateOptions: {
            mode: DateMode.DATE,
            enableHapticFeedback: this.enableHaptic,
          },
          timeOptions: {
            format: TimeFormat.HOUR_MINUTE,
            enableHapticFeedback: this.enableHaptic,
          }
        }
      })
        .id('datePickerComponent_enableHapticFeedback')
        .width('100%')
        .height('30%')

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('haptic_true')
          .onClick(() => {
            this.enableHaptic = true;
          })
          .id('button_haptic_true')
          .margin({ right: 10 })

        Button('haptic_false')
          .onClick(() => {
            this.enableHaptic = false;
          })
          .id('button_haptic_false')
          .margin({ right: 10 })
      }
      .width('100%')
      .margin({ top: 10 })

      Text(`enableHapticFeedback: ${this.enableHaptic}`)
        .id('text_enableHapticFeedback_value')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
