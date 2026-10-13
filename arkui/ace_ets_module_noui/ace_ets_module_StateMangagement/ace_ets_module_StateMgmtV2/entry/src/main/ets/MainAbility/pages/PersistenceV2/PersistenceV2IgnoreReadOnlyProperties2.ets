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


import { PersistenceV2 } from '@kit.ArkUI';

@ObservedV2
export class SampleComputed {
  @Trace public value: number = 1;

  // @Computed为只读属性，需配合ignoreReadOnlyProperties使用
  get doubled(): number {
    return this.value * 2;
  }
}

@Entry
@ComponentV2
struct PersistenceV2IgnoreReadOnlyProperties2 {
  @Local sample: SampleComputed = PersistenceV2.globalConnect({
    type: SampleComputed,
    defaultCreator: () => new SampleComputed(),
    // 必须配置ignoreReadOnlyProperties: true，否则反序列化会因@Computed失败，导致应用crash
    ignoreReadOnlyProperties: true
  })!;

  build() {
    Column() {
      Text(`doubled value is ${this.sample.doubled}`)
        .id('IgnoreReadOnlyProperties2_001')
        .height('5%')
    }.width('100%')
  }
}