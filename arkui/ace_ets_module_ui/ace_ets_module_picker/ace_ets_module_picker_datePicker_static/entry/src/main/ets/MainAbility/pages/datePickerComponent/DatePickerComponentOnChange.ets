'use static'
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
struct DatePickerComponentOnChange {
  @State onChangeResult: string = '';
  @State onChangeTriggered: boolean = false;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
            onChange: (result: DatePickerComponentResult) => {
              this.onChangeTriggered = true;
              this.onChangeResult = `year:${result.year},month:${result.month},day:${result.day}`;
            }
          }
        }
      })
        .id('datePickerComponent_onChange')
        .width('100%')
        .height('30%')

      Text(`onChangeTriggered: ${this.onChangeTriggered}`)
        .id('text_onChange_triggered')
        .fontSize(16)

      Text(`onChangeResult: ${this.onChangeResult}`)
        .id('text_onChange_result')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
