'use static';
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
  Column,
  ComponentV2,
  CounterV2Component,
  CounterV2Type,
  Direction,
  Entry,
  FlexAlign,
  HorizontalAlign,
  Margin,
  State,
  CounterV2Options,
  CounterV2DateData,
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct CounterV2AttrsPage {
  build() {
    Column() {
      //列表型Counter  focusable true
      CounterV2Component({
        options: {
          direction: Direction.Rtl,
          type: CounterV2Type.LIST,
          numberOptions: {
            focusable: true,
            label: '价格',
            min: 0,
            value: 5,
            max: 10,
          }
        }
      }).width('50%')
      //数值型Counter
      CounterV2Component({
        options: {
          direction: Direction.Ltr,
          type: CounterV2Type.COMPACT,
          numberOptions: {
            label: '数量',
            value: 10,
            min: 0,
            max: 100,
            step: 10
          }
        }
      }).margin({ top: 10 } as Margin)
      //数值内联型Counter
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE,
          direction: Direction.Auto,
          inlineOptions: {
            value: 100,
            min: 10,
            step: 2,
            max: 1000,
            textWidth: 100,
            onChange: (value: int) => {
              console.log(`onCounterChange Counter: ${value}`);
            }
          }
        }
      }).margin({ top: 10 } as Margin)
      //日期内联型counter
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          direction: undefined,
          dateOptions: {
            year: 2025,
            month: 3,
            day: 18,
            onDateChange: (date: CounterV2DateData) => {
              console.log(`onDateChange Date: ${date.toString()}`);
            }
          }
        }
      }).margin({ top: 10 } as Margin)
      //日期内联型counter  undefined/year,month,day
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          direction: undefined,
          dateOptions: {
            year: undefined,
            month: undefined,
            day: undefined,
            onDateChange: (date: CounterV2DateData) => {
              console.log(`onDateChange Date: ${date.toString()}`);
              console.log('onDateChange Date: ' + date.year);
              console.log('onDateChange Date: ' + date.month);
              console.log('onDateChange Date: ' + date.day);
            }
          }
        }
      }).margin({ top: 10 } as Margin)
      //列表型Counter focusable false
      CounterV2Component({
        options: {
          direction: Direction.Rtl,
          type: CounterV2Type.LIST,
          numberOptions: {
            focusable: false,
            label: '价格',
            min: 0,
            value: 5,
            max: 10,
          }
        }
      }).width('50%')
      //列表型Counter focusable undefined
      CounterV2Component({
        options: {
          direction: Direction.Rtl,
          type: CounterV2Type.LIST,
          numberOptions: {
            focusable: undefined,
            label: '价格',
            min: 0,
            value: 5,
            max: 10,
          }
        }
      }).width('50%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}