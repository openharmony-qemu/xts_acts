'use static'
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
import { Entry, Component, Text, Column, ExtendableColumn, ColumnOptions, Length, LayoutPolicy,ColumnOptionsV2 } from '@ohos.arkui.component';

class MyColumn extends ExtendableColumn {
  // 通用属性
  setColumnOptions(options?: ColumnOptions | ColumnOptionsV2): this{
    super.setColumnOptions(options);
    // 添加自定义行为，如打印日志
    console.info('MyColumn: setColumnOptions');
    return this;
  }
  width(): this {
    super.width('100%');
    return this;
  }

  height(): this {
    super.height('100%');
    return this;
  }

  // 自定义属性
  newAttribute(): this {
    this.height('50%');
    this.width('30%');
    return this;
  }
}

@Entry
@Component
struct ExtendableColumnBuiltIn {
  build() {
    MyColumn({ space: 100 } as ColumnOptions) {
      Text('Hello World')
        .id('ExtendableColumn_001')
      Text('Hello ArkUI')
    }
    .newAttribute() // 调用自定义属性
    .id('ExtendableColumn_002')
    .margin(20)
    MyColumn(undefined) {
      Text('Hello ArkUI2')
        .id('ExtendableColumn_003')
    }
    .newAttribute() // 调用自定义属性
    .id('ExtendableColumn_004')
  }
}
