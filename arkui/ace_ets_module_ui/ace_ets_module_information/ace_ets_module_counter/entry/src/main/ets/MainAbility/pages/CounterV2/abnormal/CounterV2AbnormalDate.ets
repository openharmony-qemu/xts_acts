/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
struct CounterV2AbnormalDate {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_dateYear_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: undefined,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              },
            } } }).id('abn_dateYear_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_dateMonth_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: 2024,
              month: undefined,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              },
            } } }).id('abn_dateMonth_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_dateDay_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: 2024,
              month: 6,
              day: undefined,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              },
            } } }).id('abn_dateDay_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_dateFocusable_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              },
              focusable: undefined,
            } } }).id('abn_dateFocusable_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_dateStep_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              },
              step: undefined,
            } } }).id('abn_dateStep_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_dateHoverInc_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              },
              onHoverIncrease: undefined,
            } } }).id('abn_dateHoverInc_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_dateHoverDec_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              },
              onHoverDecrease: undefined,
            } } }).id('abn_dateHoverDec_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: { year: 2024,
              month: 6,
              day: 5,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] abn date: ' + date.toString());
              } } } }).id('abn_onDateChange_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: 2024,
              month: 6,
              day: 5,
              onDateChange: undefined,
            } } }).id('abn_onDateChange_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
