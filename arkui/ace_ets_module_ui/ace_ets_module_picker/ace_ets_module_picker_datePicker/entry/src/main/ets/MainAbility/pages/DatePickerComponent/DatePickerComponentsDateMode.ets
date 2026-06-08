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

import { DatePickerComponent, DatePickerComponentOptions, DisplayMode, DateMode } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentsDateMode {
  build() {
    Row() {
      Column() {
        Text('DatePickerComponent DateMode Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.DATE,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_dateMode_date')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.YEAR_AND_MONTH,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_dateMode_year_and_month')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.MONTH_AND_DAY,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_dateMode_month_and_day')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: null,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_dateMode_null')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: undefined,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_dateMode_undefined')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31')
            }
          }
        })
          .id('datePicker_dateMode_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}