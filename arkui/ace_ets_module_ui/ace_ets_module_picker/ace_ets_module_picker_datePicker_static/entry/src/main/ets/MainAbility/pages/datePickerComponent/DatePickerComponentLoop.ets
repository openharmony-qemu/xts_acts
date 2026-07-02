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
struct DatePickerComponentLoop {
  @State canLoop: boolean = true;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE_TIME,
          dateOptions: {
            mode: DateMode.DATE,
            loop: this.canLoop,
          },
          timeOptions: {
            format: TimeFormat.HOUR_MINUTE,
            loop: this.canLoop,
          }
        }
      })
        .id('datePickerComponent_loop')
        .width('100%')
        .height('30%')

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('loop_true')
          .onClick(() => {
            this.canLoop = true;
          })
          .id('button_loop_true')
          .margin({ right: 10 })

        Button('loop_false')
          .onClick(() => {
            this.canLoop = false;
          })
          .id('button_loop_false')
          .margin({ right: 10 })
      }
      .width('100%')
      .margin({ top: 10 })

      Text(`loop: ${this.canLoop}`)
        .id('text_loop_value')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
