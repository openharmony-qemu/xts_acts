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

import { DatePickerComponent, DisplayMode, DateMode } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentsDateMode {
  @State dateModeValue: DateMode | undefined = undefined

  build() {
    Column({ space: 10 }) {
      Text('DatePickerComponent DateMode Test')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: this.dateModeValue,
            selected: new Date('2021-08-08'),
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31')
          }
        }
      })

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('date')
          .id('datePicker_dateMode_date')
          .onClick(() => {
            this.dateModeValue = DateMode.DATE;
          })
        Button('year_and_month')
          .id('datePicker_dateMode_year_and_month')
          .onClick(() => {
            this.dateModeValue = DateMode.YEAR_AND_MONTH;
          })
        Button('month_and_day')
          .id('datePicker_dateMode_month_and_day')
          .onClick(() => {
            this.dateModeValue = DateMode.MONTH_AND_DAY;
          })
      }.width('80%')

      Text('DatePickerComponent 不设置DateMode')
        .fontSize(14)
        .fontWeight(FontWeight.Normal)

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
    }
    .width('100%')
    .margin({ top: 30 })
  }
}