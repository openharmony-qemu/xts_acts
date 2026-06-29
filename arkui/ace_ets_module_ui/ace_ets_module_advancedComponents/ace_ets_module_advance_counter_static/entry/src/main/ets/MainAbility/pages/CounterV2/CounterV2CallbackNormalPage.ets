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

'use static';
import {
  Entry,
  ComponentV2,
  Column,
  CounterV2Component,
  CounterV2Type,
  CounterV2DateData,
} from '@kit.ArkUI';

function logVoid(tag: string): () => void {
  return () => {
    console.info(`[CounterV2Norm] ${tag}`);
  };
}

function logHover(tag: string): (isHover: boolean) => void {
  return (isHover: boolean) => {
    console.info(`[CounterV2Norm] ${tag} hover=${isHover}`);
  };
}

@Entry
@ComponentV2
struct CounterV2CallbackNormalPage {
  build() {
    Column() {
      CounterV2Component({
        options: {
          type: CounterV2Type.LIST,
          numberOptions: {
            label: 'num_cb',
            value: 5,
            min: 0,
            max: 10,
            step: 1,
            onChange: (value: int) => {
              console.info(`[CounterV2Norm] onChange ${value}`);
            },
            onFocusIncrease: logVoid('onFocusIncrease'),
            onFocusDecrease: logVoid('onFocusDecrease'),
            onBlurIncrease: logVoid('onBlurIncrease'),
            onBlurDecrease: logVoid('onBlurDecrease'),
            onHoverIncrease: logHover('onHoverIncrease'),
            onHoverDecrease: logHover('onHoverDecrease'),
          },
        },
      }).id('norm_number_callbacks')
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          dateOptions: {
            year: 2025,
            month: 6,
            day: 5,
            onDateChange: (date: CounterV2DateData) => {
              console.info(`[CounterV2Norm] onDateChange ${date.toString()}`);
            },
            onHoverIncrease: logHover('date_onHoverIncrease'),
            onHoverDecrease: logHover('date_onHoverDecrease'),
          },
        },
      }).id('norm_date_callbacks')
      CounterV2Component({
        options: {
          type: CounterV2Type.LIST,
          numberOptions: {
            label: 'opts_num',
            value: 3,
            min: 0,
            max: 9,
            step: 1,
          },
        },
      }).id('norm_opts_number')
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          dateOptions: {
            year: 2024,
            month: 3,
            day: 18,
            onDateChange: (date: CounterV2DateData) => {
              console.info(`[CounterV2Norm] opts date ${date.toString()}`);
            },
          },
        },
      }).id('norm_opts_date')
    }
    .width('100%')
    .padding(12)
  }
}
