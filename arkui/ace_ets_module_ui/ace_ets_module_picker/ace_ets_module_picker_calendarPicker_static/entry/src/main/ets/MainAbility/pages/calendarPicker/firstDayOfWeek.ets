'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Column,
  Text,
  ColumnOptions,
  CalendarPicker,
  CalendarFirstDayOfWeek
} from '@ohos.arkui.component';

@Entry
@Component
struct CalendarPickerFirstDayOfWeek {
  private selectedDate: Date = new Date('2025-01-15');

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('firstDayOfWeek test')
        .fontSize(16)
        .margin({ top: 10, bottom: 10 })

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(CalendarFirstDayOfWeek.LOCAL)
        .margin(10)
        .id('calendarPicker001')

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(CalendarFirstDayOfWeek.MON)
        .margin(10)
        .id('calendarPicker002')

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(CalendarFirstDayOfWeek.TUE)
        .margin(10)
        .id('calendarPicker003')

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(CalendarFirstDayOfWeek.WED)
        .margin(10)
        .id('calendarPicker004')

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(CalendarFirstDayOfWeek.THU)
        .margin(10)
        .id('calendarPicker005')

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(CalendarFirstDayOfWeek.FRI)
        .margin(10)
        .id('calendarPicker006')

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(CalendarFirstDayOfWeek.SAT)
        .margin(10)
        .id('calendarPicker007')

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(CalendarFirstDayOfWeek.SUN)
        .margin(10)
        .id('calendarPicker008')

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .firstDayOfWeek(undefined)
        .margin(10)
        .id('calendarPicker011')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
