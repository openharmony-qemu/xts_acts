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
import { Entry, Column, Row, Component, Button, Text, Scroll, Toggle, ToggleType } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { DatePickerComponent, DisplayMode, DateMode } from '@kit.ArkUI'

@Entry
@Component
struct DatePickerComponentDateOptions {
  @State currentDateMode: DateMode = DateMode.DATE
  @State isLunar: boolean = false
  @State canLoop: boolean = true
  @State enableHaptic: boolean = true

  aboutToAppear(): void {
    const routerInstance = this.getUIContext().getRouter()
    AppStorage.setOrCreate<Router>('router', routerInstance)
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('DatePickerComponent DateOptions Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Column() {
          Text('Control Panel')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 8 })

          Row() {
            Text('DateMode:')
              .fontSize(14)
              .width(120)
            Button('DATE')
              .fontSize(12)
              .width(80)
              .height(30)
              .backgroundColor(this.currentDateMode === DateMode.DATE ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.currentDateMode = DateMode.DATE
              })
              .id('btn_mode_date')
            Button('YEAR_MONTH')
              .fontSize(12)
              .width(80)
              .height(30)
              .margin({ left: 5 })
              .backgroundColor(this.currentDateMode === DateMode.YEAR_AND_MONTH ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.currentDateMode = DateMode.YEAR_AND_MONTH
              })
              .id('btn_mode_year_month')
            Button('MONTH_DAY')
              .fontSize(12)
              .width(80)
              .height(30)
              .margin({ left: 5 })
              .backgroundColor(this.currentDateMode === DateMode.MONTH_AND_DAY ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.currentDateMode = DateMode.MONTH_AND_DAY
              })
              .id('btn_mode_month_day')
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ bottom: 8 })

          Row() {
            Text('Lunar:')
              .fontSize(14)
              .width(120)
            Toggle({ type: ToggleType.Switch, isOn: this.isLunar })
              .onChange((isOn: boolean) => {
                this.isLunar = isOn
              })
              .selectedColor('#007DFF')
              .id('toggle_lunar')
            Text(this.isLunar ? 'ON' : 'OFF')
              .fontSize(14)
              .margin({ left: 10 })
              .id('text_lunar_state')
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ bottom: 8 })

          Row() {
            Text('Loop:')
              .fontSize(14)
              .width(120)
            Button('true')
              .fontSize(12)
              .width(60)
              .height(30)
              .backgroundColor(this.canLoop ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.canLoop = true
              })
              .id('btn_loop_true')
            Button('false')
              .fontSize(12)
              .width(60)
              .height(30)
              .margin({ left: 5 })
              .backgroundColor(!this.canLoop ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.canLoop = false
              })
              .id('btn_loop_false')
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ bottom: 8 })

          Row() {
            Text('Haptic:')
              .fontSize(14)
              .width(120)
            Button('true')
              .fontSize(12)
              .width(60)
              .height(30)
              .backgroundColor(this.enableHaptic ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.enableHaptic = true
              })
              .id('btn_haptic_true')
            Button('false')
              .fontSize(12)
              .width(60)
              .height(30)
              .margin({ left: 5 })
              .backgroundColor(!this.enableHaptic ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.enableHaptic = false
              })
              .id('btn_haptic_false')
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ bottom: 8 })

          Text(`Mode: ${this.getDateModeText()} | Lunar: ${this.isLunar ? 'ON' : 'OFF'} | Loop: ${this.canLoop ? 'ON' : 'OFF'} | Haptic: ${this.enableHaptic ? 'ON' : 'OFF'}`)
            .fontSize(12)
            .id('text_dateOptions_state')
            .margin({ bottom: 5 })
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E8F4FF')
        .borderRadius(8)

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: this.currentDateMode,
              lunar: this.isLunar,
              start: new Date(2020, 0, 1),
              end: new Date(2030, 11, 31),
              selected: new Date(2026, 5, 17),
              loop: this.canLoop,
              enableHapticFeedback: this.enableHaptic
            }
          }
        })
          .id('datePickerComponent_dateOptions')
          .width('100%')
          .height(200)
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    }
    .width('100%')
    .height('100%')
  }

  private getDateModeText(): string {
    if (this.currentDateMode === DateMode.DATE) return 'DATE'
    if (this.currentDateMode === DateMode.YEAR_AND_MONTH) return 'YEAR_MONTH'
    if (this.currentDateMode === DateMode.MONTH_AND_DAY) return 'MONTH_DAY'
    return 'UNKNOWN'
  }
}
