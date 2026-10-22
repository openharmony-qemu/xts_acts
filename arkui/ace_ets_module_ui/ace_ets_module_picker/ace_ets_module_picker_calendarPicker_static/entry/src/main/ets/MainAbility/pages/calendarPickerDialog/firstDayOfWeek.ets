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
  Column,
  Component,
  CalendarPickerDialog,
  Flex,
  FlexWrap,
  Button,
  ClickEvent,
  Margin,
  CalendarFirstDayOfWeek
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CalendarPickerDialogFirstDayOfWeekExample {
  private selectedDate: Date = new Date('2025-01-15');

  build() {
    Column() {
      Button('LOCAL')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: CalendarFirstDayOfWeek.LOCAL,
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
        }).id('firstDayOfWeek001')

      Button('MON')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: CalendarFirstDayOfWeek.MON,
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
        }).id('firstDayOfWeek002')

      Button('TUE')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: CalendarFirstDayOfWeek.TUE,
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
        }).id('firstDayOfWeek003')

      Button('WED')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: CalendarFirstDayOfWeek.WED,
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
        }).id('firstDayOfWeek004')

      Button('THU')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: CalendarFirstDayOfWeek.THU,
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
        }).id('firstDayOfWeek005')

      Button('FRI')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: CalendarFirstDayOfWeek.FRI,
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
        }).id('firstDayOfWeek006')

      Button('SAT')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: CalendarFirstDayOfWeek.SAT,
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
        }).id('firstDayOfWeek007')

      Button('SUN')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: CalendarFirstDayOfWeek.SUN,
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
        }).id('firstDayOfWeek008')

      Button('INVALID_-1')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: (-1) as ESObject as CalendarFirstDayOfWeek,
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
        }).id('firstDayOfWeek009')

      Button('INVALID_8')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: 8 as ESObject as CalendarFirstDayOfWeek,
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
        }).id('firstDayOfWeek010')

      Button('UNDEFINED')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            firstDayOfWeek: undefined as ESObject as CalendarFirstDayOfWeek,
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
        }).id('firstDayOfWeek011')
    }.width('100%').margin({ top: 50 } as Margin)
  }
}
