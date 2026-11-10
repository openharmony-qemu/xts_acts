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

import {
  DatePickerComponent,
  DatePickerComponentOptions,
  DisplayMode,
  DateMode,
  TimeFormat,
  DatePickerComponentResult
} from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentHideYear {
  @State isHideYear: boolean | null | undefined = false;
  @State currentDisplayMode: DisplayMode = DisplayMode.DATE;
  @State currentDateMode: DateMode = DateMode.DATE;
  @State onChangeResult: string = '';
  @State onChangeTriggered: boolean | undefined | null = false;

  build() {
    Column({ space: 10 }) {
      DatePickerComponent({
        options: {
          displayMode: this.currentDisplayMode,
          dateOptions: {
            mode: this.currentDateMode,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
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
        .id('datePickerComponent_hideYear_default')
        .width('100%')
        .height('20%')

      DatePickerComponent({
        options: {
          displayMode: this.currentDisplayMode,
          dateOptions: {
            mode: this.currentDateMode,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
            hideYear: this.isHideYear as boolean,
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
        .height('20%')
      Scroll() {
        Column({ space: 10 }) {
          Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
            Button('hideYear_false')
              .onClick(() => {
                this.isHideYear = false;
              })
              .id('button_hideYear_false')
              .margin({ right: 10 })
              .height('6%')

            Button('hideYear_true')
              .onClick(() => {
                this.isHideYear = true;
              })
              .id('button_hideYear_true')
              .margin({ right: 10 })
              .height('6%')

            Button('hideYear_null')
              .onClick(() => {
                this.isHideYear = null;
              })
              .id('button_hideYear_null')
              .margin({ right: 10 })
              .height('6%')

            Button('hideYear_undefined')
              .onClick(() => {
                this.isHideYear = undefined;
              })
              .id('button_hideYear_undefined')
              .margin({ right: 10 })
              .height('6%')
          }
          .width('80%')

          Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
            Button('displayMode_DATE')
              .onClick(() => {
                this.currentDisplayMode = DisplayMode.DATE;
              })
              .id('button_displayMode_date')
              .margin({ right: 10 })
              .height('6%')

            Button('displayMode_DATE_TIME')
              .onClick(() => {
                this.currentDisplayMode = DisplayMode.DATE_TIME;
              })
              .id('button_displayMode_dateTime')
              .margin({ right: 10 })
              .height('6%')

            Button('displayMode_TIME')
              .onClick(() => {
                this.currentDisplayMode = DisplayMode.TIME;
              })
              .id('button_displayMode_time')
              .margin({ right: 10 })
              .height('6%')
          }
          .width('80%')

          Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
            Button('dateMode_DATE')
              .onClick(() => {
                this.currentDateMode = DateMode.DATE;
              })
              .id('button_dateMode_date')
              .margin({ right: 10 })
              .height('6%')

            Button('dateMode_YEAR_AND_MONTH')
              .onClick(() => {
                this.currentDateMode = DateMode.YEAR_AND_MONTH;
              })
              .id('button_dateMode_yearAndMonth')
              .margin({ right: 10 })
              .height('6%')

            Button('dateMode_MONTH_AND_DAY')
              .onClick(() => {
                this.currentDateMode = DateMode.MONTH_AND_DAY;
              })
              .id('button_dateMode_monthAndDay')
              .margin({ right: 10 })
              .height('6%')
          }
          .width('80%')

          Text(`hideYear: ${this.isHideYear}`)
            .id('text_hideYear_value')
            .fontSize(12)

          Text(`onChangeTriggered: ${this.onChangeTriggered}`)
            .id('text_onChange_triggered')
            .fontSize(12)

          Text(`onChangeResult: ${this.onChangeResult}`)
            .id('text_onChange_result')
            .fontSize(12)
        }
      }
      .id('indexScrollKey')
      .height("60%")
    }
    .width('100%')
    .height('100%')
  }
}