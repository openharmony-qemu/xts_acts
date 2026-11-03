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

import { DatePickerComponent, DatePickerComponentOptions, DisplayMode, DateMode, TimeFormat, DatePickerComponentResult } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentHideYear {
  @State isHideYear: boolean = false;
  @State currentDisplayMode: DisplayMode = DisplayMode.DATE;
  @State currentDateMode: DateMode = DateMode.DATE;
  @State onChangeResult: string = '';
  @State onChangeTriggered: boolean = false;
  @State hideYearNull: boolean | null = null;
  @State hideYearUndefined: boolean | undefined = undefined;

  build() {
    Column({ space: 20 }) {
      DatePickerComponent({
        options: {
          displayMode: this.currentDisplayMode,
          dateOptions: {
            mode: this.currentDateMode,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
            hideYear: this.isHideYear,
            onChange: (result: DatePickerComponentResult) => {
              this.onChangeTriggered = true;
              this.onChangeResult = `year:${result.year},month:${result.month},day:${result.day}`;
            }
          },
          timeOptions: {
            format: TimeFormat.HOUR_MINUTE,
          }
        }
      })
        .id('datePickerComponent_hideYear')
        .width('100%')
        .height('30%')

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('hideYear_false')
          .onClick(() => {
            this.isHideYear = false;
          })
          .id('button_hideYear_false')
          .margin({ right: 10 })

        Button('hideYear_true')
          .onClick(() => {
            this.isHideYear = true;
          })
          .id('button_hideYear_true')
          .margin({ right: 10 })
      }
      .width('100%')
      .margin({ top: 10 })

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('displayMode_DATE')
          .onClick(() => {
            this.currentDisplayMode = DisplayMode.DATE;
          })
          .id('button_displayMode_date')
          .margin({ right: 10 })

        Button('displayMode_DATE_TIME')
          .onClick(() => {
            this.currentDisplayMode = DisplayMode.DATE_TIME;
          })
          .id('button_displayMode_dateTime')
          .margin({ right: 10 })

        Button('displayMode_TIME')
          .onClick(() => {
            this.currentDisplayMode = DisplayMode.TIME;
          })
          .id('button_displayMode_time')
          .margin({ right: 10 })
      }
      .width('100%')
      .margin({ top: 10 })

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('dateMode_DATE')
          .onClick(() => {
            this.currentDateMode = DateMode.DATE;
          })
          .id('button_dateMode_date')
          .margin({ right: 10 })

        Button('dateMode_YEAR_AND_MONTH')
          .onClick(() => {
            this.currentDateMode = DateMode.YEAR_AND_MONTH;
          })
          .id('button_dateMode_yearAndMonth')
          .margin({ right: 10 })

        Button('dateMode_MONTH_AND_DAY')
          .onClick(() => {
            this.currentDateMode = DateMode.MONTH_AND_DAY;
          })
          .id('button_dateMode_monthAndDay')
          .margin({ right: 10 })
      }
      .width('100%')
      .margin({ top: 10 })

      Text(`hideYear: ${this.isHideYear}`)
        .id('text_hideYear_value')
        .fontSize(16)

      Text(`onChangeTriggered: ${this.onChangeTriggered}`)
        .id('text_onChange_triggered')
        .fontSize(16)

      Text(`onChangeResult: ${this.onChangeResult}`)
        .id('text_onChange_result')
        .fontSize(16)

      Divider()
        .margin({ top: 10, bottom: 10 })

      Text('hideYear null/undefined exception scenarios')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      // Reference: hideYear = false
      Text('hideYear: false (reference)')
        .fontSize(12)
        .margin({ top: 5 })
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
            hideYear: false,
          }
        }
      })
        .id('datePickerComponent_hideYear_ref_false')
        .height('6%')
        .margin({ top: 3, bottom: 3 })

      // hideYear = null (should restore to default false)
      Text('hideYear: null (should restore to default)')
        .fontSize(12)
        .margin({ top: 5 })
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
            hideYear: this.hideYearNull as boolean,
          }
        }
      })
        .id('datePickerComponent_hideYear_null')
        .height('6%')
        .margin({ top: 3, bottom: 3 })

      // hideYear = undefined (should restore to default false)
      Text('hideYear: undefined (should restore to default)')
        .fontSize(12)
        .margin({ top: 5 })
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
            hideYear: this.hideYearUndefined as boolean,
          }
        }
      })
        .id('datePickerComponent_hideYear_undefined')
        .height('6%')
        .margin({ top: 3, bottom: 3 })

      // hideYear not set (should use default false)
      Text('hideYear: not set (should use default)')
        .fontSize(12)
        .margin({ top: 5 })
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
          }
        }
      })
        .id('datePickerComponent_hideYear_notSet')
        .height('6%')
        .margin({ top: 3, bottom: 3 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
