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

import { ExtendableStack, StackOptions, Length, LayoutPolicy, Entry, Component, Text, Column, Alignment } from '@kit.ArkUI';

class MyStack extends ExtendableStack {
  setStackOptions(options?: StackOptions): this {
    super.setStackOptions(options);
    console.info('MyRow: setRowOptions');
    return this;
  }

  width(): this {
    super.width('80%');
    return this;
  }

  height(): this {
    super.height('80%');
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
struct ExtendableStackBuiltInUndefined {
  build() {
    Column() {
      MyStack(undefined) {
        Text('Hello World')
          .width('90%')
          .height('100%')
          .backgroundColor(0xd2cab3)
      }
      .height('40%')
      .width()
      .id('ExtendableStack_undefined_001')
    }
  }
}