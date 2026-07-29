'use static';
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
  Entry,
  Component,
  State,
  Column,
  Flex,
  FlexWrap,
  FlexAlign,
  Button,
  Text,
  ColumnOptions,
} from '@kit.ArkUI';

import {
  DatePickerComponent,
  DatePickerComponentOptions,
  DisplayMode,
  DateMode,
  TimeFormat,
  DatePickerComponentResult,
  CommonOptions,
  DateOptions,
  TimeOptions
} from '@ohos.arkui.advanced.DatePickerComponent';

@Entry
@Component
struct DatePickerComponentDateMode {
  @State currentDateMode: DateMode = DateMode.DATE;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: this.currentDateMode,
          }
        }
      })
        .id('datePickerComponent_dateMode')
        .width('100%')
        .height('30%')

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('DATE')
          .onClick(() => {
            this.currentDateMode = DateMode.DATE;
          })
          .id('button_dateMode_date')
          .margin({ right: 10 })

        Button('YEAR_AND_MONTH')
          .onClick(() => {
            this.currentDateMode = DateMode.YEAR_AND_MONTH;
          })
          .id('button_dateMode_yearAndMonth')
          .margin({ right: 10 })

        Button('MONTH_AND_DAY')
          .onClick(() => {
            this.currentDateMode = DateMode.MONTH_AND_DAY;
          })
          .id('button_dateMode_monthAndDay')
          .margin({ right: 10 })
      }
      .width('100%')
      .margin({ top: 10 })

      Text(`dateMode: ${this.currentDateMode}`)
        .id('text_dateMode_value')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
