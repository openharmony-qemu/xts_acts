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
import { DatePickerComponent, DisplayMode, TimeFormat } from '@kit.ArkUI'

@Entry
@Component
struct DatePickerComponentTimeOptions {
  @State currentTimeFormat: TimeFormat = TimeFormat.HOUR_MINUTE
  @State isMilitaryTime: boolean = false
  @State canLoop: boolean = true
  @State enableHaptic: boolean = true

  aboutToAppear(): void {
    const routerInstance = this.getUIContext().getRouter()
    AppStorage.setOrCreate<Router>('router', routerInstance)
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('DatePickerComponent TimeOptions Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Column() {
          Text('Control Panel')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 8 })

          Row() {
            Text('Format:')
              .fontSize(14)
              .width(120)
            Button('H:M')
              .fontSize(12)
              .width(60)
              .height(30)
              .backgroundColor(this.currentTimeFormat === TimeFormat.HOUR_MINUTE ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.currentTimeFormat = TimeFormat.HOUR_MINUTE
              })
              .id('btn_format_hour_minute')
            Button('H:M:S')
              .fontSize(12)
              .width(60)
              .height(30)
              .margin({ left: 5 })
              .backgroundColor(this.currentTimeFormat === TimeFormat.HOUR_MINUTE_SECOND ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.currentTimeFormat = TimeFormat.HOUR_MINUTE_SECOND
              })
              .id('btn_format_hour_minute_second')
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ bottom: 8 })

          Row() {
            Text('Military:')
              .fontSize(14)
              .width(120)
            Toggle({ type: ToggleType.Switch, isOn: this.isMilitaryTime })
              .onChange((isOn: boolean) => {
                this.isMilitaryTime = isOn
              })
              .selectedColor('#007DFF')
              .id('toggle_military')
            Text(this.isMilitaryTime ? '24H' : '12H')
              .fontSize(14)
              .margin({ left: 10 })
              .id('text_military_state')
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
              .id('btn_timeLoop_true')
            Button('false')
              .fontSize(12)
              .width(60)
              .height(30)
              .margin({ left: 5 })
              .backgroundColor(!this.canLoop ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.canLoop = false
              })
              .id('btn_timeLoop_false')
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
              .id('btn_timeHaptic_true')
            Button('false')
              .fontSize(12)
              .width(60)
              .height(30)
              .margin({ left: 5 })
              .backgroundColor(!this.enableHaptic ? '#007DFF' : '#E0E0E0')
              .onClick(() => {
                this.enableHaptic = false
              })
              .id('btn_timeHaptic_false')
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ bottom: 8 })

          Text(`Format: ${this.currentTimeFormat === TimeFormat.HOUR_MINUTE ? 'H:M' : 'H:M:S'} | Military: ${this.isMilitaryTime ? '24H' : '12H'} | Loop: ${this.canLoop ? 'ON' : 'OFF'} | Haptic: ${this.enableHaptic ? 'ON' : 'OFF'}`)
            .fontSize(12)
            .id('text_timeOptions_state')
            .margin({ bottom: 5 })
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E8F4FF')
        .borderRadius(8)

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.TIME,
            timeOptions: {
              format: this.currentTimeFormat,
              useMilitaryTime: this.isMilitaryTime,
              loop: this.canLoop,
              enableHapticFeedback: this.enableHaptic
            }
          }
        })
          .id('timePickerComponent_timeOptions')
          .width('100%')
          .height(200)
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    }
    .width('100%')
    .height('100%')
  }
}
