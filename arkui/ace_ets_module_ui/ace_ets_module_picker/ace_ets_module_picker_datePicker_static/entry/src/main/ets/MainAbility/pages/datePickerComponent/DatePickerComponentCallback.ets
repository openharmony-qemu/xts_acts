'use static'
/*
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
import { Entry, Column, Row, Component, Button, Text, Scroll } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { DatePickerComponent, DisplayMode, DateMode, TimeFormat, DatePickerComponentResult } from '@kit.ArkUI'

@Entry
@Component
struct DatePickerComponentCallback {
  @State onChangeTriggered: boolean = false
  @State onChangeYear: number = 0
  @State onChangeMonth: number = 0
  @State onChangeDay: number = 0
  @State onScrollStopTriggered: boolean = false
  @State onScrollStopYear: number = 0
  @State onScrollStopMonth: number = 0
  @State onScrollStopDay: number = 0
  @State onTimeChangeTriggered: boolean = false
  @State onTimeChangeHour: number = 0
  @State onTimeChangeMinute: number = 0
  @State onTimeScrollStopTriggered: boolean = false
  @State onTimeScrollStopHour: number = 0
  @State onTimeScrollStopMinute: number = 0

  aboutToAppear(): void {
    const routerInstance = this.getUIContext().getRouter()
    AppStorage.setOrCreate<Router>('router', routerInstance)
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('DatePickerComponent Callback Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('Date Picker onChange/onScrollStop')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.DATE,
              start: new Date(2020, 0, 1),
              end: new Date(2030, 11, 31),
              selected: new Date(2026, 5, 17),
              onChange: (result: DatePickerComponentResult) => {
                this.onChangeTriggered = true
                if (result.year !== undefined) {
                  this.onChangeYear = result.year
                }
                if (result.month !== undefined) {
                  this.onChangeMonth = result.month
                }
                if (result.day !== undefined) {
                  this.onChangeDay = result.day
                }
              },
              onScrollStop: (result: DatePickerComponentResult) => {
                this.onScrollStopTriggered = true
                if (result.year !== undefined) {
                  this.onScrollStopYear = result.year
                }
                if (result.month !== undefined) {
                  this.onScrollStopMonth = result.month
                }
                if (result.day !== undefined) {
                  this.onScrollStopDay = result.day
                }
              }
            }
          }
        })
          .id('datePickerComponent_callback_date')
          .width('100%')
          .height(200)

        Text(`onChange: triggered=${this.onChangeTriggered}, y=${this.onChangeYear}, m=${this.onChangeMonth}, d=${this.onChangeDay}`)
          .fontSize(14)
          .id('text_date_onChange_result')
          .margin({ bottom: 3 })

        Text(`onScrollStop: triggered=${this.onScrollStopTriggered}, y=${this.onScrollStopYear}, m=${this.onScrollStopMonth}, d=${this.onScrollStopDay}`)
          .fontSize(14)
          .id('text_date_onScrollStop_result')
          .margin({ bottom: 10 })

        Text('Time Picker onChange/onScrollStop')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 5 })

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.TIME,
            timeOptions: {
              format: TimeFormat.HOUR_MINUTE,
              useMilitaryTime: true,
              onChange: (result: DatePickerComponentResult) => {
                this.onTimeChangeTriggered = true
                if (result.hour !== undefined) {
                  this.onTimeChangeHour = result.hour
                }
                if (result.minute !== undefined) {
                  this.onTimeChangeMinute = result.minute
                }
              },
              onScrollStop: (result: DatePickerComponentResult) => {
                this.onTimeScrollStopTriggered = true
                if (result.hour !== undefined) {
                  this.onTimeScrollStopHour = result.hour
                }
                if (result.minute !== undefined) {
                  this.onTimeScrollStopMinute = result.minute
                }
              }
            }
          }
        })
          .id('datePickerComponent_callback_time')
          .width('100%')
          .height(200)

        Text(`onChange: triggered=${this.onTimeChangeTriggered}, h=${this.onTimeChangeHour}, m=${this.onTimeChangeMinute}`)
          .fontSize(14)
          .id('text_time_onChange_result')
          .margin({ bottom: 3 })

        Text(`onScrollStop: triggered=${this.onTimeScrollStopTriggered}, h=${this.onTimeScrollStopHour}, m=${this.onTimeScrollStopMinute}`)
          .fontSize(14)
          .id('text_time_onScrollStop_result')
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    }
    .width('100%')
    .height('100%')
  }
}
