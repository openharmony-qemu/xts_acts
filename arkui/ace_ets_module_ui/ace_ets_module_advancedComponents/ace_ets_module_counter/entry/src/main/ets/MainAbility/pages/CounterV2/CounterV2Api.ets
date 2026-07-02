/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { CounterV2Type, CounterV2Component } from '@kit.ArkUI';

@Entry
@ComponentV2
struct CounterV2Api {
  @Local text1: string = 'ArkUI1'
  @Local text2: string = 'ArkUI2'

  build() {
    Column() {
      Text(this.text1).key('CounterV2ApiText1').height('5%')
      Text(this.text2).key('CounterV2ApiText2').height('5%')


      //列表型Counter
      CounterV2Component({
        options: {
          type: CounterV2Type.LIST,
          numberOptions: {
            label: '价格',
            min: 0,
            value: 5,
            max: 10,
            onFocusIncrease: () => {
              this.text1 = 'onFocusIncrease'
            },
            onBlurIncrease: () => {
              this.text1 = 'onBlurIncrease'
            },
            onFocusDecrease: () => {
              this.text2 = 'onFocusDecrease'
            },
            onBlurDecrease: () => {
              this.text2 = 'onBlurDecrease'
            },

          }
        }
      }).key('CounterV2Api1')
        .height('28%')

      //数值内联型Counter
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE,
          inlineOptions: {
            value: 100,
            min: 10,
            step: 2,
            max: 1000,
            textWidth: 100,
            onChange: (value: number) => {
              console.log('onDateChange Date: ' + value.toString());
            }
          }
        }
      }).key('CounterV2Api2')
        .height('28%')

      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          dateOptions: {
            year: 2016,
            onDateChange: () => {
            },
          },
        },
      }).key('CounterV2Api3')
        .height('28%')

    }
  }
}
