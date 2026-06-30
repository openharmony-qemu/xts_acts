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
struct CounterV2Direction {
  @Local currentDirection: Direction = Direction.Auto

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Row({ space: 8 }) {
          Button('Auto').id('Auto').onClick(() => {
            this.currentDirection = Direction.Auto;
          })
          Button('Rtl').id('Rtl').onClick(() => {
            this.currentDirection = Direction.Rtl;
          })
          Button('Ltr').id('Ltr').onClick(() => {
            this.currentDirection = Direction.Ltr;
          })
        }

        CounterV2Component({
          options: {
            direction: this.currentDirection,
            type: CounterV2Type.LIST,
            numberOptions: { label: '价格', min: 0, value: 5, max: 10 },
          },
        }).id('cv2_dir_list')

        CounterV2Component({
          options: {
            direction: this.currentDirection,
            type: CounterV2Type.COMPACT,
            numberOptions: { label: '数量', value: 10, min: 0, max: 100, step: 10 },
          },
        }).id('cv2_dir_compact')

        CounterV2Component({
          options: {
            direction: this.currentDirection,
            type: CounterV2Type.INLINE,
            inlineOptions: { value: 100, min: 10, step: 2, max: 1000, textWidth: 80 },
          },
        }).id('cv2_dir_inline')

        CounterV2Component({
          options: {
            direction: this.currentDirection,
            type: CounterV2Type.INLINE_DATE,
            dateOptions: {
              year: 2024,
              onDateChange: (date: CounterV2DateData) => {
                console.info('[ARKUI_DYN] dir date: ' + date.toString());
              },
            },
          },
        }).id('cv2_dir_date')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
