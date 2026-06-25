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
import { CounterV2Component, CounterV2Type, CounterV2DateData } from '@kit.ArkUI';

@Entry
@ComponentV2
struct CounterV2ComponentTest {
  @Local value1: string = ''
  @Local value2: string = ''
  @Local type: string = ''
  @Local mType: CounterV2Type = CounterV2Type.INLINE_DATE

  build() {
    Row() {
      Column({ space: 12 }) {
        Text(this.value1)
        Text(this.value2)
        Text(this.type)
          .id('type')
        CounterV2Component({
          options: {
            type: this.mType,
            dateOptions: {
              year: 2016,
              onDateChange: (date: CounterV2DateData) => {
                console.log('onDateChange Date: ' + date.toString());
              }
            }
          }
        })
        Button('click to show value')
          .id('btn')
          .onClick(() => {
            if (this.mType == CounterV2Type.INLINE_DATE) {
              this.type = 'INLINE_DATE'
            }
          })
      }.width('100%')
    }.height('100%')
  }
}
