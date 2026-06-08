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
struct DatePickerComponentsTimeFormat {
  build() {
    Row() {
      Column() {
        Text('DatePickerComponent TimeFormat Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.TIME,
            timeOptions: {
              format: TimeFormat.HOUR_MINUTE,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_timeFormat_hour_minute')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.TIME,
            timeOptions: {
              format: TimeFormat.HOUR_MINUTE_SECOND,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_timeFormat_hour_minute_second')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.TIME,
            timeOptions: {
              format: null,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_timeFormat_null')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.TIME,
            timeOptions: {
              format: undefined,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_timeFormat_undefined')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

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
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}