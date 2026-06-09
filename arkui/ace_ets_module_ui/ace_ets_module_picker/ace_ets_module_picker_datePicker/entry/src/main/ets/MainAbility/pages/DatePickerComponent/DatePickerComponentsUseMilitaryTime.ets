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

import { DatePickerComponent, DisplayMode } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentsUseMilitaryTime {
  @State useMilitaryTimeValue: boolean | undefined = undefined;

  build() {
    Column({ space: 10 }) {
      Text('DatePickerComponent UseMilitaryTime Test')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('false')
          .id('datePicker_military_false')
          .onClick(() => {
            this.useMilitaryTimeValue = false;
          })
        Button('true')
          .id('datePicker_military_true')
          .onClick(() => {
            this.useMilitaryTimeValue = true;
          })
      }.width('80%')

      DatePickerComponent({
        options: {
          displayMode: DisplayMode.TIME,
          timeOptions: {
            useMilitaryTime: this.useMilitaryTimeValue,
            selected: new Date('2021-08-08T10:30:00'),
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31')
          }
        }
      })
        .id('datePicker_military_false')

      Text('DatePickerComponent 不设置useMilitaryTime')
        .fontSize(14)
        .fontWeight(FontWeight.Normal)
      
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.TIME,
          timeOptions: {
            selected: new Date('2021-08-08T10:30:00'),
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31')
          }
        }
      })
        .id('datePicker_military_default')
    }
    .width('100%')
    .margin({ top: 30 })
  }
}