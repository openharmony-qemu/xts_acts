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

import { DatePickerComponent, DatePickerComponentOptions, DisplayMode } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerComponentConstructor {
  @State defaultCreated: string = 'DatePickerComponent_default_created';
  @State explicitCreated: string = 'DatePickerComponent_explicit_created';

  build() {
    Column({ space: 20 }) {
      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
        }
      })
        .id('datePickerComponent_default')
        .width('100%')
        .height('30%')

      Text(this.defaultCreated)
        .id('text_default_created')
        .fontSize(16)

      DatePickerComponent({
        options: {
          displayMode: DisplayMode.DATE,
          dateOptions: {
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: new Date('2025-06-01'),
          }
        }
      })
        .id('datePickerComponent_explicit')
        .width('100%')
        .height('30%')

      Text(this.explicitCreated)
        .id('text_explicit_created')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
