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

import { DatePickerComponent, DisplayMode, TimeFormat } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentsTimeFormat {
  @State formatValue: TimeFormat | undefined = undefined

  build() {
    Column({ space: 10 }) {
      Text('DatePickerComponent TimeFormat Test')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('hour_minute')
          .id('datePicker_timeFormat_hour_minute')
          .onClick(() => {
            this.formatValue = TimeFormat.HOUR_MINUTE;
          })
        Button('hour_minute_second')
          .id('datePicker_timeFormat_hour_minute_second')
          .onClick(() => {
            this.formatValue = TimeFormat.HOUR_MINUTE_SECOND;
          })
      }.width('80%')

      DatePickerComponent({
        options: {
          displayMode: DisplayMode.TIME,
          timeOptions: {
            format: this.formatValue,
            selected: new Date('2021-08-08'),
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31')
          }
        }
      })
        .id('datePicker_timeFormat_hour_minute')

      Text('DatePickerComponent 不设置format')
        .fontSize(14)
        .fontWeight(FontWeight.Normal)

      DatePickerComponent({
        options: {
          displayMode: DisplayMode.TIME,
          timeOptions: {
            selected: new Date('2021-08-08'),
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31')
          }
        }
      })
        .id('datePicker_timeFormat_default')
    }
    .width('100%')
    .margin({ top: 30 })
  }
}