'use static';
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

import { ExtendableRow, RowOptions, Length, Entry, Component, Text, RowOptionsV2 } from '@kit.ArkUI';

class MyRow extends ExtendableRow {
  setRowOptions(options?: RowOptions | RowOptionsV2): this {
    super.setRowOptions(options);
    console.info('MyRow: setRowOptions');
    return this;
  }

  width(): this {
    super.width('70%');
    return this;
  }

  height(): this {
    super.height('60%');
    return this;
  }

  newAttribute(): this {
    super.height('50%');
    super.width('50%');
    return this;
  }
}

@Entry
@Component
struct ExtendableRowBuiltIn {
  build() {
    MyRow({ space: 100 } as RowOptions) {
      Text('Hello World')
        .height('5%')
    }
    .height()
    .border({ width: 2, color: '#6699FF' })
    .id('ExtendableRow_001')
    MyRow(undefined) {
      Text('Hello ArkUI')
        .height('5%')
        .margin('25%')
    }
    .height()
    .border({ width: 2, color: '#6699FF' })
    .id('ExtendableRow_002')
  }
}