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
struct DatePickerComponentLunar {
  @State isLunar: boolean = false;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            lunar: this.isLunar,
          }
        }
      })
        .id('datePickerComponent_lunar')
        .width('100%')
        .height('30%')

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('lunar_false')
          .onClick(() => {
            this.isLunar = false;
          })
          .id('button_lunar_false')
          .margin({ right: 10 })

        Button('lunar_true')
          .onClick(() => {
            this.isLunar = true;
          })
          .id('button_lunar_true')
          .margin({ right: 10 })
      }
      .width('100%')
      .margin({ top: 10 })

      Text(`lunar: ${this.isLunar}`)
        .id('text_lunar_value')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
