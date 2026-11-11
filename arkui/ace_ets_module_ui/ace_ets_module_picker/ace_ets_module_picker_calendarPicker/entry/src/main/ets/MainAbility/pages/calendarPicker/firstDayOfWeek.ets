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

@Entry
@Component
struct CalendarPickerFirstDayOfWeekExample {
  private selectedDate: Date = new Date('2025-01-15');

  build() {
    Scroll() {
      Flex({
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.Center,
        alignItems: ItemAlign.Center
      }) {
        Text('firstDayOfWeek test')
          .fontSize(20)
          .margin({ top: 20, bottom: 20 })
          .width('100%')
          .textAlign(TextAlign.Center)

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(CalendarFirstDayOfWeek.LOCAL)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek001')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(CalendarFirstDayOfWeek.MON)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek002')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(CalendarFirstDayOfWeek.TUE)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek003')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(CalendarFirstDayOfWeek.WED)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek004')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(CalendarFirstDayOfWeek.THU)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek005')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(CalendarFirstDayOfWeek.FRI)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek006')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(CalendarFirstDayOfWeek.SAT)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek007')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(CalendarFirstDayOfWeek.SUN)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek008')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek((-1) as ESObject as CalendarFirstDayOfWeek)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek009')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(8 as ESObject as CalendarFirstDayOfWeek)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek010')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(undefined as ESObject as CalendarFirstDayOfWeek)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek011')

        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .firstDayOfWeek(null as ESObject as CalendarFirstDayOfWeek)
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('firstDayOfWeek012')
      }
      .width('100%')
      .padding({ top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Auto)
    .align(Alignment.Top)
  }
}
