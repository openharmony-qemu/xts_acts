'use static';
/*
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
  Column,
  Component,
  Row,
  Color,
  Text,
  TimePicker,
  TimePickerFormat,
  TimePickerResult
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TimePickerOnChange {
  private selectedTime: Date = new Date('2022-07-22T08:00:00');
  @State onChangeHmResult: string = 'init';
  @State onChangeHmsResult: string = 'init';
  @State onChange12hResult: string = 'init';

  build() {
    Column(undefined) {
      TimePicker({ selected: this.selectedTime })
        .id('timepicker_onchange_hm')
        .height('18%')
        .onChange((value: TimePickerResult) => {
          this.onChangeHmResult = JSON.stringify(value);
        })
      Text('hm_result:' + this.onChangeHmResult)
        .id('text_onchange_hm_result')
        .fontSize(12)

      TimePicker({
        selected: this.selectedTime,
        format: TimePickerFormat.HOUR_MINUTE_SECOND
      })
        .id('timepicker_onchange_hms')
        .height('18%')
        .onChange((value: TimePickerResult) => {
          this.onChangeHmsResult = JSON.stringify(value);
        })
      Text('hms_result:' + this.onChangeHmsResult)
        .id('text_onchange_hms_result')
        .fontSize(12)

      TimePicker({ selected: this.selectedTime })
        .id('timepicker_onchange_12h')
        .height('18%')
        .useMilitaryTime(false)
        .onChange((value: TimePickerResult) => {
          this.onChange12hResult = JSON.stringify(value);
        })
      Text('12h_result:' + this.onChange12hResult)
        .id('text_onchange_12h_result')
        .fontSize(12)

      TimePicker({ selected: this.selectedTime })
        .id('timepicker_onchange_undefined')
        .height('10%')
        .onChange(undefined)
    }.width('100%').height('100%')
  }
}
