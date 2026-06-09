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
struct DatePickerComponentsStartEndSelected {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('DatePickerComponent Start/End/Selected Test')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.DATE,
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31'),
              selected: new Date('2021-08-08')
            }
          }
        })
          .id('datePicker_start_end_selected_valid')

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.DATE,
              start: undefined,
              end: new Date('2100-12-31'),
              selected: new Date('2021-08-08')
            }
          }
        })
          .id('datePicker_start_undefined')


        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.DATE,
              start: new Date('2000-1-1'),
              end: undefined,
              selected: new Date('2021-08-08')
            }
          }
        })
          .id('datePicker_end_undefined')


        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.DATE,
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31'),
              selected: undefined
            }
          }
        })
          .id('datePicker_selected_undefined')

        DatePickerComponent({
          options: {
            displayMode: DisplayMode.DATE,
            dateOptions: {
              mode: DateMode.DATE
            }
          }
        })
          .id('datePicker_start_end_selected_default')
      }
    }
    .height('100%')
    .padding(30)
  }
}