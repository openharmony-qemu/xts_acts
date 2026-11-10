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
struct CalendarPickerDialogFirstDayOfWeekPage {
  private selectedDate: Date = new Date('2025-01-15');

  showDialog(firstDayOfWeek: CalendarFirstDayOfWeek) {
    CalendarPickerDialog.show({
      selected: this.selectedDate,
      firstDayOfWeek: firstDayOfWeek,
      onAccept: (value) => {
        console.info('calendar onAccept:' + JSON.stringify(value));
      },
      onCancel: () => {
        console.info('calendar onCancel');
      },
      onChange: (value) => {
        console.info('calendar onChange:' + JSON.stringify(value));
      }
    });
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Text('firstDayOfWeek test')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
        .width('100%')
        .textAlign(TextAlign.Center)

      Button('LOCAL')
        .margin(10)
        .onClick(() => {
          this.showDialog(CalendarFirstDayOfWeek.LOCAL);
        }).id('firstDayOfWeek001')

      Button('MON')
        .margin(10)
        .onClick(() => {
          this.showDialog(CalendarFirstDayOfWeek.MON);
        }).id('firstDayOfWeek002')

      Button('TUE')
        .margin(10)
        .onClick(() => {
          this.showDialog(CalendarFirstDayOfWeek.TUE);
        }).id('firstDayOfWeek003')

      Button('WED')
        .margin(10)
        .onClick(() => {
          this.showDialog(CalendarFirstDayOfWeek.WED);
        }).id('firstDayOfWeek004')

      Button('THU')
        .margin(10)
        .onClick(() => {
          this.showDialog(CalendarFirstDayOfWeek.THU);
        }).id('firstDayOfWeek005')

      Button('FRI')
        .margin(10)
        .onClick(() => {
          this.showDialog(CalendarFirstDayOfWeek.FRI);
        }).id('firstDayOfWeek006')

      Button('SAT')
        .margin(10)
        .onClick(() => {
          this.showDialog(CalendarFirstDayOfWeek.SAT);
        }).id('firstDayOfWeek007')

      Button('SUN')
        .margin(10)
        .onClick(() => {
          this.showDialog(CalendarFirstDayOfWeek.SUN);
        }).id('firstDayOfWeek008')

      Button('INVALID_-1')
        .margin(10)
        .onClick(() => {
          this.showDialog((-1) as ESObject as CalendarFirstDayOfWeek);
        }).id('firstDayOfWeek009')

      Button('INVALID_8')
        .margin(10)
        .onClick(() => {
          this.showDialog(8 as ESObject as CalendarFirstDayOfWeek);
        }).id('firstDayOfWeek010')

      Button('UNDEFINED')
        .margin(10)
        .onClick(() => {
          this.showDialog(undefined as ESObject as CalendarFirstDayOfWeek);
        }).id('firstDayOfWeek011')

      Button('NULL')
        .margin(10)
        .onClick(() => {
          this.showDialog(null as ESObject as CalendarFirstDayOfWeek);
        }).id('firstDayOfWeek012')
    }.width('100%')
  }
}
