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
  DatePickerComponent,
  DatePickerComponentOptions,
  DisplayMode,
  DateMode,
  DatePickerComponentResult
} from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentExtendSelected {
  @State onChangeResult1: string = '';
  @State onChangeTriggered1: boolean = false;
  @State onChangeResult2: string = '';
  @State onChangeTriggered2: boolean = false;
  @State onChangeResult3: string = '';
  @State onChangeTriggered3: boolean = false;
  @State resultExtendSelected: DatePickerComponentResult = { year: 2026, month: 0, day: 1 };

  build() {
    Column({ space: 10 }) {
      // 测试1: extendSelected 传入 Date 类型（合理取值）
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            extendSelected: new Date(2025, 5, 15),
            onChange: (result: DatePickerComponentResult) => {
              this.onChangeTriggered1 = true;
              this.onChangeResult1 = `year:${result.year},month:${result.month},day:${result.day}`;
            }
          }
        }
      })
        .id('datePickerComponent_extendSelected_date')
        .width('100%')
        .height('20%')

      // 测试2: extendSelected 传入 DatePickerComponentResult 类型（合理取值）
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            extendSelected: this.resultExtendSelected,
            onChange: (result: DatePickerComponentResult) => {
              this.onChangeTriggered2 = true;
              this.onChangeResult2 = `year:${result.year},month:${result.month},day:${result.day}`;
            }
          }
        }
      })
        .id('datePickerComponent_extendSelected_result')
        .width('100%')
        .height('20%')

      // 测试3: extendSelected 未设置（undefined，默认行为）
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            mode: DateMode.DATE,
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            onChange: (result: DatePickerComponentResult) => {
              this.onChangeTriggered3 = true;
              this.onChangeResult3 = `year:${result.year},month:${result.month},day:${result.day}`;
            }
          }
        }
      })
        .id('datePickerComponent_extendSelected_undefined')
        .width('100%')
        .height('20%')

      Text(`onChange1: ${this.onChangeTriggered1}, ${this.onChangeResult1}`)
        .id('text_extendSelected_date_result')
        .fontSize(12)

      Text(`onChange2: ${this.onChangeTriggered2}, ${this.onChangeResult2}`)
        .id('text_extendSelected_result_result')
        .fontSize(12)

      Text(`onChange3: ${this.onChangeTriggered3}, ${this.onChangeResult3}`)
        .id('text_extendSelected_undefined_result')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
