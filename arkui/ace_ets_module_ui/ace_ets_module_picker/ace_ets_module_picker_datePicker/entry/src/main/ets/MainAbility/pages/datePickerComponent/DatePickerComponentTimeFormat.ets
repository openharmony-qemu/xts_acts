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

import { DatePickerComponent, DatePickerComponentOptions, DisplayMode, TimeFormat } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentTimeFormat {
  @State currentTimeFormat: TimeFormat = TimeFormat.HOUR_MINUTE;

  build() {
    Column({ space: 20 }) {
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.TIME,
          timeOptions: {
            format: this.currentTimeFormat,
            useMilitaryTime: true,
            onChange: (result: DatePickerComponentResult) => {
              console.info('Selected time: ' + result.hour + ':' + result.minute + ':' + result.second);
            },
            onScrollStop: (result: DatePickerComponentResult) => {
              console.info('Scroll stop: ' + result.hour + ':' + result.minute + ':' + result.second);
            }
          }
        }
      })
        .id('datePickerComponent_timeFormat')
        .width('100%')
        .height('30%')

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('HOUR_MINUTE')
          .onClick(() => {
            this.currentTimeFormat = TimeFormat.HOUR_MINUTE;
          })
          .id('button_timeFormat_hourMinute')
          .margin({ right: 10 })

        Button('HOUR_MINUTE_SECOND')
          .onClick(() => {
            this.currentTimeFormat = TimeFormat.HOUR_MINUTE_SECOND;
          })
          .id('button_timeFormat_hourMinuteSecond')
          .margin({ right: 10 })
      }
      .width('100%')
      .margin({ top: 10 })

      Text(`timeFormat: ${this.currentTimeFormat}`)
        .id('text_timeFormat_value')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
