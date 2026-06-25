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
import { CounterV2Component, CounterV2Type, CounterV2DateData } from '@kit.ArkUI';

@Entry
@ComponentV2
struct CounterV2AbnormalOptions {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_direction_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 },
            direction: undefined } }).id('abn_direction_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_numberOpts_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: undefined } }).id('abn_numberOpts_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlineOpts_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: undefined } }).id('abn_inlineOpts_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_dateOpts_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: undefined } }).id('abn_dateOpts_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
