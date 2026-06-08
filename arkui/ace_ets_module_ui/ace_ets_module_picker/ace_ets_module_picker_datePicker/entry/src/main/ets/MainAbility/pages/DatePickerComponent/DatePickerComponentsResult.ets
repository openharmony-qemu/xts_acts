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

import { DatePickerComponent, DisplayMode, DateMode, TimeFormat, DatePickerComponentResult } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentsResult {
  @State dateOnChangeFlag: string = 'false'
  @State dateScrollStopFlag: string = 'false'
  @State dateYear: string = 'undefined'
  @State dateMonth: string = 'undefined'
  @State dateDay: string = 'undefined'
  @State dateHour: string = 'undefined'
  @State dateMinute: string = 'undefined'
  @State dateSecond: string = 'undefined'

  @State timeOnChangeFlag: string = 'false'
  @State timeYear: string = 'undefined'
  @State timeMonth: string = 'undefined'
  @State timeDay: string = 'undefined'
  @State timeHour: string = 'undefined'
  @State timeMinute: string = 'undefined'
  @State timeSecond: string = 'undefined'

  build() {
    Row() {
      Column() {
        Text('DatePickerComponent Result Test')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.DATE,
              selected: new Date('2021-08-08'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31'),
              onChange: (result: DatePickerComponentResult) => {
                if (result.year !== undefined) {
                  this.dateYear = String(result.year)
                } else {
                  this.dateYear = 'undefined'
                }
                if (result.month !== undefined) {
                  this.dateMonth = String(result.month)
                } else {
                  this.dateMonth = 'undefined'
                }
                if (result.day !== undefined) {
                  this.dateDay = String(result.day)
                } else {
                  this.dateDay = 'undefined'
                }
                if (result.hour !== undefined) {
                  this.dateHour = String(result.hour)
                } else {
                  this.dateHour = 'undefined'
                }
                if (result.minute !== undefined) {
                  this.dateMinute = String(result.minute)
                } else {
                  this.dateMinute = 'undefined'
                }
                if (result.second !== undefined) {
                  this.dateSecond = String(result.second)
                } else {
                  this.dateSecond = 'undefined'
                }
                this.dateOnChangeFlag = 'true'
              },
              onScrollStop: (result: DatePickerComponentResult) => {
                this.dateScrollStopFlag = 'true'
              }
            }
          }
        })
          .id('datePicker_result_date')
          .height('15%')
          .margin({ top: 5, bottom: 5 })

        Row() {
          Text(this.dateOnChangeFlag).id('date_onChange_flag').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.dateYear).id('date_result_year').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.dateMonth).id('date_result_month').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.dateDay).id('date_result_day').fontSize(12).margin({ left: 2, right: 2 })
        }
        Row() {
          Text(this.dateHour).id('date_result_hour').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.dateMinute).id('date_result_minute').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.dateSecond).id('date_result_second').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.dateScrollStopFlag).id('date_scrollStop_flag').fontSize(12).margin({ left: 2, right: 2 })
        }

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.TIME,
            timeOptions: {
              format: TimeFormat.HOUR_MINUTE_SECOND,
              selected: new Date('2021-08-08T10:30:45'),
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31'),
              onChange: (result: DatePickerComponentResult) => {
                if (result.year !== undefined) {
                  this.timeYear = String(result.year)
                } else {
                  this.timeYear = 'undefined'
                }
                if (result.month !== undefined) {
                  this.timeMonth = String(result.month)
                } else {
                  this.timeMonth = 'undefined'
                }
                if (result.day !== undefined) {
                  this.timeDay = String(result.day)
                } else {
                  this.timeDay = 'undefined'
                }
                if (result.hour !== undefined) {
                  this.timeHour = String(result.hour)
                } else {
                  this.timeHour = 'undefined'
                }
                if (result.minute !== undefined) {
                  this.timeMinute = String(result.minute)
                } else {
                  this.timeMinute = 'undefined'
                }
                if (result.second !== undefined) {
                  this.timeSecond = String(result.second)
                } else {
                  this.timeSecond = 'undefined'
                }
                this.timeOnChangeFlag = 'true'
              }
            }
          }
        })
          .id('datePicker_result_time')
          .height('15%')
          .margin({ top: 5, bottom: 5 })

        Row() {
          Text(this.timeOnChangeFlag).id('time_onChange_flag').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.timeHour).id('time_result_hour').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.timeMinute).id('time_result_minute').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.timeSecond).id('time_result_second').fontSize(12).margin({ left: 2, right: 2 })
        }
        Row() {
          Text(this.timeYear).id('time_result_year').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.timeMonth).id('time_result_month').fontSize(12).margin({ left: 2, right: 2 })
          Text(this.timeDay).id('time_result_day').fontSize(12).margin({ left: 2, right: 2 })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}