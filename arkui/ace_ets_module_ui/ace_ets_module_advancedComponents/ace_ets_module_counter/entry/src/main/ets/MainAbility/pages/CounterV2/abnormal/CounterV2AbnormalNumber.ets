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
struct CounterV2AbnormalNumber {
  build() {
    Scroll() {
      Column({ space: 8 }) {
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_label_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: undefined,
              value: 5,
              min: 0,
              max: 10,
              step: 1,
            } } }).id('abn_label_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_value_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: undefined,
              min: 0,
              max: 10,
              step: 1,
            } } }).id('abn_value_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_min_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: undefined,
              max: 10,
              step: 1,
            } } }).id('abn_min_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_max_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: undefined,
              step: 1,
            } } }).id('abn_max_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_step_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: undefined,
            } } }).id('abn_step_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_textWidth_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              textWidth: undefined,
            } } }).id('abn_textWidth_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_focusable_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              focusable: undefined,
            } } }).id('abn_focusable_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_onChange_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              onChange: undefined,
            } } }).id('abn_onChange_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_onFocusInc_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              onFocusIncrease: undefined,
            } } }).id('abn_onFocusInc_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_onFocusDec_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              onFocusDecrease: undefined,
            } } }).id('abn_onFocusDec_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_onBlurInc_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              onBlurIncrease: undefined,
            } } }).id('abn_onBlurInc_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_onBlurDec_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              onBlurDecrease: undefined,
            } } }).id('abn_onBlurDec_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_onHoverInc_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              onHoverIncrease: undefined,
            } } }).id('abn_onHoverInc_u')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: { label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1 } } }).id('abn_onHoverDec_d')
        CounterV2Component({ options: { type: CounterV2Type.LIST,
            numberOptions: {
              label: 'num',
              value: 5,
              min: 0,
              max: 10,
              step: 1,
              onHoverDecrease: undefined,
            } } }).id('abn_onHoverDec_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
