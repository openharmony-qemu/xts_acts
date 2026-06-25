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

'use static';
import {
  Entry,
  ComponentV2,
  Scroll,
  Column,
  CounterV2Component,
  CounterV2Type,
  CounterV2DateData,
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct CounterV2AbnormalInline {
  build() {
    Column() {
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlValue_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: undefined,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80,
            } } }).id('abn_inlValue_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlMin_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: 10,
              min: undefined,
              max: 100,
              step: 1,
              textWidth: 80,
            } } }).id('abn_inlMin_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlMax_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: 10,
              min: 0,
              max: undefined,
              step: 1,
              textWidth: 80,
            } } }).id('abn_inlMax_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlStep_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: 10,
              min: 0,
              max: 100,
              step: undefined,
              textWidth: 80,
            } } }).id('abn_inlStep_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlTextWidth_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: undefined,
            } } }).id('abn_inlTextWidth_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlFocusable_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80,
              focusable: undefined,
            } } }).id('abn_inlFocusable_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlOnChange_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80,
              onChange: undefined,
            } } }).id('abn_inlOnChange_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlHoverInc_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80,
              onHoverIncrease: undefined,
            } } }).id('abn_inlHoverInc_u')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: { value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80 } } }).id('abn_inlHoverDec_d')
        CounterV2Component({ options: { type: CounterV2Type.INLINE,
            inlineOptions: {
              value: 10,
              min: 0,
              max: 100,
              step: 1,
              textWidth: 80,
              onHoverDecrease: undefined,
            } } }).id('abn_inlHoverDec_u')
      }
      .width('100%')
      .padding(12)
  }
}
